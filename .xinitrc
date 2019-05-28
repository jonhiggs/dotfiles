[[ -f ${HOME}/.Xresources ]] && xrdb .Xresources
xmodmap ${HOME}/.config/dotfiles/.Xmodmap
/usr/bin/autokey-gtk &
exec fluxbox
