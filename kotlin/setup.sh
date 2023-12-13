#!/bin/sh

set -e

KOTLIN_VERSION=1.9.21
KOTLIN_COMPLIER_ZIP=kotlin-compiler-$KOTLIN_VERSION.zip

wget https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/${KOTLIN_COMPLIER_ZIP} -P ~/Downloads -nc
sudo unzip ~/Downloads/$KOTLIN_COMPLIER_ZIP -d /tmp
if [ -e /opt/kotlinc-${KOTLIN_VERSION} ]; then
  echo "/opt/kotlinc-${KOTLIN_VERSION} already exists."
else
  sudo mv /tmp/kotlinc /opt/kotlinc-${KOTLIN_VERSION}
  if [ -e /opt/kotlinc ]; then
    sudo unlink /opt/kotlinc
  fi
  sudo ln -sFf /opt/kotlinc-${KOTLIN_VERSION} /opt/kotlinc

  sudo mkdir -p /usr/local/bin

  sudo ln -sf /opt/kotlinc/bin/kapt /usr/local/bin/kapt
  sudo ln -sf /opt/kotlinc/bin/kotlin /usr/local/bin/kotlin
  sudo ln -sf /opt/kotlinc/bin/kotlin-dce-js /usr/local/bin/kotlin-dce-js
  sudo ln -sf /opt/kotlinc/bin/kotlinc /usr/local/bin/kotlinc
  sudo ln -sf /opt/kotlinc/bin/kotlinc-js /usr/local/bin/kotlinc-js
  sudo ln -sf /opt/kotlinc/bin/kotlinc-jvm /usr/local/bin/kotlinc-jvm
fi
