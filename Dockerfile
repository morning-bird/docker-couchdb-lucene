FROM maven:3.3.9-jdk-8-alpine
WORKDIR /app

RUN apk update
RUN apk add git unzip

RUN git clone https://github.com/morning-bird/couchdb-lucene.git
RUN cd /app/couchdb-lucene && mvn
RUN cd /app/couchdb-lucene/target && unzip couchdb-lucene-2.2.0-SNAPSHOT-dist.zip
WORKDIR /app/couchdb-lucene/target/couchdb-lucene-2.2.0-SNAPSHOT
CMD ["./bin/run"]