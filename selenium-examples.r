library('RSelenium')

user <- "mgalka" # Your Sauce Labs Username
pass <- "4c080716-a10a-414f-894c-e108178b4de1" # Your Sauce Labs password

port <- 80
ip <- paste0(user, ':', pass, "@ondemand.saucelabs.com")
rdBrowser <- "chrome"
version <- "33"
platform <- "Windows 10"
extraCapabilities <- list(name = "RSelenium", username = user
                          , accessKey = pass, tags = list("RSelenium-vignette", "OS/Browsers-vignette"))
remDr <- remoteDriver$new(remoteServerAddr = ip, port = port, browserName = rdBrowser
                          , version = version, platform = platform
                          , extraCapabilities = extraCapabilities)




remDr$open()

remDr$navigate("https://blueshift.io/selectors.html")


#	#programming-languages > li.item.unordered-item.item3
#//*[@id="programming-languages"]/li[3]



#****SELECT BY TAG****
allListItems <- remDr$findElements("tag name","li")
unlist(lapply(allListItems, function(x){x$getElementText()}))


#****SELECT BY CLASS****
firstItems <- remDr$findElements("class name", "item1")
unlist(lapply(firstItems, function(x){x$getElementText()}))


#****SELECT BY ID****
fruitList <- remDr$findElement("id", "fruits")
fruitList$getElementText()


#****SELECT BY CSS SELECTOR****
#  Find the element with an id of "programming-languages". From its children, select the first one with a class name of "item2".
cssExample <- remDr$findElement("css selector", "#programming-languages > li.item.unordered-item.item3")
cssExample$getElementText()


#****SELECT BY XPATH****
#  Find the element with an id of "fruits", From its children, select the first "li" element.
xpathExample <- remDr$findElement(using = "xpath","//*[@id='fruits']/li[1]")
xpathExample$getElementText()


