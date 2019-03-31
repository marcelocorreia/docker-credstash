FROM marcelocorreia/base

MAINTAINER marcelo correia <marcelo@correia.io>

RUN apk update
RUN set -ex && \
    apk add --no-cache --update \
        python \
        py-pip \
        python-dev \
        libffi-dev \
        openssl-dev \
        build-base && \
    pip install --upgrade pip && \
    pip install credstash

ENTRYPOINT ["credstash"]