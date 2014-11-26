FROM ubuntu:14.04
MAINTAINER Peter Jerold Leslie <jeroldleslie@gmail.com>
RUN apt-get update && apt-get install -y openjdk-7-jdk wget openssh-server nano

RUN mkdir /var/run/sshd
RUN echo 'root:kafka' | chpasswd

RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile


RUN wget -q http://apache.communilink.net/kafka/0.8.1.1/kafka_2.9.2-0.8.1.1.tgz -O /tmp/kafka_2.9.2-0.8.1.1.tgz
RUN tar xfz /tmp/kafka_2.9.2-0.8.1.1.tgz -C /opt
RUN mv /opt/kafka_2.9.2-0.8.1.1 /opt/kafka

ADD replace.sh /opt/kafka/config/replace.sh
RUN chmod +x /opt/kafka/config/replace.sh


ENV KAFKA_HOME /opt/kafka_2.9.2-0.8.1.1

EXPOSE 2181 9092 22

#WORKDIR /opt/zookeeper

#VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

#ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh", "start"]
#CMD ["start-foreground"]
#CMD ["/opt/zookeeper/bin/zkServer.sh start"]
CMD ["/usr/sbin/sshd", "-D"]
#CMD ["/opt/zookeeper/bin/zkServer.sh", "start"]
#CMD ["/opt/kafka/config/replace.sh"]
