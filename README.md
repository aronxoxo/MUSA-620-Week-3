# MUSA620-Week-3
Working with Census data ([notes]())

The raw microdata used in the microdata.r script can be downloaded here: [usa_00051.dat](https://drive.google.com/file/d/0B7vEPueW9lKEdEI5c3JDRVE4WjQ/view?usp=sharing).



R packages:
- [Selenium]() - for remotely driving the browser
- [Rvest](https://cran.r-project.org/web/packages/rvest/rvest.pdf) - for parsing html

Setting up the Selenium Standalone Server (optional):
- 1. Install Java JDK, following [these intructions for Windows](https://docs.oracle.com/javase/8/docs/technotes/guides/install/windows_jdk_install.html) or [these instructions for OS X](https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html). You can download the latest Java JDK version [here](http://www.oracle.com/technetwork/java/javase/downloads/index.html).
- 2. Download the latest version of the [Selenium Standalone Server](http://www.seleniumhq.org/download/).
- 3. To start the server, open the command line (in Windows press Win+R then type "cmd", in OS X search for "terminal" in Spotlight). Go to the directory where the Selenium Standalone Server file is downloaded and run "java -jar selenium-server-standalone-3.0.1.jar".

If you are having problems getting the Selenium Standalone Server working, you are welcome to email me with questions. Or you can just use [Sauce Labs](https://saucelabs.com/) instead, as we did in class.

Map Simplification:
- [Mapshaper](http://www.mapshaper.org/) - great tool for reducing the size of large GIS files. Before using, it is usually best to make sure your file uses the standard latitude, longitude coordinate system (WGS 84), and is in GEOJSON format (otherwise your attribute table may be lost).


# Assignment

This is the first required assignment of the course, and it will require you go beyond the topics discussed in class. You may turn it in by email (galkamaxd at gmail) or in person at class.

**Due:** by the end of class next week, 8-Feb

**Task:** Calculate the price per square foot of condominiums on Rittenhouse Square (the orange buildings).

![Rittenhouse Square](https://blueshift.io/rittenhouse.png "Rittenhouse Square Condominiums")

**Deliverable:** The average price per square foot based on your calculations. Please also include all R scripts used in scraping and analyzing the data, as well as information about any other tools / applications used outside of R.

To calculate the average price per square foot for these homes, you will need to scrape the [Philadelphia Property Database](http://property.phila.gov/). 
- Downloading the raw data using [IPUMS](https://usa.ipums.org/usa/)
- Putting it into a usable format and calculating summary-level stats. The R scripts here may be helpful, though you are welcome to use other tools/applications instead, such as Excel, Access, or ArcGIS.
- Joining the summary-level data to a GIS boundary file. You may need to create a "GeoID" or similar field in one of the two files. Data joins are a simple but important concept, which we will be using throughout the course.

The choice of Census variable and geographic level is up to you. Keep in mind that if you choose smaller geographic areas, such as counties, some of the locations may be suppressed and parts of your map will be empty.


