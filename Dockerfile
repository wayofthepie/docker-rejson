FROM ubuntu:17.04

RUN apt-get update -y && apt-get install -y build-essential wget &&\
  wget https://github.com/antirez/redis/archive/4.0-rc3.tar.gz &&\
  tar xvf 4.0-rc3.tar.gz &&\
  rm 4.0-rc3.tar.gz &&\
  cd redis-4.0-rc3 &&\
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


