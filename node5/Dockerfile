FROM devsu/teamcity-agent:base
MAINTAINER Cesar Salazar <csalazar@devsu.com>

# Install nodejs 5, with build tools
RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
RUN apt-get install -y nodejs build-essential

# Install popular task runners globally
RUN npm install -g grunt-cli gulp