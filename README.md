## docker-weechat-otr
latest [Weechat](https://weechat.org/) with [otr](https://weechat.org/scripts/source/otr.py.html/), [urlserver](https://weechat.org/scripts/source/urlserver.py.html/), and [relay](https://weechat.org/files/doc/stable/weechat_relay_protocol.en.html) support

Also on [DockerHub](https://hub.docker.com/r/dsetareh/docker-weechat-otr)

#### why use this
the last otr-weechat image i can find is 3 years old, and all the ones I tried based off alpine had visual glitches when attaching

### Running
`docker run -it --name weechat-otr -v ./path/to/host/.weechat:/home/weechat/.weechat -p host.relay.port:container.relay.port dsetareh/docker-weechat-otr`
#### With Docker Compose
```
version: "3"
services:
   weechat:
      image: dsetareh/docker-weechat-otr
      container_name: weechat-otr
      stdin_open: true
      tty: true
      ports:
         - "host.relay.port:container.relay.port"
      volumes:
         - "/path/to/host/.weechat:/home/weechat/.weechat"
      logging:
         driver: none
```
After adding your volumes and ports,`docker-compose up -d`

#### Building
1. `git clone https://github.com/dsetareh/docker-weechat-otr.git`
2. Add location of host `.weechat/` and (optionally) a forwarded relay port to `docker-compose.yml` 
```
      ports:
         - "hostrelayport:containerrelayport"
      volumes:
         - "/path/to/host/.weechat:/home/weechat/.weechat"

```
3. `docker-compose up -d --build` 
4. `docker attach weechat-otr`

To enter weechat, attach to the container `docker attach weechat-otr' 
