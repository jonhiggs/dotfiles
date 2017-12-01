tap 'homebrew/services'
tap 'jmespath/jmespath'

brews = %w[
  autoconf
  autogen
  automake
  awscli
  bash
  bash-completion
  bats
  bdw-gc
  cmake
  coreutils
  fd
  ffmpeg
  fzf
  gettext
  git
  gmp
  gnu-sed
  gnupg2
  guile
  htop
  imagemagick
  jp
  jq
  jshon
  lame
  lastpass-cli
  lftp
  libevent
  libffi
  libtool
  libunistring
  mobile-shell
  netcat
  nmap
  openssl
  parallel
  pcre
  pidof
  pkg-config
  protobuf
  pwgen
  python3
  readline
  reattach-to-user-namespace
  redis
  rename
  shellcheck
  socat
  the_silver_searcher
  tig
  tmux
  tree
  watch
  wget
  xz
  zlib
]

casks = %w[
  docker
  dropbox
  google-chrome
  hammerspoon
  imageoptim
  java
  karabiner-elements
  qcad
  scapple
]

appstore = {
  "1Password" => 443987910,
  "Slack" => 803453959,
  "Wunderlist" => 410628904,
}

brews.each {|p| brew p}
casks.each {|c| cask c}
appstore.each {|app,id| mas app, id: id}

# vim: ft=ruby
