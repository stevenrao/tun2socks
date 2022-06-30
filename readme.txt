### 介绍
整理 https://github.com/shadowsocks/shadowsocks-android 中 tun2socks 代码。

### 编译步骤
#### 一、 构建NDK 的docker 编译环境
docker build -t android-ndk:1.0.0 .

#### 二、运行docker，准备编译
cd  tun2socks
docker run -it -v $(pwd):/build android-ndk:1.0.0 bash


#### 三、编译
ndk-build NDK_PROJECT_PATH=. APP_BUILD_SCRIPT=./Android.mk  NDK_APPLICATION_MK=./Application.mk 
