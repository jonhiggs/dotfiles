#!/usr/bin/env bash
URLS=(
  https://raw.githubusercontent.com/notracking/hosts-blocklists/master/hostnames.txt
  https://raw.githubusercontent.com/notracking/hosts-blocklists/master/domains.txt
  https://raw.githubusercontent.com/jmdugan/blocklists/master/corporations/facebook/all
  https://github.com/EFForg/privacybadger/blob/18c1964f4cc44f081212b807a93be497c91c1b58/src/data/yellowlist.txt
)
for url in ${URLS[@]}; do
  wget "${url}"
done
