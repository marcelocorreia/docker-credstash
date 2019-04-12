FROM marcelocorreia/base-python

MAINTAINER marcelo correia <marcelo@correia.io>

ARG credstash_version="1.15.0"

RUN apk update
RUN set -ex && \
    apk add --no-cache --update \
        libffi-dev \
        openssl-dev \
        build-base
#        py-pip \
#        python-dev \
#        python \

RUN pip install credstash awscli

ENTRYPOINT ["credstash"]
