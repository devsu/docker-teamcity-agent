#!/bin/bash

rsync -ruz /root/.android /home/teamcity/
chown -R teamcity:teamcity /home/teamcity/
chown -R teamcity:teamcity ${ANDROID_HOME}
bash ${SCRIPTS}/kvm-mknod.sh
chown teamcity /dev/kvm
su - teamcity -c "TEAMCITY_SERVER=$TEAMCITY_SERVER PATH=${PATH} bash /start-agent.sh run"
