#
# Dockerfile to build ansible Docker image for Ansible CI project
#
FROM alpine:3.10

LABEL maintainer="sebthebert@gmail.com"

RUN apk update && \
    apk add ca-certificates && \
    update-ca-certificates

RUN apk add git python3 py-pip

RUN python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi

RUN apk add python3-dev libffi-dev gcc make musl-dev openssl openssl-dev

RUN pip3 install ansible ansible-lint

RUN cd /tmp && \
    git clone https://github.com/AnsibleCI/ansible-lint.git && \
    cd /tmp/ansible-lint/lib/ansiblelint/ && \
    cp -f __main__.py /usr/lib/python3.7/site-packages/ansiblelint/ && \
    cp -f utils.py /usr/lib/python3.7/site-packages/ansiblelint/ && \
    cp -f formatters/__init__.py /usr/lib/python3.7/site-packages/ansiblelint/formatters/ && \
    rm -rf /tmp/ansible-lint