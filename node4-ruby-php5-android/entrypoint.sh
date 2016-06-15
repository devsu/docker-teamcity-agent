#!/bin/bash

rsync -ruvz /root/.android /home/teamcity/ --progress
chown -Rv teamcity:teamcity /home/teamcity/
chown -Rv teamcity:teamcity ${ANDROID_HOME}
bash /kvm-mknod.sh
su - teamcity -c "TEAMCITY_SERVER=$TEAMCITY_SERVER bash /start-agent.sh run"
