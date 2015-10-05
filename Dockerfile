FROM centos:7

MAINTAINER Jef Verelst, https://github.com/kullervo16

RUN yum install -y unzip java-1.7.0-openjdk java-1.7.0-openjdk && yum clean all

ADD mamute-1.3.0.war /opt/mamute/
WORKDIR /opt/mamute
RUN unzip /opt/mamute/mamute-1.3.0.war
ADD postgresql-9.4-1203.jdbc41.jar /opt/mamute/WEB-INF/lib/
ADD startup.sh /opt/mamute/
RUN chmod +x /opt/mamute/*.sh
ADD hibernate.cfg.xml /opt/mamute/WEB-INF/classes/development/hibernate.cfg.tmp

EXPOSE 8080
ENTRYPOINT ["/opt/mamute/startup.sh"]

# variables to specify at startup
#ENV DB_HOST the host that runs the database
ENV DB_PORT 5432
#ENV DB_USER the user to connect to the DB
#ENV DB_PWD  the password
#ENV DB_NAME the database name
