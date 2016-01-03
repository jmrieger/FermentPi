# FermentPi
Multiple vessel fermentation controller for the Raspberry Pi

# Specifications
Utilize the Laravel Framework, and by extension PHP, to build the core business logic.  No Arduino or other shields required.
Objected-oriented design will be used via the Laravel MVC framework to represent all physical aspects of the system (vessels, sensors, relays, indicator lights, basically anything physical or part of the I/O)
Specify fermentation schedule with multiple intervals, with a hard start date.  When fermentation is finished, the temperature on the last step shall be held until the schedule is marked as complete, ensuring no erroneous fluctuations of the beer.
Support import of BeerXML based recipe to create the fermentation schedule.
Log all configuration, sensor data, etc in sqlite 

# Long-term features
Support ThingSpeak API / accounts for remote monitoring of fermentations.

# Dependencies
Laravel 5.1
/ronanguilloux/php-gpio

# Reference Projects
https://github.com/ronanguilloux/temperature-pi


