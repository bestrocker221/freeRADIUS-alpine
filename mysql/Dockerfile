FROM mysql:latest
LABEL maintainer="albertoscola221@gmail.com"

ARG MYSQL_CONTAINER_USER
ARG MYSQL_CONTAINER_GROUP
ARG MYSQL_DATA_DIR
ARG MYSQL_LOG_DIR
ARG RADIUS_USR_PASSWORD 
ARG RADIUS_VLAN1
ARG DB_VLAN1

COPY my.cnf /etc/my.cnf

COPY sql/*.sql /docker-entrypoint-initdb.d/
COPY certs/* /mysql-certs/

RUN mkdir ${MYSQL_LOG_DIR} && \
	usermod -u 1000 ${MYSQL_CONTAINER_USER} && \
 	groupmod -g 1000 ${MYSQL_CONTAINER_GROUP} && \
	chown ${MYSQL_CONTAINER_USER}:${MYSQL_CONTAINER_USER} -R ${MYSQL_DATA_DIR} ${MYSQL_LOG_DIR} /docker-entrypoint-initdb.d && \
	sed -i -e 's@RADIUS_USR_PASSWORD@'${RADIUS_USR_PASSWORD}'@g' /docker-entrypoint-initdb.d/radius_setup.sql && \
	sed -i -e 's@RADIUS_VLAN1@'${RADIUS_VLAN1}'@g' /docker-entrypoint-initdb.d/radius_setup.sql && \
	chown ${MYSQL_CONTAINER_USER}:${MYSQL_CONTAINER_USER} -R /mysql-certs/

EXPOSE 3306

#COPY start.sh /start.sh
#RUN chmod 750 /start.sh
#CMD /start.sh
