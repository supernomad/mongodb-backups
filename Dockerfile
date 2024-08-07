FROM mongo:4.4.18-focal

RUN (apt-get -y update --fix-missing || true) && \
  apt-get -y install curl bash cron gnupg python3

RUN mkdir -p /workdir/data
WORKDIR /workdir

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && \
    (apt-get update -y || true) && \
    apt-get install -y google-cloud-sdk

ADD . /workdir

CMD ["./entrypoint.sh"]
