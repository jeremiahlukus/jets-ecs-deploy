FROM ruby:3.2.2-slim

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev unzip graphviz systemd cron vim libmariadb-dev git zip
# Install Node.js for Rails JS environment
RUN apt-get update -yq \
      && apt-get install curl gnupg -yq

# Configure application
WORKDIR /jets-ecs-deploy

# Copy everything over ignoring files in .dockerignore
COPY . /jets-ecs-deploy
# Install Ruby dependencies
RUN bundle install
RUN gem update --system
RUN gem install bundler
RUN gem install jets

ENV PORT 80
EXPOSE 80

RUN chmod +x /jets-ecs-deploy/entrypoint.sh
ENTRYPOINT /jets-ecs-deploy/entrypoint.sh; bash
