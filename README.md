# GitLab Runner for Android Building in Docker

Run with:


`docker run -d --name=ci-android-$NUM --restart=unless-stopped -e "CI_SERVER_URL=*URL*" -e "RUNNER_NAME=$NAME" -e "REGISTRATION_TOKEN=$TOKEN" -e "REGISTER_NON_INTERACTIVE=true" doubleplusgood23/gitlab-ci-android bash /home/gitlab-runner/start.sh`
