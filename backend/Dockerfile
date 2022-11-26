FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y --no-install-recommends build-essential libpq-dev
RUN apt-get clean
RUN echo 'PS1="[\[\e[0;35m\]\u\[\e[0m\]@\[\e[0;36m\]\h\[\e[0m\] \W]\$ "' >> /root/.bashrc
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN gem install bundler

RUN mkdir /usr/src/backend-app
WORKDIR /usr/src/backend-app

RUN echo "gem: --no-rdoc --no-ri" > /etc/gemrc
ADD Gemfile /usr/src/backend-app/Gemfile
RUN bundle install --jobs 20 --retry 5
ADD . /usr/src/backend-app
EXPOSE 3000

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["rails", "s", "-b", "0.0.0.0"]
