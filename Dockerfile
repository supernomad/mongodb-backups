FROM mongo:3.4.10-jessie

RUN apt-get -y update --fix-missing
RUN apt-get -y install curl bash

WORKDIR /workdir
ADD . /workdir
RUN ./install_gcloud_sdk.sh

CMD ["./entrypoint.sh"]
