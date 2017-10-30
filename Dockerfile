FROM mongo:3.4.10-jessie

RUN apt-get -y update --fix-missing
RUN apt-get -y install curl bash cron

RUN mkdir /workdir
WORKDIR /workdir
COPY install_gcloud_sdk.sh /workdir
RUN ./install_gcloud_sdk.sh

ADD . /workdir

CMD ["./entrypoint.sh"]
