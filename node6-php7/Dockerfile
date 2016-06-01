FROM devsu/teamcity-agent:node6
MAINTAINER Cesar Salazar <csalazar@devsu.com>

# Install PHP7
RUN echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list \
    && echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list \
    && wget https://www.dotdeb.org/dotdeb.gpg \
    && apt-key add dotdeb.gpg \
    && apt-get update \
    && apt-get install -y php7.0 php7.0-fpm php7.0-mysql \
    && rm -rf /var/lib/apt/lists/*