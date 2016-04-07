<h1>Udacity FSND Project 5</h1>

<div>Server info:</div>
<ul>
    <li>IP address: 52.27.184.245</li>
    <li>SSH port: 2200</li>
    <li>URL: http://ec2-52-27-184-245.us-west-2.compute.amazonaws.com</li>
</ul>

<div>Software installed:</div>
<ul>
    <li></li>
</ul>

<div>Configurations made:</div>
<ul>
    <li>Since I chose to implement my own DAL for the catalog app instead of using Flask, I had to go back and make some updates to facilitate the move from SQLite3 to postgresql.  These changes are visible in the revision history, but here's a quick summary:</li>
    <li>
        <ul>
            <li>Updated the location of the client_secrets.json file</li>
            <li>Moved app configuration and launch into a new file, catalog.wsgi</li>
            <li>Updated the DB setup scripts in catalog.sql to be postgres-compliant, added user-level permissions</li>
            <li>Updated the cursor helper method in dal.py to be postgres-compliant, including finding an alternative to the sqlite3.Row factory method</li>
            <li>Updated all parameterized query strings in dal.py to be postgres-compliant</li>
            <li>Updated datetime methods in dal.py to be postgres-compliant (required small changes in other modules as well)</li>
            <li>Updated insert queries in dal.py to use postgres-compliant auto-id numbering</li>
            <li>Removed DB setup script call from dal.py (the catalog user doesn't have permission to create tables, must be run as postgres root)</li>
            <li>Updated client ID on login page</li>
        </ul>
    </li>

</ul>
    
