FROM ubuntu:17.04
ARG VERSION=4.0.2
RUN apt-get update -y && apt-get install -y build-essential wget &&\
  wget https://github.com/antirez/redis/archive/$VERSION.tar.gz &&\
  tar xvf $VERSION.tar.gz &&\
  rm $VERSION.tar.gz &&\
  cd redis-$VERSION &&\
  make &&\
  cp src/redis-server /bin &&\
  cp src/redis-cli /bin &&\
  apt-get remove -y build-essential wget
RUN apt-get install -y git &&\
  git clone https://github.com/RedisLabsModules/rejson.git rejson &&\
  cd rejson &&\
  make &&\
  cp src/rejson.so /opt &&\
  cd ../ &&\
  rm -rf rejson.so &&\
  apt-get remove -y git

ADD redis.conf /opt

EXPOSE 6379
CMD ["redis-server", "/opt/redis.conf"]


