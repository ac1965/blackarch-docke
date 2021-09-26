# colors
darkgrey="$(tput bold ; tput setaf 0)"
white="$(tput bold ; tput setaf 7)"
blue="$(tput bold; tput setaf 4)"
cyan="$(tput bold; tput setaf 6)"
nc="$(tput sgr0)"

# exports
export PATH="${HOME}/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:"
export PATH="${PATH}/usr/local/sbin:/opt/bin:/usr/bin/core_perl:/usr/games/bin:"

if [[ $EUID -eq 0 ]]; then
  export PS1="\[$blue\][ \[$cyan\]\H \[$darkgrey\]\w\[$darkgrey\] \[$blue\]]\\[$darkgrey\]# \[$nc\]"
else
  export PS1="\[$blue\][ \[$cyan\]\H \[$darkgrey\]\w\[$darkgrey\] \[$blue\]]\\[$cyan\]\$ \[$nc\]"
fi

export LD_PRELOAD=""
export EDITOR="vim"

# alias
alias ls="ls --color"
alias vi="vim"
alias shred="shred -zf"
#alias python="python2"
alias wget="wget -U 'noleak'"
alias curl="curl --user-agent 'noleak'"
alias gcc-m32="gcc -m32 -Wextra -Wno-unused-function -Wno-unused-variable -g -O0 -fno-stack-protector -z execstack"
alias gcc-m64="gcc -m64 -Wextra -Wno-unused-function -Wno-unused-variable -g -O0 -fno-stack-protector -z execstack"
alias nas-m32="nasm -f elf32"
alias nas-m64="nasm -f elf64"
alias nas-m64="nasm -f elf64"
alias nas-mac64="nasm -f macho64"

# source files
[ -r /usr/share/bash-completion/completions ] &&
  . /usr/share/bash-completion/completions/*
