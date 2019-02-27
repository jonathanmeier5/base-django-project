FROM python:3.6-stretch
MAINTAINER Jonathan Meier <jonathan.w.meier@gmail.com)

ARG PROJECT_NAME

ENV SRC_DIR /usr/local/src/$PROJECT_NAME
WORKDIR ${SRC_DIR}

RUN pip3 install pipenv

COPY Pipfile Pipfile.lock ${SRC_DIR}/

RUN pipenv install --system --dev && \
    rm -rf /root/.cache/pip

COPY ./ ${SRC_DIR}/

