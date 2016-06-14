#!/bin/bash
bash /kvm-mknod.sh
su - teamcity -c "TEAMCITY_SERVER=$TEAMCITY_SERVER bash /start-agent.sh run"
