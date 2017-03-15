# Web Scraping - Property Prices in Rittenhouse Square
This course project is written in Ruby to calculate the average price per square foot of condominiums on Rittenhouse Square (the orange buildings below) by scraping the Philadelphia Property Database.

![Rittenhouse Square](https://blueshift.io/rittenhouse.png "Rittenhouse Square Condominiums")

To calculate the average price per square foot for these homes, I scraped the [Philadelphia Property Database](http://property.phila.gov/).
- The list of condos (address and unit #) to be scraped are in the [rittenhouse-condos.csv](https://github.com/MUSA-620-Fall-2017/MUSA-620-Week-3/blob/master/rittenhouse-condos.csv) file.
- For the purposes of this project, I used the most recent Market Value as the price of the condo, as shown in the "VALUATION HISTORY" table. For the area of the condo, I used the field labeled "IMPROVEMENT AREA (SQFT)".


**R packages:**
- [Selenium documentation](https://cran.r-project.org/web/packages/RSelenium/RSelenium.pdf) - for remotely driving the browser
- [Rvest documentation](https://cran.r-project.org/web/packages/rvest/rvest.pdf) - for parsing html

**Setting up the Selenium Standalone Server (optional):**
- 1. Install Java JDK, following [these intructions for Windows](https://docs.oracle.com/javase/8/docs/technotes/guides/install/windows_jdk_install.html) or [these instructions for OS X](https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html). You can download the latest Java JDK version [here](http://www.oracle.com/technetwork/java/javase/downloads/index.html).
- 2. Download the latest version of the [Selenium Standalone Server](http://www.seleniumhq.org/download/).
- 3. If you do not already have it, install the latest version of [Firefox](https://www.mozilla.org/en-US/firefox/products/) (Firefox is the default browser for Selenium).
- 4. To start the server, open the command line (in Windows press Win+R then type "cmd", in OS X search for "terminal" in Spotlight). Go to the directory where the Selenium Standalone Server file is downloaded and run "java -jar selenium-server-standalone-3.0.1.jar".


If you are having problems getting the Selenium Standalone Server working, you can find more [information here](https://cran.r-project.org/web/packages/RSelenium/vignettes/RSelenium-basics.html). You are also welcome to email me with questions. However, this project is not meant to be an exercise in setting up servers, so if you are finding it overwhelming to set up the standalone server, you should just use [Sauce Labs](https://saucelabs.com/), as we did in class.

**Office Hours:**
Office hours are on Monday, 1pm to 4pm. Email me at galkamaxd at gmail to set schedule a time to discuss the project. You are also welcome to email me with questions at any time.
