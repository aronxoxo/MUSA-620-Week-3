# Web Scraping - Property Prices in Rittenhouse Square
This course project is written in Ruby taking the advantage of Selenium Server's power to emulate the web browser to scrap the Philadelphia Property Database and calculate the average price per square foot of condominiums on Rittenhouse Square (the orange buildings below).

![Rittenhouse Square](https://blueshift.io/rittenhouse.png "Rittenhouse Square Condominiums")

To calculate the average price per square foot for these homes, I scraped the [Philadelphia Property Database](http://property.phila.gov/).
- The list of condos (address and unit #) to be scraped are in the [rittenhouse-condos.csv](https://github.com/MUSA-620-Fall-2017/MUSA-620-Week-3/blob/master/rittenhouse-condos.csv) file.
- For the purposes of this project, I used the most recent Market Value as the price of the condo, as shown in the "VALUATION HISTORY" table. For the area of the condo, I used the field labeled "IMPROVEMENT AREA (SQFT)".

**Packages Used:**
- [Selenium Webdriver Ruby Binding](https://rubygems.org/gems/selenium-webdriver) - for driving the browser
- [Nokogiri](https://github.com/sparklemotion/nokogiri) - for reading and parsing html
