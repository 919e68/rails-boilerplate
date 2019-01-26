FROM ruby:2.4.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /usr/src/app

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN bundle install

ADD . .