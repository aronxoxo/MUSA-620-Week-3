require 'selenium-webdriver'
require 'nokogiri'
require 'csv'
require 'orderedhash'
require 'csv2json'

# Initialize the selenium webdriver and use chrome as the browser
driver = Selenium::WebDriver.for :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate]

# Read in the Rittenhouse Condos' addresses and store them in a string with CSV2JSON gem
# Please store the rittenhouse-condos.csv under the same directory as the program
data = StringIO.new()
File.open('rittenhouse-condos.csv', 'r') {|input| CSV2JSON.parse(input, data)}
data.pos = 0

# The result containing address, market value, improvement area, and price per sq. ft should be an array of hashes
result = Array.new

# Parse the data to JSON and read each hash
# Use the selenium-webdriver gem to emulate the chrome browser, open websites, and submit forms with data from each hash
# Use the nokogiri gem to parse and search the HTML to acquire market value and area of each property
# Store the value and area with calculated unit price and original address in the result
JSON.parse(data.read).each do |hash|

  # Navigate to the website
  driver.navigate.to "http://property.phila.gov/"

  # Find the box for address input and put the address in from the hash
  address = driver.find_element(:css, '#search-address')
  address.send_keys(hash['address'])

  # Find the box for unit input and put the unit in from the hash
  unit = driver.find_element(:css, '#search-unit')
  unit.send_keys(hash['unit'].to_s)

  # Find the button for searching and click it
  search_button = driver.find_element(:css, '#maincontent > div.search-head > div:nth-child(1) > div.search-box.medium-16.columns > div.search > div.float-left.search-form-container > form:nth-child(1) > input[type="submit"]:nth-child(5)')
  search_button.click

  # Wait for the page to load
  sleep(3)

  # Find and store the entire HTML file
  dom = driver.find_element(:tag_name, 'html').attribute('outerHTML')

  # Use the nokogiri gem to parse the HTML
  html_doc = Nokogiri::HTML(dom)

  # Use the nokogiri gem to search for the market value and turn it to an integer
  value_s = html_doc.css('table.tablesaw tr').at(1).css('td span').at(1).text
  value = value_s.slice(1, value_s.length-1).split(',').join.to_i

  # Use the nokogiri gem to search for the improvement area and turn it to an integer
  area = html_doc.css('.medium-14 strong.stat').text.split(',').join.to_i

  # Print the address, market value, and area to the terminal
  puts "Address: #{hash['address'].to_s}, unit #{hash['unit'].to_s}"
  puts "Market value: #{value}"
  puts "Area: #{area}"
  puts ""

  # Store the scrapped market value and area along with the original address and calculated unit price to the result
  result.push({
    :address => hash['address'],
    :unit => hash['unit'],
    :market_value => value,
    :improv_area => area,
    :price_p_sqft => (value.to_f / area.to_f).round(3)
  })
end

# Put the result in a csv file in the same directory as the program
CSV.open("result.csv", "wb") do |csv|
  csv << result.first.keys # adds the attributes name on the first line
  result.each do |hash|
    csv << hash.values
  end
end

# Calculate the sum of unit price of all scapped properties
amount = result.inject(0) {|sum, hash| sum + hash[:price_p_sqft]}

# Print out the average property unit price
puts "The average price per square foot is: #{(amount/result.length).round(2)}"
