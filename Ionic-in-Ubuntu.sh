#!/bin/bash
# Ubuntu Developer Script For Ionic Framework
# Created by Ugurcan Dede
# https://www.facebook.com/uqurcandede
#
#
# Downloads and configures the following:
#
#   Java JDK
#   Apache Ant
#   Android
#   NPM
#   Apache Cordova
#   Ionic Framework

# To install everything using the shell script I provided, download it and do the following:
#    chmod 775 Ionic-in-Ubuntu.sh
#    sudo ./Ionic-in-Ubuntu.sh

echo ""
echo ""
echo ""
echo "Password Correct! Installation has been started..."
echo ""
echo "When we install Ionic, sit back and relax."
echo ""
echo ""
echo ""
echo "-------------------------------------------------------"
echo "  Ubuntu Developer Script For Ionic Framework"
echo "           Created by Ugurcan Dede"
echo "             fb.me/uqurcandede"
echo "-------------------------------------------------------"
echo ""
echo ""
echo "-------------------------------------------------------"
echo "     Downloads and configures the following:"
echo "          .Java JDK"
echo "          .Apache Ant"
echo "          .Android"
echo "          .NPM"
echo "          .Apache Cordova"
echo "          .Ionic Framework"
echo ""
echo ""



HOME_PATH=$(cd ~/ && pwd)
INSTALL_PATH=/opt
ANDROID_SDK_PATH=/opt/android-sdk
NODE_PATH=/opt/node

# x86_64 or i686
LINUX_ARCH="$(lscpu | grep 'Architecture' | awk -F\: '{ print $2 }' | tr -d ' ')"

# Latest Android Linux SDK for x64 and x86 as of 7-5-2015
ANDROID_SDK_X64="http://dl.google.com/android/android-sdk_r24.2-linux.tgz"
ANDROID_SDK_X86="http://dl.google.com/android/android-sdk_r24.2-linux.tgz"

# Latest NodeJS for x64 and x86 as of 7-5-2015
NODE_X64="http://nodejs.org/dist/v4.4.5/node-v4.4.5-linux-x64.tar.gz"
NODE_X86="http://nodejs.org/dist/v4.4.5/node-v4.4.5-linux-x86.tar.gz"

if [ "$LINUX_ARCH" == "x86_64" ]; then
    # Add i386 architecture
    dpkg --add-architecture i386
fi

# Update all Ubuntu software repository lists
apt-get update

cd ~/Desktop

if [ "$LINUX_ARCH" == "x86_64" ]; then

    wget "$NODE_X64" -O "nodejs.tgz"
    wget "$ANDROID_SDK_X64" -O "android-sdk.tgz"

    tar zxf "nodejs.tgz" -C "$INSTALL_PATH"
    tar zxf "android-sdk.tgz" -C "$INSTALL_PATH"

    cd "$INSTALL_PATH" && mv "android-sdk-linux" "android-sdk"
    cd "$INSTALL_PATH" && mv "node-v5.1.0-linux-x64" "node"

    # Android SDK requires some x86 architecture libraries even on x64 system
    apt-get install -qq -y libc6:i386 libgcc1:i386 libstdc++6:i386 libz1:i386

else

    wget "$NODE_X86" -O "nodejs.tgz"
    wget "$ANDROID_SDK_X86" -O "android-sdk.tgz"

    tar zxf "nodejs.tgz" -C "$INSTALL_PATH"
    tar zxf "android-sdk.tgz" -C "$INSTALL_PATH"

    cd "$INSTALL_PATH" && mv "android-sdk-linux" "android-sdk"
    cd "$INSTALL_PATH" && mv "node-v5.1.0-linux-x86" "node"

fi

cd "$INSTALL_PATH" && chown root:root "android-sdk" -R
cd "$INSTALL_PATH" && chmod 777 "android-sdk" -R

cd ~/

# Add Android and NPM paths to the profile to preserve settings on boot
echo "export PATH=\$PATH:$ANDROID_SDK_PATH/tools" >> ".profile"
echo "export PATH=\$PATH:$ANDROID_SDK_PATH/platform-tools" >> ".profile"
echo "export PATH=\$PATH:$NODE_PATH/bin" >> ".profile"

# Add Android and NPM paths to the temporary user path to complete installation
export PATH=$PATH:$ANDROID_SDK_PATH/tools
export PATH=$PATH:$ANDROID_SDK_PATH/platform-tools
export PATH=$PATH:$NODE_PATH/bin

# Install JDK and Apache Ant
apt-get -qq -y install default-jdk ant

# Set JAVA_HOME based on the default OpenJDK installed
export JAVA_HOME="$(find /usr -type l -name 'default-java')"
if [ "$JAVA_HOME" != "" ]; then
    echo "export JAVA_HOME=$JAVA_HOME" >> ".profile"
fi

# Install Apache Cordova and Ionic Framework
npm install -g cordova
npm install -g ionic

cd "$INSTALL_PATH" && chmod 777 "node" -R

# Clean up any files that were downloaded from the internet
cd ~/Desktop && rm "android-sdk.tgz"
cd ~/Desktop && rm "nodejs.tgz"

echo "-------------------------------------------------------"
echo "           Thanks for using this script."
echo "-------------------------------------------------------"
echo ""
echo "              INSTALLATION COMPLETED!"
echo ""
echo "-------------------------------------------------------"
echo "Restart your Ubuntu session for installation to complete..."
echo ""
