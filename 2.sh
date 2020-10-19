#!/bin/bash

ps ax | awk '{if ($5 ~ "/sbin/") print $1}' > 2output.txt
ps ax | awk '{if ($5 ~ "/sbin/") print $1}'
