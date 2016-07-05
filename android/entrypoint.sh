#!/bin/bash

rsync -ruz /root/.android /home/teamcity/
chown -R teamcity:teamcity /home/teamcity/
chown -R teamcity:teamcity ${ANDROID_HOME}
bash ${SCRIPTS}/kvm-mknod.sh
bash ${SCRIPTS}/start-emulator.sh
su - teamcity -c "TEAMCITY_SERVER=$TEAMCITY_SERVER PATH=${PATH} bash /start-agent.sh run"
