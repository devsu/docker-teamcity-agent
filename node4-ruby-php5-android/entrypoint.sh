#!/bin/bash

cp -r /root/.android /home/teamcity/ >&2 /var/log/android.log
chown -R teamcity:teamcity /home/teamcity >&2 /var/log/android.log

/root/kvm-mknod.sh
su -c "TEAMCITY_SERVER=$TEAMCITY_SERVER bash /setup-agent.sh run" teamcity

