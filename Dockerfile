# weechat with otr

FROM        ubuntu:19.10

ENV         DEBIAN_FRONTEND noninteractive

RUN         apt update && apt install -y \
                dirmngr \
		apt-utils \
                gpg-agent \
		locales \
                apt-transport-https \
		ca-certificates \
		openssl \
		wget

RUN         sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
                && dpkg-reconfigure --frontend=noninteractive locales \
		&& update-locale LANG=en_US.UTF-8

ENV         LANG en_US.UTF-8 
ENV         LC_ALL en_US.UTF-8
ENV         LANGUAGE en_US.UTF-8
ENV         C en_US.UTF-8
ENV         TERM xterm-256color
ENV         TZ America/New_York

RUN         apt-key adv --keyserver hkps://keys.openpgp.org --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E
RUN         echo "deb https://weechat.org/ubuntu eoan main" | tee /etc/apt/sources.list.d/weechat.list

RUN         apt update && apt install -y \
                weechat-curses \
                weechat-plugins \
                weechat-python \
		weechat-perl \
		weechat-php \
		weechat-ruby \
		python3-potr

RUN         addgroup --system -gid 1000 weechat \ 
		&& adduser --system --uid 1000 --disabled-password --shell /sbin/nologin --ingroup weechat weechat \
	        && chown -R weechat:weechat /home/weechat && chmod -R 0755 /home/weechat

USER        weechat

WORKDIR     /home/weechat

ENV         HOME /home/weechat

VOLUME      /home/weechat/.weechat

ENTRYPOINT  [ "weechat-curses" ]
