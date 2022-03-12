This readme is refers to the code associated with the Quality Data System.

The file titled tempdata.sql creates the TempData database that drives
the webpage. This creates the current tables, views, and constraints
referenced by the different functions on the webserver. This is expected
to run on a MariaDB instance and was built on version 10.4.19. Other
databases might be compatible, but these are untested and it is unrecommended
to use them. 

The folder contains the web application and is expected to be ran
on an Apache web server, such as one within an XAAMP or WAMP suite. It
was tested and built on version 2.4.47. Other webservers are not
tested. Whatever server that runs this application must be able to
run PHP code as the program is currently written utilizing PHP as the 
server side programming language. Certain files on this make reference to 
the database, which currently is being run on the same machine for testing 
purposes, but will be ran on a separate Raspberry Pi in production, so it 
is important to take care to validate that the connection strings point to 
the correct computer running the database instance.  

The password is password for all accounts currently. 