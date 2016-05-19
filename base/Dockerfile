FROM java:8
MAINTAINER Cesar Salazar <csalazar@devsu.com>

RUN apt-get update
RUN apt-get install -y sudo build-essential

RUN useradd -ms /bin/bash teamcity
ADD start-agent.sh /start-agent.sh

WORKDIR /home/teamcity
VOLUME /home/teamcity

EXPOSE 9090
CMD su - teamcity -c "TEAMCITY_SERVER=$TEAMCITY_SERVER bash /start-agent.sh run"
