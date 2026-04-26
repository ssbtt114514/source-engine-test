#!/bin/sh

git submodule init && git submodule update

# 下载 NDK r21e（对 arm64 支持更好）
wget https://dl.google.com/android/repository/android-ndk-r21e-linux-x86_64.zip -O /dev/null
unzip -q android-ndk-r21e-linux-x86_64.zip
export ANDROID_NDK_HOME=$PWD/android-ndk-r21e/
export NDK_HOME=$PWD/android-ndk-r21e/

# 关键：使用 arm64-v8a 架构
./waf configure -T debug --android=arm64-v8a,4.9,21 --togles --disable-warns &&
./waf build