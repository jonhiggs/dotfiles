#!/usr/bin/env ruby
packages = %w[
  ack-grep
  git-core
  gitg
  vim-gnome
  curl
  libreadline-dev
  zlib1g-dev 
]

puts `apt-get install #{packages.join(' ')}`

puts "DON'T FORGET TO INSTALL RVM"
