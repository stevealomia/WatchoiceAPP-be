FROM ruby:2.7.4

RUN apt-get update -qq
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . ./
