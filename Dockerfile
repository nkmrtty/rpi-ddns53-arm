FROM resin/raspberrypi3-python:3.6-slim
LABEL maintainer "Tatsuya NAKAMURA <nkmrtty.com@gmail.com>"

RUN apt-get update && apt-get install -y --no-install-recommends bash dnsutils

RUN pip install --no-cache-dir awscli>=1.15.73

COPY ddns53 /usr/local/bin/ddns53

ENTRYPOINT ["/usr/local/bin/ddns53"]
