#!/usr/bin/env ruby
packages = %w[
  ack-grep
  git-core
  gitg
  gvim
  curl
]

`apt-get install #{pkg.join(' ')}`

echo "don't forget to install RVM"
