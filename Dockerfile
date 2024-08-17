FROM ruby:3.3.3
ARG ROOT="/beta-master"
ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo

RUN mkdir ${ROOT}
WORKDIR ${ROOT}

RUN apt-get update; \
  apt-get install -y --no-install-recommends \
	postgresql-client tzdata 

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn

COPY Gemfile ${ROOT}
COPY Gemfile.lock ${ROOT}
RUN gem install bundler
RUN bundle install --jobs 4

COPY package.json ${ROOT}
COPY yarn.lock ${ROOT}
RUN yarn install

COPY . ${ROOT}

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["sh", "-c", "if [ \"$SIDEKIQ_ENV\" = 'true' ]; then bundle exec sidekiq -C config/sidekiq.yml; else rails s -b 0.0.0.0; fi"]
# CMD ["bin/dev"]
