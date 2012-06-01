#!/usr/bin/env ruby
packages = %w[
  ack-grep
  autocutsel
  curl
  expect
  git-core
  gitg
  lftp
  libreadline-dev
  makeself
  meld
  openjdk-7-jre
  pwgen
  rxvt-unicode-256color
  traceroute
  vim-gnome
  zlib1g-dev
]

puts `sudo apt-get install #{packages.join(' ')}`

puts "DON'T FORGET TO INSTALL RVM"
