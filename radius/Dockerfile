from alpine:latest
LABEL maintainer="albertoscola221@gmail.com"

RUN apk update && \
	apk add freeradius nano openssl freeradius-mysql shadow rsyslog freeradius-eap && \
	apk upgrade

ARG DB_VLAN1
ARG RADIUS_USR_PASSWORD
ARG REALM
ARG RADIUS_SECRET

COPY ./raddb/radiusd.conf /etc/raddb/radiusd.conf
COPY ./raddb/default /etc/raddb/sites-available/default
COPY ./raddb/inner-tunnel /etc/raddb/sites-available/inner-tunnel
COPY ./raddb/clients.conf /etc/raddb/clients.conf

#COPY ./raddb/proxy.conf /etc/raddb/proxy.conf
#COPY ./raddb/queries.conf /etc/raddb/mods-config/sql/main/mysql/queries.conf

COPY ./keys/ /etc/raddb/

COPY ./raddb/sql /etc/raddb/mods-available/sql
COPY ./raddb/eap /etc/raddb/mods-available/eap
COPY ./raddb/linelog /etc/raddb/mods-available/linelog
COPY ./raddb/rsyslog.conf /etc/rsyslog.conf



RUN sed -i -e 's@RADIUS_USR_PASSWORD@'${RADIUS_USR_PASSWORD}'@g' /etc/raddb/mods-available/sql && \
	sed -i -e 's@DB_VLAN1@'${DB_VLAN1}'@g' /etc/raddb/mods-available/sql && \
	sed -i -e 's@REALM@'${REALM}'@g' /etc/raddb/proxy.conf && \
	sed -i -e 's@RADIUS_SECRET@'${RADIUS_SECRET}'@g' /etc/raddb/clients.conf
	

COPY start.sh /
RUN chmod 750 /start.sh && \
	usermod -u 1000 radius && \
 	groupmod -g 1000 radius && \
 	chown radius:radius -R /var/log/radius /etc/raddb && \
 	echo "${DB_VLAN1}		mysql.acme.com" >> /etc/hosts


ENTRYPOINT ["/start.sh"]