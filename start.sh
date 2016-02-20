#!/bin/bash

/etc/init.d/ssh start
cd $PARSE_HOME && npm start
