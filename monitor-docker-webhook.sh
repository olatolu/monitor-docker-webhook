#!/bin/bash -ex
python /monitor-docker-webhook.py  --check_interval "$CHECK_INTERVAL" \
       --msg_prefix "$MSG_PREFIX" --whitelist "$WHITELIST" \
       --webhook_url "$WEBHOOK_URL"
## File : monitor-docker-webhook.sh ends
