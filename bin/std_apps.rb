#!/usr/bin/env ruby
packages = %w[
  ack-grep
  autocutsel
  curl
  git-core
  gitg
  libreadline-dev
  makeself
  openjdk-7-jre
  pwgen
  rxvt-unicode-256color
  vim-gnome
  zlib1g-dev
]

puts `sudo apt-get install #{packages.join(' ')}`

puts "DON'T FORGET TO INSTALL RVM"
