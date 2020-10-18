#!/bin/bash

#ps ax | sed -n "s/\/sbin\//\/sbin\//p"
ps ax | awk '{if ($5 ~ "/sbin/") print $1}' > 2output.txt
ps ax | awk '{if ($5 ~ "/sbin/") print $1}'
