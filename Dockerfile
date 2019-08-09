FROM mongo:4.0.9-xenial

RUN apt-get -y update --fix-missing
RUN apt-get -y install curl bash cron

RUN mkdir /workdir
WORKDIR /workdir
COPY install_gcloud_sdk.sh /workdir
RUN ./install_gcloud_sdk.sh

ADD . /workdir

CMD ["./entrypoint.sh"]
