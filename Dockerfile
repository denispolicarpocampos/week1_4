FROM ruby:2.4-slim

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev wget

# PhantomJS dependencies
RUN apt-get install -y libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev

ENV PHANTOM_JS phantomjs-2.1.1-linux-x86_64

# Download PhantomJS
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 -O /tmp/phantomjs.tar.bz2

# Unpack PhantomJS on /usr/local/share
RUN tar xvjf /tmp/phantomjs.tar.bz2 -C /usr/local/share

# Create a link to executable PATH dir
RUN ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

ENV INSTALL_PATH /hack2save

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile ./

ENV BUNDLE_PATH /box

COPY . .
