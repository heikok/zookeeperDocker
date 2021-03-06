FROM java:8-jre-alpine

MAINTAINER Heiko Kundlacz <heiko.kundlacz@gmail.com>

LABEL name="zookeeper" version=$VERSION

ARG ZOOKEEPER_HOME=/opt/zookeeper
ARG MIRROR=http://mirror.switch.ch/mirror/apache/dist
ARG VERSION=3.4.8

#COPY apache-log4j-extras-1.2.17.jar $ZOOKEEPER_HOME/lib/ 

RUN apk add --no-cache wget bash \
    && mkdir /opt \
    && wget -q -O - $MIRROR/zookeeper/zookeeper-$VERSION/zookeeper-$VERSION.tar.gz | tar -xzf - -C /opt \
    && ls -l /opt \
    && mv /opt/zookeeper-$VERSION $ZOOKEEPER_HOME \
    && ls -l $ZOOKEEPER_HOME/conf \
    && cp $ZOOKEEPER_HOME/conf/zoo_sample.cfg $ZOOKEEPER_HOME/conf/zoo.cfg \
    && rm $ZOOKEEPER_HOME/conf/log4j.properties \
    && mkdir -p /var/zookeeper

COPY apache-log4j-extras-1.2.17.jar $ZOOKEEPER_HOME/lib/ 

# Dependencies for jsonevent-layout
COPY jsonevent-layout-1.7.jar $ZOOKEEPER_HOME/lib/jsonevent-layout-1.7.jar 
COPY commons-lang-2.6.jar  $ZOOKEEPER_HOME/lib/commons-lang-2.6.jar 
COPY json-smart-1.1.1.jar  $ZOOKEEPER_HOME/lib/json-smart-1.1.1.jar 
COPY log4j.properties $ZOOKEEPER_HOME/conf/ 

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/var/zookeeper"]

ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh"]

CMD ["start-foreground"]
