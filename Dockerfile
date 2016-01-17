FROM ruby:2.3.0
RUN apt-get update -qq && apt-get install -y build-essential mysql-client
RUN mkdir /anrop
WORKDIR /anrop
ADD Gemfile /anrop/Gemfile
ADD Gemfile.lock /anrop/Gemfile.lock
RUN bundle install -j4
ADD . /anrop
CMD ["rails","server","-b","0.0.0.0"]
