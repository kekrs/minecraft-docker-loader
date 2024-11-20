FROM docker.io/library/alpine:3.20

ARG UID=1000
ARG GID=1000
WORKDIR /data
VOLUME /data

RUN addgroup -S -g "${GID}" mc
RUN adduser -S -u "${UID}" mc mc
RUN chown mc:mc /data
RUN apk add openjdk21-jre-headless libstdc++ eudev curl

COPY entrypoint.sh /entrypoint.sh

EXPOSE 25565
USER mc
ENTRYPOINT [ "/entrypoint.sh" ] 
STOPSIGNAL SIGQUIT
CMD [ "mc" ]
