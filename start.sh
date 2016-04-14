#!/bin/bash
#-- Start Script! --#.

# Check if this is the first start.
if ! [ -f /home/gitlab-runner/start.cfg ]
then
    # Enviroment vars for the SDK
    export ANDROID_HOME=/home/gitlab-runner/android-sdk-linux
    export GRADLE_USER_HOME=/home/gitlab-runner/gradle

    # Download, extract, start and update the Android SDK
    cd /home/gitlab-runner/
    wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
    tar -xzf android-sdk_r24.4.1-linux.tgz -C /home/gitlab-runner
    ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | bash /home/gitlab-runner/android-sdk-linux/tools/android update sdk -u -a

    # Clean up.
    RUN rm android-sdk_r24.4.1-linux.tgz; apt-get autoremove -y; apt-get autoclean -y

    # Register with server
    gitlab-ci-multi-runner register --executor shell
    echo "FIRST_START=false" > /home/gitlab-runner/start.cfg
fi
# Run gitlab-runner
export GRADLE_USER_HOME=/home/gitlab-runner/gradle
export ANDROID_HOME=/home/gitlab-runner/android-sdk-linux
gitlab-ci-multi-runner run
