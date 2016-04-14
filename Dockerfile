FROM ubuntu:15.10
MAINTAINER Ethan Jones <ethan@dpg.io> 

# Freshen system.
RUN apt-get -qq update; apt-get dist-upgrade -y; apt-get install curl -y

# Adds gitlab runner repo, keys, user, etc. (Needs curl!)
RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | bash

# Install all nessicary packages and depends.
RUN apt-get install wget tar unzip openjdk-8-jdk openjdk-8-jre lib32stdc++6 lib32z1 gitlab-ci-multi-runner -y

#-- Android SDK Portion (Very Long!) --# 

# Proper directories, permissions and setting it as a volume.
RUN mkdir -p /home/gitlab-runner/gradle; chown -R gitlab-runner:gitlab-runner /home/gitlab-runner/
VOLUME /home/gitlab-runner/
WORKDIR /home/gitlab-runner

# Weird java bug with keys.
RUN rm -rf /etc/ssl/certs/java/cacerts; /var/lib/dpkg/info/ca-certificates-java.postinst configure

#-- GitLab Runner Portion --#

# Add start up script!
COPY start.sh /home/gitlab-runner/start.sh

# Starting CMD
CMD ["bash /home/gitlab-runner/start.sh"]
