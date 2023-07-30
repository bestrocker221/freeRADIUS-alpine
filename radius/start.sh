#!/bin/sh




#
# Start filebeat.
#
#cd /tmp/filebeat-6.6.1-linux-x86_64 && export PATH=$PATH:`pwd`
#filebeat test config && \
#filebeat setup && \
#filebeat -e &




#
# Start radius.
#
chown -R radius /var/log/radius

cd /etc/raddb/mods-enabled 
ln -s ../mods-available/sql sql
ln -s ../mods-available/eap eap
ln -s ../mods-available/linelog linelog

rsyslogd

radiusd -X
