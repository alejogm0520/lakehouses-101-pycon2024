FROM debian:bookworm-slim

RUN mkdir /home/PyCon2024
WORKDIR /home/PyCon2024

RUN apt-get clean all
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get update


ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install basic elements
RUN apt-get install curl wget git gcc make libffi-dev gnupg software-properties-common ssh pdsh -y
RUN apt-get install vim -y
RUN apt-get install cron -y

# Install Python
RUN apt-get update
RUN apt-get install python3  python3-full python3-dev python3-pip zip -y
RUN python3 -m venv /home/PyCon2024/venv

RUN apt-get install -y --no-install-recommends openjdk-17-jre
# TODO: Review JAVA_HOME
ADD config/docker/java_home.sh /etc/profile.d/java_home.sh
RUN chmod +x /etc/profile.d/java_home.sh
RUN echo 'export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")' >> /etc/profile
RUN echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile

ADD TempPackages/spark-3.5.1-bin-hadoop3.tgz /opt/
RUN mv /opt/spark-3.5.1-bin-hadoop3/ /opt/spark
ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
ENV SPARK_OPTS="--driver-java-options=-Xms1024M --driver-java-options=-Xmx4096M --driver-java-options=-Dlog4j.logLevel=info" \
    PATH="${PATH}:${SPARK_HOME}/bin"
RUN mkdir -p /tmp/spark-events
COPY config/spark/spark-defaults.conf $SPARK_HOME/conf/

ADD requirements.txt /home/PyCon2024/requirements.txt
RUN /home/PyCon2024/venv/bin/pip3 install -r /home/PyCon2024/requirements.txt


#RUN export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::"); echo $JAVA_HOME
#RUN apt-get install pipx -y
#RUN pipx ensurepath
# RUN ln -s /usr/bin/python3 /usr/bin/python

