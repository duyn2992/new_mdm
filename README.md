# MDM

This is a Rails 7.2 app.

## Getting started

### Docker setup

Run this script to install necessary dependencies and prepare the Rails app to be started for the first time.

```
cd {path_to_repository}
docker compose -f .devcontainer/compose.yaml build
```

### Run the app!

Start docker with this command:

```
docker compose -f .devcontainer/compose.yaml up
```

Setup database

```
docker compose -f .devcontainer/compose.yaml run rails-app bundle exec rails db:create
docker compose -f .devcontainer/compose.yaml run rails-app bundle exec rails db:migrate
```

### Local endpoins

API Endpoint

http://0.0.0.0:3000

API Document

http://0.0.0.0:3000/api/docs/index.html
