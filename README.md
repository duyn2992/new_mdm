# MDM

This is a Rails 7.2 app.

## Getting started

### Docker setup

Run this script to install necessary dependencies and prepare the Rails app to be started for the first time.

```
cd {path_to_repository}
cp .env.sample .env
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

Sidekiq::Web

http://0.0.0.0:3000/sidekiq

## Extended features

### 1/ Build a background job processing system for heavy tasks (e.g., sending bulk emails, importing large datasets, processing reports).
```
### Notes
# Backup when change database
# Optimize batch size to balance performance and memory usage
# Using insert_all to optimize query
# Using sleep between batches to prevent system overload
# Using transaction to ensure data consistency
# Implement with simple logic
# Log progress and errors for monitoring and debugging.
# Schedule job during off-peak hours to minimize the impact on active users.
# Separate queues for different job types to prevent queue congestion, prioritize critical jobs, and optimize resource allocation
...
```
```
bulk_email_job
https://github.com/duyn2992/new_mdm/blob/develop/app/jobs/bulk_email_job.rb
user_import_job
https://github.com/duyn2992/new_mdm/blob/develop/app/jobs/user_import_job.rb
```

### 2/ Implement caching in the application, such as caching results of heavy queries, and fragment caching for complex view pages.
```
### Notes
# Using Redis to store heavy query results and reduce database load
# Ensure cache keys clearly represent
# Prevent stale data by defining an expiration time for cached data
# Ensure cache is cleared when data is modified
```
```
cache active_users
https://github.com/duyn2992/new_mdm/blob/develop/app/models/user.rb
```
