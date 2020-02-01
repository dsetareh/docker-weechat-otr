# weechat with otr
# docker run --rm -it -v [host .weechat]:/home/weechat/.weechat [image id]
# add ports to use relay

FROM        alpine:3.10

ENV         LANG C.UTF-8
ENV         TERM xterm-256color

RUN         apk add --update --no-cache \
                weechat==2.5-r0 \
                weechat-perl==2.5-r0 \
                weechat-python==2.5-r0 \
                weechat-spell==2.5-r0 \
                ca-certificates \
                aspell-en \
                ncurses \
                perl \
                ruby \
                py2-pip python python-dev build-base py-dbus tzdata


RUN pip install --upgrade pip
RUN pip install python-potr
RUN pip install notify2

ENV TZ America/New_York

RUN         mkdir -p /home/weechat/.weechat && \
            addgroup -g 1000 -S weechat && adduser weechat --uid 1000 -D -S -s /sbin/nologin -G weechat weechat && \
            chown -R weechat:weechat /home/weechat && chmod -R 0755 /home/weechat

USER weechat

WORKDIR /home/weechat

ENV HOME /home/weechat

VOLUME /home/weechat/.weechat

ENTRYPOINT  [ "weechat" ]
