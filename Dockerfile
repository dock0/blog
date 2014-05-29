FROM dock0/nginx
MAINTAINER akerl <me@lesaker.org>

RUN pacman -Syu --noconfirm --needed ruby make gcc grep
RUN git clone git://github.com/akerl/blog.git /opt/blog
ADD src /opt/blog
RUN gem install --no-user-install bundler
RUN bundle install --gemfile=/opt/blog/Gemfile --without development
RUN jekyll build --source /opt/blog --destination /srv/blog

ADD site.conf /etc/nginx/sites/blog.conf
