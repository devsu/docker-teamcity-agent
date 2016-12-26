FROM devsu/teamcity-agent:android
MAINTAINER Cesar Salazar <csalazar@devsu.com>

# Install nodejs 4, with build tools (build-essential)
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN apt-get install -y nodejs && rm -rf /var/lib/apt/lists/*

# Install popular task runners globally
RUN npm install -g grunt-cli gulp bower