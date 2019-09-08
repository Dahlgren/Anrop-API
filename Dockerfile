FROM ruby:2.6.4-alpine
RUN apk --no-cache add build-base mysql-dev tzdata
RUN mkdir /anrop
WORKDIR /anrop
ADD Gemfile /anrop/Gemfile
ADD Gemfile.lock /anrop/Gemfile.lock
RUN bundle install -j4
ADD . /anrop
CMD rm -f tmp/pids/server.pid && rails server -b '0.0.0.0'
