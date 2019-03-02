FROM python:3.6-stretch
MAINTAINER Jonathan Meier <jonathan.w.meier@gmail.com)

ARG CF_PROJECT

ENV SRC_DIR /usr/local/src/$CF_PROJECT
WORKDIR ${SRC_DIR}

RUN pip3 install pipenv

COPY Pipfile Pipfile.lock ${SRC_DIR}/

RUN pipenv install --system --dev && \
    rm -rf /root/.cache/pip

COPY ./ ${SRC_DIR}/

COPY ./scripts/wait-for-it.sh /usr/local/bin
RUN chmod u+x /usr/local/bin/*

