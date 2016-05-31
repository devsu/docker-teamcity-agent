FROM devsu/teamcity-agent:base
MAINTAINER Cesar Salazar <csalazar@devsu.com>

ENV NODE_VERSION=0.10.44
ENV NODE_ARCH=x64
ENV NODE_DIST=node-v${NODE_VERSION}-linux-${NODE_ARCH}

RUN cd /tmp \
    && curl -O -L http://nodejs.org/dist/v${NODE_VERSION}/${NODE_DIST}.tar.gz \
    && tar xvzf ${NODE_DIST}.tar.gz \
    && rm -rf /opt/nodejs \
    && mv ${NODE_DIST} /opt/nodejs

RUN ln -sf /opt/nodejs/bin/node /usr/bin/node
RUN ln -sf /opt/nodejs/bin/npm /usr/bin/npm

# Install popular task runners globally
RUN npm install -g grunt-cli gulp bower
