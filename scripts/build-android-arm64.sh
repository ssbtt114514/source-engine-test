#!/bin/sh

git submodule init && git submodule update

# 下载 NDK（r10e 也支持 arm64，但建议用更稳定的 r21e）
# 如果你坚持用 r10e，取消下面这行注释
# wget https://dl.google.com/android/repository/android-ndk-r10e-linux-x86_64.zip -o /dev/null

# 推荐：使用 r21e，对 arm64 支持更好
wget https://dl.google.com/android/repository/android-ndk-r21e-linux-x86_64.zip -o /dev/null
unzip -q android-ndk-r21e-linux-x86_64.zip
export ANDROID_NDK_HOME=$PWD/android-ndk-r21e/
export NDK_HOME=$PWD/android-ndk-r21e/

# 关键改动：--android=arm64-v8a,4.9,21
./waf configure -T debug --android=arm64-v8a,4.9,21 --togles --disable-warns &&
./waf build