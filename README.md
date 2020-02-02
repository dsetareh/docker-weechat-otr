# docker-weechat-otr

weechat + otr support running in docker

## Running

Add your weechat config path to the docker compose, add or remove ports for script use (relays, url shorteners)
```
docker-compose up -d
```

Can be attached to normally or from within a tmux window on the host without any visual glitches.
