# FermentPi
Multiple vessel fermentation controller for the Raspberry Pi

# Specifications
* Utilize Python, Angular, and CouchDB+PouchDB to build the core business logic.  No Arduino or other shields *technically* required.
* https and login / authentication from the ground up
* PiFace Digital Revision 2 and a JBtek 8 Channel DV 5V Relay Module are recommended for ease of installation.
* Objected-oriented design will be used via the Flask framework to represent all physical aspects of the system (vessels, sensors, relays, indicator lights, basically anything physical or part of the I/O)
* Specify fermentation schedule with multiple intervals, with a hard start date.  When fermentation is finished, the temperature on the last step shall be held until the schedule is marked as complete, ensuring no erroneous fluctuations of the beer.
* Support import of BeerXML based recipe to create the fermentation schedule.
* Log all configuration, sensor data, etc in CouchDB
* Allow any of the bits of information to be sent to channel(s) on Dweet.io


# Long-term features
* Support ThingSpeak API / accounts for remote monitoring of fermentations.
* Build software in such a way that the same underlying PLC logic can be used to control the brewing process, in addition to fermentation.

# Dependencies
* Angular
* CouchDB
* Flask
* dweepy 
* python-dotenv


# Reference Projects
* https://github.com/ronanguilloux/temperature-pi
* http://code.activestate.com/recipes/577231-discrete-pid-controller/
* http://flask.pocoo.org/snippets/111/
