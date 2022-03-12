This readme details integration testing to verify the different components are talking correctly within
the system. 

First, the file connectionTest.php can be placed on the webserver. When ran, this file
will attempt to ping the database server 4 times. If unsuccessful, the host may
be unreachable. Then, this file will attempt to connect to the database. It will echo 
either "Connection succeeded!" or "Connection failed!" depending on whether it can get 
into the database successfully.

A ping failure might indicate the database PC is offline or unreachable. The database not 
connecting would indicate the database is not reachable or the account has bad credentials. 
The ping may also fail if the webserver does not have access to the system of the computer
it is running on, which it shouldn't unless this is being tested. 