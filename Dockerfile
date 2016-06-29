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
    && mv /opt/zookeeper-$VERSION /opt/zookeeper \
    && ls -l /opt/zookeeper/conf \
    && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg \
    && mkdir -p /var/zookeeper
COPY apache-log4j-extras-1.2.17.jar $ZOOKEEPER_HOME/lib/ 
COPY log4j.properties $ZOOKEEPER_HOME/conf/ 

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "/var/zookeeper"]

ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh"]

CMD ["start-foreground"]
