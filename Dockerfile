# syntax=docker/dockerfile:1
FROM ruby:3.0-slim

RUN apt-get clean all && apt-get update -qq && apt-get install -y build-essential libpq-dev \
    curl gnupg2 apt-utils git libcurl3-dev cmake \
    libssl-dev pkg-config openssl file nodejs yarn

#Cria diretorio para app
RUN mkdir /rails-app

#define o diretorio como padrão
WORKDIR /rails-app

#Copia gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install

#copia binarios para o diretorio da app
COPY . /rails-app

#Script que vai ser executado ao iniciar
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3000

## Executa o processo ao iniciar a imagem
CMD ["rails", "server", "-b", "0.0.0.0"]