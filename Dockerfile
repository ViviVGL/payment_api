FROM ruby:2.5.1

RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends vim postgresql-client locales

WORKDIR /payment_api
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install
RUN gem install bundler-audit

ADD . /payment_api
