#!/usr/bin/env ruby
packages = %w[
  ack-grep
  autocutsel
  curl
  git-core
  gitg
  libreadline-dev
  openjdk-7-jre
  rxvt-unicode-256color
  vim-gnome
  zlib1g-dev 
]

puts `apt-get install #{packages.join(' ')}`

puts "DON'T FORGET TO INSTALL RVM"
