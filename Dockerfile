FROM ubuntu:14.04

RUN apt-get -y update --fix-missing
RUN apt-get -y install curl mongodb bash

WORKDIR /workdir
ADD . /workdir

CMD ["./entrypoint.sh"]
