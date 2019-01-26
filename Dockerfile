FROM ruby:2.4.5

# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    libpq-dev \
    less

# :begin install latest nodejs

ENV NODE_VERSION 10.x
RUN curl -sL "https://deb.nodesource.com/setup_$NODE_VERSION" -o nodesource_setup.sh && \
    bash nodesource_setup.sh && \
    apt-get install -y nodejs && \
    rm nodesource_setup.sh && \
    npm install yarn -g

# :end install latest nodejs

WORKDIR /usr/src/app

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN bundle install
RUN rails db:migrate

COPY . .