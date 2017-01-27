FROM alpine:edge
MAINTAINER Michael Stella <michael@jwplayer.com>
LABEL CostCenter="Ops" Application="kubernetes"

# Note that this currently uses the 'testing' repo - filebeat is not
# yet in Alpine's main package repo.
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ filebeat

COPY configs/containers.yml /etc/filebeat/containers.yml
COPY configs/stdin.yml      /etc/filebeat/stdin.yml

ENTRYPOINT ["/usr/bin/filebeat", "-e", "-v"]
CMD ["-c", "/etc/filebeat/containers.yml"]
