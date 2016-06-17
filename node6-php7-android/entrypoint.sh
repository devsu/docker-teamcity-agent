#!/bin/bash

rsync -ruz /root/.android /home/teamcity/
chown -R teamcity:teamcity /home/teamcity/
chown -R teamcity:teamcity ${ANDROID_HOME}
bash /kvm-mknod.sh
sudo -Eu teamcity bash -c 'TEAMCITY_SERVER=$TEAMCITY_SERVER PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools bash /start-agent.sh run'