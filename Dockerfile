FROM debian:buster

RUN mkdir -p src
WORKDIR src

RUN apt-get update -y
RUN apt-get install -y build-essential
RUN apt-get install -y valgrind

COPY ./docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
