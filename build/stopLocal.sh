#!/usr/bin/env bash

kill -9 $(ps aux | grep '[G]radleWrapperMain run' | awk '{print $2}')
