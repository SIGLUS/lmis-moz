#!/usr/bin/env bash

kill -9 $(ps aux | grep '[G]radleMain run' | awk '{print $2}')