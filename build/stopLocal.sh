#!/usr/bin/env bash

kill $(ps aux | grep '[G]radleMain jettyRun' | awk '{print $2}')