# heikok/zookeeperDocker

**Zookeaper: A centralized synchronized Configuration Store**
ZooKeeper is a centralized service for maintaining configuration information, naming, providing distributed synchronization, and providing group services. https://zookeeper.apache.org

The docker image is based on AlpineLinux.

This image includes the log4j-extra package which includes for instance the bug-free RollingFileAppender. I have used also an predefined log4j.properties and overwrite the provided one from the zookeeper 3.4.8 version.

## Upcoming Features
For the next release it is planned to have a template engine in use when generating the docker image. Then it should be possible to parameterize the images.

## Supported tags and Dockerfile links

### Zookeeper 3.4.8 based
#### [`0.6`, `latest` (*Dockerfile*)](https://github.com/heikok/zookeaperDocker/blob/master/0.6/Dockerfile)
- changed to org.apache.log4j.EnhancedPatternLayout in log4j.properties to add timezone support for timestamps
#### [`0.5`, `latest` (*Dockerfile*)](https://github.com/heikok/zookeaperDocker/blob/master/0.5/Dockerfile)
## Run Examples

### docker-cli
```
docker run \
        -v /var/zookeeper:/var/zookeeper \
        -v /opt/zookeeper/conf:/opt/zookeeper/conf \
        quay.io/heikok/zookeeper:0.5 \
```
### Dockerfile
```Dockerfile
FROM heikok/filebeat
COPY log4j.properties /opt/zookeeper/conf
COPY zoo.cfg /opt/zookeeper/conf
```
### docker-compose
```yml
version "2"
services:
  zk:
    image: quay.io/heikok/zk:v0.5
    network_mode: host
    ports:
      - 2181:2181
      - 2888:2888
      - 3888:3888
    volumes:
      - /var/zookeeper:/var/zookeeper
      - /opt/zookeeper/conf/zoo.cfg:/opt/zookeeper/conf/zoo.cfg
```
