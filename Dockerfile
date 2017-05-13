FROM debian:jessie

MAINTAINER BitWeb

## https://launchpad.net/~webupd8team/+archive/ubuntu/java

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list \
    && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
    && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 \
    && apt-get update \
    && apt-get -y install oracle-java8-installer \
    && apt-get -y install oracle-java8-set-default
    
ENV JAVA_TOOL_OPTIONS -Dfile.encoding=UTF8
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle/jre/

RUN java -version
