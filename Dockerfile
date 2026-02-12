FROM ruby:3.4

ENV DEBIAN_FRONTEND=noninteractive

RUN useradd -ms /bin/bash jekyll
USER jekyll
WORKDIR /home/jekyll

RUN gem install jekyll:4.4.1 bundler:2.6.6

