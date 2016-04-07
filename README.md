<h1>Udacity FSND Project 5</h1>

<div>Server info:</div>
<ul>
    <li>IP address: 52.27.184.245</li>
    <li>SSH port: 2200</li>
    <li>URL: http://ec2-52-27-184-245.us-west-2.compute.amazonaws.com</li>
</ul>

<div>Software installed:</div>
<ul>
    <li>finger: For checking user info</li>
    <li>apache2: Web server</li>
    <li>pip: For easy installation of python modules</li>
    <li>pip - Flask: Web framework</li>
    <li></li>
</ul>

<div>Configurations made:</div>
<ul>
    <li>Since I chose to implement my own DAL for the catalog app instead of using SQLAlchemy, I had to go back and make a few code updates to facilitate the move from SQLite3 to postgresql.  These changes are visible in the revision history, but here's a quick summary:
        <ul>
            <li>Moved app configuration and launch into a new file, catalog.wsgi</li>
            <li>Updated the location of the client_secrets.json file in catalog.py</li>
            <li>Updated the DB setup scripts in catalog.sql to be postgres-compliant, added user-level permissions</li>
            <li>Updated the cursor helper method in dal.py to be postgres-compliant, including finding an alternative to the sqlite3.Row factory method</li>
            <li>Updated all parameterized query strings in dal.py to be postgres-compliant</li>
            <li>Updated datetime methods in dal.py to be postgres-compliant (required small changes in other modules as well)</li>
            <li>Updated insert queries in dal.py to use postgres-compliant auto-id numbering</li>
            <li>Removed DB setup script call from dal.py (the catalog user doesn't have permission to create tables, must be run as postgres root)</li>
            <li>Updated client ID on login page</li>
        </ul>
    </li>

    <li>Security updates:
        <ul>
            <li>(apt-get) Updated package list</li>
            <li>(apt-get) Installed all available updates (except one for grub, there was a message indicating it would overwrite some vendor-applied settings on the VM)</li>
            <li>Updated SSH port from 22 to 2200 in sshd_config</li>
            <li>### other sshd_config changes here ###</li>
            <li></li>
            <li></li>
            <li></li>

        </ul>
    </li>

    <li>System user updates:
        <ul>
            <li>Added system user 'grader'</li>
            <li>Granted grader sudo permission</li>
            <li>Created a new rsa keypair for grader, uploaded public key to ~grader/.ssh/authorized_keys, updated owner and chmod</li>
            <li>Changed password for grader</li>
            <li>Configured system firewall to allow only the following ports, then enabled it: 2200, 80, 123
        </ul>
    </li>

    <li>Apache updates:
        <ul>
            <li>Created fresh repository for project 5</li>
            <li>Created new folder on server in /var/www/html/fsndp5, used git pull to retrieve updated file set</li>
            <li>Updated client_secrets file (the old App Engine project had been deleted</li>
            <li>Updated /etc/apache2/sites-enabled/000-default.conf to use catalog.wsgi for dynamic content</li>
        </ul>
    </li>

    <li>Postgresql updates:
        <ul>
            <li>Created postgresql user 'catalog'</li>
            <li>Added new line to pg_hba.conf allowing catalog user to access the catalog db over local with md5 encryption</li>
            <li>Ran catalog.sql setup script as postgres user</li>
            <li>Ran dal.py in catalog directory to populate dummy DB values</li>
            <li></li>
        </ul>

    </li>

</ul>
    
