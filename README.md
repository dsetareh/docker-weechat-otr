## docker-weechat-otr
weechat 2.7 + otr running in docker
#### why use this
the last otr-weechat image i can find is 3 years old, and all the ones I tried based off alpine had visual glitches when attaching

#### Running
1. Clone this repo
2. Add location of host `.weechat/` and (optionally) a forwarded relay port to `docker-compose.yml` 
```
      ports:
         - "host relay port:container relay port"
      volumes:
         - "/path/to/host/.weechat:/home/weechat/.weechat"

```
3. `docker-compose up -d` 
4. `docker attach weechat-otr`
