FROM python:3.8.6-alpine3.12

ENV PYTHONUNBUFFERED 1

COPY requirements.txt /

RUN set -ex \
    && apk upgrade --no-cache \
    && python3 -m pip install --no-cache-dir --upgrade --upgrade-strategy='eager' \
        'setuptools' \
        'pip' \
        'wheel' \
    && python3 -m pip install --no-cache-dir -r 'requirements.txt' --require-hashes \
    && rm 'requirements.txt'

ENTRYPOINT ["dumb-pypi"]
