# Teamcity Agent docker image

Docker images for runnning Teamcity Agents. Teamcity is an awesome continuous integration server from JetBrains. 

To use an agent, you will need a Teamcity Server. You can use [Teamcity Server Docker Image](https://github.com/devsu/docker-teamcity-server) to create one.

## Teamcity Agent

### Usage

Make sure that your Teamcity Server is running, and you finished the install process. Then run:

`docker run -d -P --name teamcity-agent-1 --env TEAMCITY_SERVER="http://url-of-teamcity-server:8111" -v /your/path:/home/teamcity devsu/teamcity-agent:base`

Make sure to change the URL of teamcity as well as the folder of the volume. If the agent can't write on that folder, it will fail to run.

Since the agent is downloaded from the running teamcity server, you don't have to worry on matching the versions of the agents with the servers. Actually, we are not managing any versions for the agents.

### Variants

Since the agent can have many configurations, depending on the requirements, we have prepared a few images.

We added each technology in top of the previous, because usually we want the teamcity agent to be able to work with multiple technologies. For example you can have an angular app (so you need node.js and gulp to compile it), and a PHP app (which might need ruby/compass to compile the styles).

We started adding first the technologies that provide most popular task runners. (Java is already installed in the base image, so we don't consider it as a variant).

All the images are built on top of the **base** variant.

The **base** variant adds a script to download the agent from teamcity server, configure it and run it. Inspired on [centos7-teamcity-agent](https://bitbucket.org/ariya/docker-centos/src/2669cae3c4e7/centos7-teamcity-agent/?at=master).

The folder names of the other variants are self explanatory, and you can take a look to their Dockerfiles to see what they add.

## Under the hood

- The images are built from [java:8](https://github.com/docker-library/openjdk/blob/master/openjdk-8-jdk/Dockerfile) (installs unzip, openjdk-8-jdk)
- Which is built from [buildpack-deps:jessie-scm](https://github.com/docker-library/buildpack-deps/blob/master/jessie/scm/Dockerfile) (installs bzr, git, mercurial, openssh-client, subversion, procps)
- Which is built from [buildpack-deps:jessie-curl](https://github.com/docker-library/buildpack-deps/blob/master/jessie/curl/Dockerfile) (installs curl)
- Which is built from **debian:jessie**

## License

[GNU GPLv3](https://github.com/devsu/docker-teamcity-server/blob/master/LICENSE) © 2016, Devsu LLC