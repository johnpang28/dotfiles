#!/bin/sh

set -e

KOTLIN_VERSION=1.5.30
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

