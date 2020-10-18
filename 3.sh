#!/bin/bash

ps aux --sort=start| tail -1 | awk '{print "PID of the last process: " $2}'
