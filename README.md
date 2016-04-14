# GitLab Runner for Android Building in Docker

Run with:


`docker run -d --name=ci-android-$NUM --restart=unless-stopped -e "CI_SERVER_URL=$URL" -e "RUNNER_NAME=$NAME" -e "REGISTRATION_TOKEN=$TOKEN" -e "REGISTER_NON_INTERACTIVE=true" doubleplusgood23/gitlab-ci-android bash /home/gitlab-runner/start.sh`


The first run downloads and installs the Android SDK due to it's large size, it also registers the runner with the GitLab server based on the passed enviroment variables. 
