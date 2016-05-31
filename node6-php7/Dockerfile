FROM devsu/teamcity-agent:node6
MAINTAINER Cesar Salazar <csalazar@devsu.com>

# Install PHP7
RUN apt-get update \
    && apt-get install -y language-pack-en-base \
    && LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y php7.0 php7.0-fpm php7.0-mysql \
    && apt-get --purge autoremove -v \
    && rm -rf /var/lib/apt/lists/*
