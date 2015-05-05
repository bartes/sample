FROM ruby:2.2.0

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libxml2-dev libxslt1-dev \
  libqt4-webkit libqt4-dev xvfb \
  less vim \
  nodejs

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile $APP_HOME/
COPY Gemfile.lock $APP_HOME/
RUN bundle install

COPY . $APP_HOME
