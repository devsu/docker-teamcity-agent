#!/bin/bash

cp -rf /root/.android /home/teamcity/
chown -R teamcity:teamcity /home/teamcity/
bash /kvm-mknod.sh
su - teamcity -c "TEAMCITY_SERVER=$TEAMCITY_SERVER bash /start-agent.sh run"
