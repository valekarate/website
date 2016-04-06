# -*- mode: Dockerfile; tab-width: 2 -*-
FROM ruby:2.1

COPY script/bootstrap.sh /root/bootstrap.sh
RUN  bash /root/bootstrap.sh

ENV RACK_ENV development
ENV PORT 80
EXPOSE   80

WORKDIR /app

# RUBY PACKAGES
COPY Gemfile      /app/
COPY Gemfile.lock /app/
RUN  bundle install

# Copy App
COPY . /app/

CMD  ["bash", "script/run.sh"]
