#!/bin/sh

set -e

KOTLIN_VERSION=1.3.61
KOTLIN_COMPLIER_ZIP=kotlin-compiler-$KOTLIN_VERSION.zip
KOTLIN_NATIVE_TAR=kotlin-native-macos-${KOTLIN_VERSION}.tar.gz

wget https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/${KOTLIN_COMPLIER_ZIP} -P ~/Downloads -nc
sudo unzip ~/Downloads/$KOTLIN_COMPLIER_ZIP -d /tmp
sudo mv /tmp/kotlinc /opt/kotlinc-${KOTLIN_VERSION}
sudo ln -s /opt/kotlinc-${KOTLIN_VERSION} /opt/kotlinc
sudo ln -s /opt/kotlinc/bin/kapt /usr/local/bin/kapt
sudo ln -s /opt/kotlinc/bin/kotlin /usr/local/bin/kotlin
sudo ln -s /opt/kotlinc/bin/kotlin-dce-js /usr/local/bin/kotlin-dce-js
sudo ln -s /opt/kotlinc/bin/kotlinc /usr/local/bin/kotlinc
sudo ln -s /opt/kotlinc/bin/kotlinc-js /usr/local/bin/kotlinc-js
sudo ln -s /opt/kotlinc/bin/kotlinc-jvm /usr/local/bin/kotlinc-jvm

wget https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/${KOTLIN_NATIVE_TAR} -P ~/Downloads -nc
sudo tar -xvzf ~/Downloads/$KOTLIN_NATIVE_TAR -C /tmp
sudo mv /tmp/kotlin-native-macos-${KOTLIN_VERSION} /opt
sudo ln -s /opt/kotlin-native-macos-${KOTLIN_VERSION} /opt/kotlin-native-macos
sudo ln -s /opt/kotlin-native-macos/bin/cinterop /usr/local/bin/cinterop
sudo ln -s /opt/kotlin-native-macos/bin/jsinterop /usr/local/bin/jsinterop
sudo ln -s /opt/kotlin-native-macos/bin/klib /usr/local/bin/klib
sudo ln -s /opt/kotlin-native-macos/bin/konan-lldb /usr/local/bin/konan-lldb
sudo ln -s /opt/kotlin-native-macos/bin/konanc /usr/local/bin/konanc
sudo ln -s /opt/kotlin-native-macos/bin/kotlinc-native /usr/local/bin/kotlinc-native
sudo ln -s /opt/kotlin-native-macos/bin/run_konan /usr/local/bin/run_konan