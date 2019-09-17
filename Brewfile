tap 'homebrew/services'
tap 'jmespath/jmespath'
tap 'redbubble/yak'

brews = %w[
  adr-tools
  autoconf
  autogen
  automake
  awscli
  b2-tools
  bash
  bash-completion
  bash-completion@2
  bdw-gc
  cabal-install
  cairo
  calcurse
  cmake
  cmus
  coreutils
  curl
  dirmngr
  dnsmasq
  docker
  exa
  faad2
  fd
  ffmpeg
  findutils
  flac
  fzf
  gawk
  gd
  gettext
  git
  gmp
  gnu-sed
  gnupg
  gnupg2
  gnutls
  go
  gpg
  graphviz
  grep
  guile
  htop
  httest
  imagemagick
  insect
  isync
  jansson
  jp
  jpeg
  jq
  jshon
  kubectl
  kubernetes-cli
  lame
  lesspipe
  lftp
  libevent
  libffi
  libtool
  libunistring
  links
  lua
  lynx
  mp4v2
  msmtp
  mysql
  neomutt
  netcat
  nginx
  nmap
  node
  notmuch
  nvm
  openjpeg
  openssl
  pandoc
  parallel
  pcre
  pcre2
  pidof
  pkg-config
  protobuf
  pv
  pwgen
  pyenv
  python
  python3
  python@2
  readline
  reattach-to-user-namespace
  redis
  rename
  ripgrep
  shellcheck
  shfmt
  socat
  source-highlight
  sqlite
  tcpdump
  telnet
  the_silver_searcher
  tig
  tmux
  tree
  unrar
  watch
  webp
  wget
  x264
  x265
  xsv
  xvid
  xz
  yak
  zlib
]

casks = %w[
  android-platform-tools
  docker
  dropbox
  google-chrome
  hammerspoon
  haskell-platform
  imageoptim
  java
  karabiner-elements
  qcad
  scapple
  wireshark
]

appstore = {
  "1Password" => 443987910,
  # "Slack" => 803453959, # Appstore version don't do keyboard shortcuts right.
  "Wunderlist" => 410628904,
}

brews.each {|p| brew p}
casks.each {|c| cask c}
appstore.each {|app,id| mas app, id: id}

# vim: ft=ruby
