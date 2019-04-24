FROM ruby:2.3.7-alpine3.7

# Install dependencies:
RUN apk add --update \
  bash \
  build-base \
  imagemagick \
  file \
  libxml2-dev \
  libxslt-dev \
  mariadb-dev \
  libressl-dev \
  git \
  nano \
  tzdata \
  vim \
nodejs
# Setting the timezone
RUN cp /usr/share/zoneinfo/Europe/Madrid /etc/localtime
RUN echo "Europe/Madrid" >  /etc/timezone
# Set an environment variable to store where the app is installed to inside
# of the Docker image.
ENV INSTALL_PATH /data/spree
ARG RAILS_ENV

# Warm cache technique https://medium.com/@fbzga/how-to-cache-bundle-install-with-docker-7bed453a5800
# http://bradgessler.com/articles/docker-bundler/
# ENV BUNDLE_PATH /bundle

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

# setup code before
COPY Gemfile Gemfile.lock ./
COPY . .
RUN gem install rake
RUN gem install bundler
RUN bundle install --jobs 20 --retry 5
RUN bundle clean

# setup code after

EXPOSE 3000
RUN chmod +x script/*
# The default command that gets ran will be to start the Puma server.
# CMD bundle exec puma -C config/puma.rb
