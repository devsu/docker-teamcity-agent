# Teamcity Agent docker image

Docker images for runnning Teamcity Agents. Teamcity is an awesome continuous integration server from JetBrains. 

To use an agent, you will need a Teamcity Server. You can use [Teamcity Server Docker Image](https://github.com/devsu/docker-teamcity-server) to create one.

## Teamcity Agent

### Usage

Make sure that your Teamcity Server is running. Then run:

`docker run -d -P --name teamcity-agent-1 --env TEAMCITY_SERVER="http://url-of-teamcity-server:8111" -v /your/path:/home/teamcity devsu/teamcity-agent:base`

Since the agent is downloaded from the running teamcity server, you don't have to worry on matching the versions of the agents with the servers. Actually, the tags on the agents are related to the versions of the additional packages that it includes.

You can take a look of the available variants at the tags page on Docker Hub.

### Variants

Since the agent can have many configurations, depending on the requirements, we have prepared a few images:

#### Base

It adds nothing but a script to download the agent from teamcity server, configure it and run it. Inspired on [centos7-teamcity-agent](https://bitbucket.org/ariya/docker-centos/src/2669cae3c4e7/centos7-teamcity-agent/?at=master).

## Under the hood

- The images are built from [java:8](https://github.com/docker-library/openjdk/blob/master/openjdk-8-jdk/Dockerfile) (installs unzip, openjdk-8-jdk)
- Which is built from [buildpack-deps:jessie-scm](https://github.com/docker-library/buildpack-deps/blob/master/jessie/scm/Dockerfile) (installs bzr, git, mercurial, openssh-client, subversion, procps)
- Which is built from [buildpack-deps:jessie-curl](https://github.com/docker-library/buildpack-deps/blob/master/jessie/curl/Dockerfile) (installs curl)
- Which is built from **debian:jessie**

## License

[GNU GPLv3](https://github.com/devsu/docker-teamcity-server/blob/master/LICENSE) © 2016, Devsu LLC