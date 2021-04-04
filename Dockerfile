FROM ruby:3.0.0

WORKDIR /opt/fortuna

RUN apt-get update -qq \
    && apt-get install -y curl apt-transport-https build-essential libpq-dev postgresql-client locales wget vim \
    && apt-get clean

ENV LANG=pt_BR.UTF-8
ENV LANGUAGE=pt_BR.UTF-8
ENV TZ America/Sao_Paulo

COPY Gemfile /opt/fortuna/Gemfile

RUN bundle install --verbose --jobs 20 --retry 5
