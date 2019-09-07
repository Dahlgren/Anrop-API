FROM ruby:2.6.4
RUN apt-get update -qq && apt-get install -y build-essential libmariadb-dev
RUN mkdir /anrop
WORKDIR /anrop
ADD Gemfile /anrop/Gemfile
ADD Gemfile.lock /anrop/Gemfile.lock
RUN bundle install -j4
ADD . /anrop
CMD rm -f tmp/pids/server.pid && rails server -b '0.0.0.0'
