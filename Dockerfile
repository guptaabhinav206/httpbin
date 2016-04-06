FROM python:alpine

RUN apk add --update bash curl gcc g++ \
 && rm -rf /var/cache/apk/*

EXPOSE 50560

ENV HTTPBIN_HOST=0.0.0.0 \
    HTTPBIN_PORT=50560

WORKDIR /opt/sendgrid/httpbin
COPY . /opt/sendgrid/httpbin

RUN pip install -r requirements.txt \
 && pip install tox wheel

CMD ["python", "-m", "httpbin.core", "--host=0.0.0.0", "--port=50560", "--enable-file-endpoint"]
