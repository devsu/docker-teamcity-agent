FROM devsu/teamcity-agent:node4-ruby-php5
MAINTAINER Cesar Salazar <csalazar@devsu.com>

ARG TERM=linux
ARG DEBIAN_FRONTEND=noninteractive

# ANDROID

# Dependencies
RUN dpkg --add-architecture i386
RUN apt-get update \
    && apt-get install -y --force-yes expect libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 libgl1-mesa-dev qemu-kvm libvirt-bin bridge-utils kmod \
    && rm -rf /var/lib/apt/lists/*

# Setup environment variables
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
ENV ADB_INSTALL_TIMEOUT=8

# Install Android SDK
RUN cd /opt && wget --output-document=android-sdk.tgz http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && tar xzf android-sdk.tgz && rm -f android-sdk.tgz

# 1. We are using the tools2 folder to install the SDK elements because if we run the command from tools, it won't work.
# TODO: Verify if this is still true
# 2. Install SDK elements using a hack to accept the licenses

RUN cp -r ${ANDROID_HOME}/tools ${ANDROID_HOME}/tools2 \
    && ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | ${ANDROID_HOME}/tools2/android update sdk --no-ui \
    && rm -rf /opt/android-sdk-linux/tools \
    && unzip /opt/android-sdk-linux/temp/tools_*.zip -d /opt/android-sdk-linux \
    && rm -rf /opt/android-sdk-linux/temp/* \
    && rm -rf ${ANDROID_HOME}/tools2

RUN which adb
RUN which android

# Create emulators
RUN echo "no" | /opt/android-sdk-linux/tools/android create avd --force --device "Nexus 5" --name myandroid-23-nexus5-x86 --target android-23 --abi x86_64 --skin WVGA800 --sdcard 512M -p /home/teamcity/.android/avd

RUN echo "no" | /opt/android-sdk-linux/tools/android create avd --force --device "Nexus 5" --name myandroid-23-nexus5 --target android-23 --abi armeabi-v7a --skin WVGA800 --sdcard 512M -p /home/teamcity/.android/avd

# Set teamcity as the owner of ANDROID folders
RUN chown -R teamcity:teamcity ${ANDROID_HOME}
RUN chown -R teamcity:teamcity /home/teamcity/.android