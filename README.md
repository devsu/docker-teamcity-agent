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

Since the agent can have many configurations, depending on the requirements, we have prepared a few images:

- **base**: Adds a script to download the agent from teamcity server, configure it and run it. Inspired on [centos7-teamcity-agent](https://bitbucket.org/ariya/docker-centos/src/2669cae3c4e7/centos7-teamcity-agent/?at=master).
- **node4**: Adds nodejs 4, along with the 2 most popular task runners for node: Gulp and Grunt.
- **node4-ruby**: Built over the node4 variant, it also adds ruby and ruby-compass.
- **node4-ruby-php5**: Built over the node4-ruby variant, it also adds php5, php5-mongo and php5-mysql.
- **node5** Same as node4, except that it's using node 5.

## Under the hood

- The images are built from [java:8](https://github.com/docker-library/openjdk/blob/master/openjdk-8-jdk/Dockerfile) (installs unzip, openjdk-8-jdk)
- Which is built from [buildpack-deps:jessie-scm](https://github.com/docker-library/buildpack-deps/blob/master/jessie/scm/Dockerfile) (installs bzr, git, mercurial, openssh-client, subversion, procps)
- Which is built from [buildpack-deps:jessie-curl](https://github.com/docker-library/buildpack-deps/blob/master/jessie/curl/Dockerfile) (installs curl)
- Which is built from **debian:jessie**

## License

[GNU GPLv3](https://github.com/devsu/docker-teamcity-server/blob/master/LICENSE) © 2016, Devsu LLC