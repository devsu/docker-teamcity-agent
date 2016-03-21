FROM devsu/teamcity-agent:node4-ruby-php5
MAINTAINER Cesar Salazar <csalazar@devsu.com>

# ANDROID

# Dependencies
RUN dpkg --add-architecture i386
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes expect libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 libgl1-mesa-dev qemu-kvm libvirt-bin bridge-utils kmod

# Setup environment variables
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
ENV ADB_INSTALL_TIMEOUT=8

# Install Android SDK
RUN cd /opt && wget --output-document=android-sdk.tgz http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && tar xzf android-sdk.tgz && rm -f android-sdk.tgz

# We are using the tools2 folder to install the SDK elements because if we run the command from tools, it won't work.
RUN cp -r ${ANDROID_HOME}/tools ${ANDROID_HOME}/tools2

# Install SDK elements
RUN echo 'y' | ${ANDROID_HOME}/tools2/android update sdk --all --no-ui --filter platform-tools,tools,build-tools-23.0.2,android-23,extra-android-support,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services,addon-google_apis-google-23,extra-google-google_play_services,extra-google-play_apk_expansion,extra-google-play_billing,extra-google-play_licensing,extra-google-simulators,extra-google-webdriver,sys-img-armeabi-v7a-android-23,sys-img-x86_64-android-23,sys-img-armeabi-v7a-addon-google_apis-google-23,sys-img-x86_64-addon-google_apis-google-23

RUN rm -rf /opt/android-sdk-linux/tools
RUN unzip /opt/android-sdk-linux/temp/tools_r24.4.1-linux.zip -d /opt/android-sdk-linux
RUN rm -rf /opt/android-sdk-linux/temp/*

RUN which adb
RUN which android

# Create emulators
RUN echo "no" | /opt/android-sdk-linux/tools/android create avd --force --device "Nexus 5" --name myandroid-23-nexus5-x86 --target android-23 --abi x86_64 --skin WVGA800 --sdcard 512M -p /home/teamcity/.android/avd

RUN echo "no" | /opt/android-sdk-linux/tools/android create avd --force --device "Nexus 5" --name myandroid-23-nexus5 --target android-23 --abi armeabi-v7a --skin WVGA800 --sdcard 512M -p /home/teamcity/.android/avd

# Set teamcity as the owner of ANDROID folders
RUN chown -R teamcity:teamcity ${ANDROID_HOME}
RUN chown -R teamcity:teamcity /home/teamcity/.android