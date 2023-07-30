ARG RUBY_VERSION=3.2.2
FROM ruby:${RUBY_VERSION}-slim

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]