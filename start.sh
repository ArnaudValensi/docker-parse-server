#!/bin/bash

# Run ssh server
/etc/init.d/ssh start

# Add authorized keys
cat $PARSE_CLOUD/keys/* > /root/.ssh/authorized_keys 2> /dev/null
cd $PARSE_HOME && npm start
