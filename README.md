### DevOps infra for [App](https://github.com/GardOS/devops-exam-app)

Exam: https://github.com/PGR301-2018/oppgave-eksamen

Concource: https://raw.githubusercontent.com/starkandwayne/concourse-tutorial/master/docker-compose.yml

### Creds

- StatusCake: https://app.statuscake.com/User.php. Key.
- Github token: https://github.com/settings/tokens/new. Scope: repo + admin:repo_hook
- 2 deploy keypairs. Generate, then add to repo. infra + app. Allow write. https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys
- Heroku: https://dashboard.heroku.com/account. API Key. Credit card: https://dashboard.heroku.com/account/billing

### Cmd:

fly -t devops-exam login --concourse-url http://127.0.0.1:8080 -u admin -p admin

fly -t devops-exam set-pipeline -p exam-pipeline -c concourse/pipeline.yml -l credentials.yml

fly -t devops-exam unpause-pipeline -p exam-pipeline

fly -t devops-exam destroy-pipeline -p exam-pipeline

fly -t devops-exam logout
