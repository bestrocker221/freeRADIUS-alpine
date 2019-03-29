# -*- text -*-
##
## admin.sql -- MySQL commands for creating the RADIUS user.
##
##      WARNING: You should change 'localhost' and 'radpass'
##               to something else.  Also update raddb/sql.conf
##               with the new RADIUS password.
##
##      $Id: aff0505a473c67b65cfc19fae079454a36d4e119 $

#
#  Create default administrator for RADIUS
#
CREATE USER 'radius'@'RADIUS_VLAN1';
#SET PASSWORD FOR 'radius'@'RADIUS_VLAN1' = PASSWORD('RADIUS_USR_PASSWORD');
SET PASSWORD FOR 'radius'@'RADIUS_VLAN1' = 'RADIUS_USR_PASSWORD';

ALTER USER 'radius'@'RADIUS_VLAN1' IDENTIFIED WITH mysql_native_password BY 'RADIUS_USR_PASSWORD';

# The server can read any table in SQL
GRANT SELECT ON radius.* TO 'radius'@'RADIUS_VLAN1';

# The server can write to the accounting and post-auth logging table.
#
#  i.e.
GRANT ALL on radius.radacct TO 'radius'@'RADIUS_VLAN1';
GRANT ALL on radius.radpostauth TO 'radius'@'RADIUS_VLAN1';

INSERT into radius.radcheck (username,attribute,op,value) values("test@acme.com", "Cleartext-Password", ":=", "test");
INSERT into radius.radcheck (username,attribute,op,value) values("carlo@acme.com", "SSHA2-256-Password", ":=", "eje4XIkY6sGakInA+loqtNzj+QUo3N7sEIsj3fNge5lzYWx0");
INSERT into radius.radcheck (username,attribute,op,value) values("test2@acme.com", "SSHA2-256-Password", ":=", "ag6J2U52nmn7gkQM2h4eXEYQnHON7W9DyyGKxUSiAsFzYWx0c2FsdHNhbHQ=");

# router
INSERT into radius.radcheck (username,attribute,op,value) values("stock-router@acme.com", "SSHA2-256-Password", ":=", "ag6J2U52nmn7gkQM2h4eXEYQnHON7W9DyyGKxUSiAsFzYWx0c2FsdHNhbHQ=");
INSERT into radius.radcheck (username,attribute,op,value) values("london-router@acme.com", "SSHA2-256-Password", ":=", "ag6J2U52nmn7gkQM2h4eXEYQnHON7W9DyyGKxUSiAsFzYWx0c2FsdHNhbHQ=");



FLUSH PRIVILEGES;
