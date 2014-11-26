FROM ubuntu:14.04
MAINTAINER Peter Jerold Leslie <jeroldleslie@gmail.com>

RUN apt-get update && apt-get install -y openjdk-7-jdk wget
RUN rm -rf /var/lib/apt/lists/*
RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | tar -xzf - -C /opt
RUN mv /opt/zookeeper-3.4.6 /opt/zookeeper
RUN cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg
RUN mkdir -p /tmp/zookeeper

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

EXPOSE 2181 2888 3888


#VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

#ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh", "start"]
#CMD ["/opt/zookeeper/bin/zkServer.sh", "start"]
