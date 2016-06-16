# heikok/zookeeperDocker

**Zookeaper: A centralized synchronized Configuration Store**
ZooKeeper is a centralized service for maintaining configuration information, naming, providing distributed synchronization, and providing group services. https://zookeeper.apache.org

- [documentation](https://zookeeper.apache.org/doc/trunk/)

The docker image is based on AlpineLinux.

## Supported tags and Dockerfile links

-	[`0.1`, `lastest` (*Dockerfile*)](https://github.com/heikok/zookeaperDocker/blob/master/0.1/Dockerfile)

## Run Examples

### docker-cli
```
docker run \
	-v /var/zookeeper:/var/zookeeper \
	-v /opt/zookeeper/conf:/opt/zookeeper/conf \
	heikok/zk:0.1 \
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
    image: heikok/zk:v0.1
    hostname: zk1.evdeva27
    ports:
      - 2181:2181
      - 2888:2888
      - 3888:3888
    volumes:
      - /var/zookeeper:/var/zookeeper
      - /opt/zookeeper/conf:/opt/zookeeper/conf


```
