FROM ubuntu:20.04

RUN sed -i 's/http:\/\/archive\.ubuntu\.com\/ubuntu\//http:\/\/mirrors\.163\.com\/ubuntu\//g' /etc/apt/sources.list
RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata vim
RUN mkdir /build && cd /build \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime  \
    && echo "Asia/Shanghai" > /etc/timezone
RUN apt-get install -y make wget cmake git autoconf automake libtool file
RUN apt-get install -y android-tools-adb
RUN apt-get install -y unzip
RUN echo no | dpkg-reconfigure dash
RUN wget -c https://dl.google.com/android/repository/android-ndk-r23c-linux.zip -O /tmp/android-ndk-r23c-linux.zip
RUN unzip /tmp/android-ndk-r23c-linux.zip -d /opt/
RUN rm /tmp/android-ndk-r23c-linux.zip

# 配置NDK的目录
ENV NDK_HOM=/opt/android-ndk-r23c
# 将NDK目录加入PATH中
ENV PATH=PATH=${PATH}:$NDK_HOM

WORKDIR /build

