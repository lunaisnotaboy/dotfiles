#
# @lunaisnotaboy's .bashrc
#
# https://github.com/lunaisnotaboy/dotfiles
#

# Source original bash profile
source /etc/profile

# export stuff
export EDITOR="nano"
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$HOME/.yarn/bin:$HOME/.local/bin:/usr/local/go/bin:$PATH"
export GPG_TTY=$(tty)

# init rbenv
eval "$(rbenv init -)"

# aliases
alias anidump='pg_dump -U robert anikuto_development > anikuto_devel_$(date +"%Y%m%d%H%M%S").sql'
alias config='/usr/bin/git --git-dir=/home/robert/.cfg/ --work-tree=/home/robert'
alias sail='bash vendor/bin/sail'

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# print neofetch w/ system info
echo
neofetch
echo
