FROM devsu/teamcity-agent:node0.10
MAINTAINER Cesar Salazar <csalazar@devsu.com>

# Install meteor
RUN curl https://install.meteor.com/ | sh
RUN su - teamcity -c "meteor --version"