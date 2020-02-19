# weechat with otr (armhf)
FROM        ubuntu:20.04

# fix env variables
ENV         TERM xterm-256color
ENV         TZ America/New_York
ENV         DEBIAN_FRONTEND noninteractive

# install utilities and locale
RUN         apt-get update && apt-get install -y \
                dirmngr \
                gpg-agent \
		locales \
                apt-transport-https \
		ca-certificates \
		openssl \
		wget \
		&& rm -rf /var/lib/apt/lists/* \
                && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
                && dpkg-reconfigure --frontend=noninteractive locales \
		&& update-locale LANG=en_US.UTF-8 

ENV         LANG en_US.UTF-8
ENV         LC_ALL en_US.UTF-8
ENV         LANGUAGE en_US.UTF-8
ENV         C en_US.UTF-8

# add weechat repo
RUN         apt-key adv --keyserver hkps://keys.openpgp.org --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E
SHELL       ["/bin/bash", "-o", "pipefail", "-c"]
RUN         echo "deb https://weechat.org/raspbian buster main" | tee /etc/apt/sources.list.d/weechat.list

# add libperl5.28
RUN         wget https://ftp-master.debian.org/keys/archive-key-10.asc
RUN         apt-key add archive-key-10.asc
RUN         echo "deb http://ftp.de.debian.org/debian buster main" | tee /etc/apt/sources.list.d/libperl528.list

# install weechat
RUN         apt-get update && apt-get install -y \
                weechat-devel-curses \
                weechat-devel-plugins \
                weechat-devel-python \
		weechat-devel-perl \
		weechat-devel-php \
		weechat-devel-ruby \
		python3-potr \
		&& rm -rf /var/lib/apt/lists/*

# setup user and group
RUN         addgroup --system -gid 1000 weechat \ 
		&& adduser --system --uid 1000 --disabled-password --shell /sbin/nologin --ingroup weechat weechat \
	        && chown -R weechat:weechat /home/weechat && chmod -R 0755 /home/weechat

USER        weechat
VOLUME      /home/weechat/.weechat

ENTRYPOINT  [ "weechat-curses" ]
