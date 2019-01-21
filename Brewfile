tap 'homebrew/services'
tap 'jmespath/jmespath'
tap 'redbubble/yak'

brews = %w[
  autoconf
  autogen
  automake
  awscli
  bash
  bash-completion@2
  bat
  bats
  bdw-gc
  cabal-install
  cmake
  coreutils
  fd
  ffmpeg
  findutils
  fzf
  gettext
  git
  gmp
  gnu-sed
  gnupg2
  gpg
  graphviz
  guile
  htop
  imagemagick
  jp
  jq
  jshon
  kubectl
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
  nvm
  openssl
  parallel
  pcre
  pidof
  pkg-config
  protobuf
  pv
  pwgen
  pyenv
  python3
  readline
  reattach-to-user-namespace
  redis
  rename
  shellcheck
  shfmt
  socat
  source-highlight
  telnet
  the_silver_searcher
  tig
  tmux
  tree
  unrar
  watch
  wget
  xz
  yak
  zlib
  zsh
  zsh-completions
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
