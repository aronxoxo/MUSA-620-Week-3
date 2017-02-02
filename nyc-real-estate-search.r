#SEARCH NYC REAL ESTATE RECORDS BY NAME

library('RSelenium')
library('rvest')


#### CONNECTING VIA SAUCE LABS SERVER
# saucelabs.com

#user <- "mgalka" # Your Sauce Labs Username
#key <- "4c080716-XXXX-414f-894c-e108178b4de1" # Your Sauce Labs access key (should be in a form similar to this one)
#port <- 80
#ip <- paste0(user, ':', key, "@ondemand.saucelabs.com")
#rdBrowser <- "chrome" #The brower, version and platform here were chosen arbitrarily. Choose another if you want: https://saucelabs.com/platforms
#version <- "33"
#platform <- "Windows 10"
#extraCapabilities <- list(name = "RSelenium", username = user
#                          , accessKey = key, tags = list("RSelenium-vignette", "OS/Browsers-vignette"))
#remDr <- remoteDriver$new(remoteServerAddr = ip, port = port, browserName = rdBrowser
#                          , version = version, platform = platform
#                          , extraCapabilities = extraCapabilities)



#### CONNECTING VIA LOCAL SERVER
# SETTING UP THE STANDALONE SERVER
# 1. Install Java JDK
# 2. Download Selenium standalone server: http://www.seleniumhq.org/download/
# 3. Start the server in command line:  java -jar selenium-server-standalone-3.0.1.jar
#
# For more detailed instructions see: https://github.com/MUSA-620-Fall-2017/MUSA-620-Week-3/

remDr <- remoteDriver(browserName="firefox", port=4444)





remDr$open()

remDr$navigate("https://a836-acris.nyc.gov/DS/DocumentSearch/PartyName")

#Select the Last Name search box
lastNameField <- remDr$findElement("xpath","/html/body/div/table[4]/tbody/tr/td/div/table[2]/tbody/tr/td/table/tbody/tr/td[1]/form/table[1]/tbody/tr[2]/td/table/tbody/tr[2]/td[3]/font/input")

#Type in the search text ("trump") and press enter
lastNameField$sendKeysToElement(list('trump', ''))
lastNameField$sendKeysToElement(list(key = 'enter'))

#Wait a few seconds for the results to load
Sys.sleep(3)

#Increase the number of search results per page
maxrows <- remDr$findElement("css selector","body > form:nth-child(6) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) > font:nth-child(1) > select:nth-child(3)")
maxrows$clickElement()

maxrows99 <- remDr$findElement("css selector","body > form:nth-child(6) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) > font:nth-child(1) > select:nth-child(3) > option:nth-child(4)")
maxrows99$clickElement()

#Wait for the new results to load
Sys.sleep(2)

#extract the DOM, so that it can be parsed using rvest
dom = read_html(remDr$findElement("css selector", "html")$getElementAttribute("innerHTML")[[1]])

#extract the table containing the results
resultstable <- dom %>%
  html_nodes("body > form:nth-child(6) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(1) > table:nth-child(1)") %>%
  html_table(fill = TRUE)



#We now have the first page of results. IF you wanted to continue, you could set up a loop (go to the next page of results and repeat)

nextPage <- remDr$findElement("css selector","body > form:nth-child(6) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) > font:nth-child(1) > u:nth-child(2) > a:nth-child(1) > font:nth-child(1)")
nextPage$clickElement()
  


