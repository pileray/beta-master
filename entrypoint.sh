#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

if [ "$RAILS_ENV" = "production" ]; then
  bundle exec rails assets:precompile
  # bundle exec rails db:create
  # bundle exec rails db:migrate
  # bundle exec rails db:seed
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
