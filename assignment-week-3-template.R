library('RSelenium')
library(rvest)

#SET UP THE SELENIUM SERVER
#remDr <- ***Your Server Code***

#Launch the browser
remDr$open()

#Import the addresses
condos <- as.matrix(read.csv("d:/rittenhouse-condos.csv", sep=","))

scrapeCondoData <- function(addr,unit) {
  
  #REPLACE WITH YOUR SCRAPING CODE
  scrapedData <- paste("Scraped data for ",addr,", unit ", unit, sep="")
  
  return (scrapedData)
  
}

results <- mapply(scrapeCondoData, condos[,1],condos[,2] )

                         