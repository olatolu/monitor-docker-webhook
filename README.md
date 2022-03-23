# monitor-docker-webhook
Monitor Docker Container using Microsoft Teams WebHook

# Introduction
Get MicroSoft Teams Channel Notifications, When Containers Run Into Issues

Read more: https://oluolateru.com/

# General Idea
1. Start a container in the target docker host.
2. This container will query status for all containers.

```curl -XGET --unix-socket /var/run/docker.sock http://localhost/containers/json```

3. Send slack notifications, we get matched of "unhealthy"


# How To Use: Docker-compose
```
version: '3'
services:
  monitor-docker-webhook:
    build:
      context: ./
      dockerfile: Dockerfile
    image: monitor-docker-webhook
    container_name: monitor-docker-webhook
    volumes:
     - /var/run/docker.sock:/var/run/docker.sock
    environment:
      MSG_PREFIX: "$MSG_PREFIX"
      WHITELIST: "$WHITELIST"
      WEBHOOK_URL: "$WEBHOOK_URL"
    restart: always

# More customization
- Add message prefix for the slack notification customizing MSG_PREFIX env.

- Skip checking certain containers by customizing WHITE_LIST env.
