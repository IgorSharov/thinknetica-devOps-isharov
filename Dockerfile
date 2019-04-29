FROM ruby:2.6.2

WORKDIR /app
COPY ./ .

RUN ln -snf /usr/share/zoneinfo/Europe/Moscow /etc/localtime && echo "Europe/Moscow" > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata && \
    gem install bundler && \ 
    bundle install && \
    rails assets:precompile

CMD rm -f /app/tmp/pids/server.pid && \
    ./wait-for-it.sh is-sample-db:5432 --strict -- echo "DB is available" && \
    rails db:migrate && \
    rails server -b 0.0.0.0
