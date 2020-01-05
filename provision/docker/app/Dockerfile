FROM equipindustry/python:3.8.0-slim

MAINTAINER Luis Mayta <@slovacus>

ARG stage

LABEL NAME mining-app-$stage

ENV PACKAGES bash \
  libmagickwand-dev \
  ghostscript \
  imagemagick

COPY Pipfile* /usr/src/

# set working directory to /usr/src/
WORKDIR /usr/src/

RUN  groupadd -g 500 -r python \
  && groupadd developer \
  && useradd -m -g developer -G python developer \
  && chown -R developer:python /usr/local/bin \
  && mkdir -p /usr/src \
  && chown -R developer /usr/src \

  # install packages
  && apt-get update -y \
  && apt-get install -y ${PACKAGES} --no-install-recommends \

  && pip3 install pipenv \
  && pipenv install --dev --skip-lock \
  && pipenv shell --fancy \

  # clean
  && apt-get clean \
  && apt-get purge -y \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
