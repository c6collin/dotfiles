readonly dotfiles_dir=~/Development/dotfiles

alias ll='ls -l'
alias la='ls -a'
alias tmux="TERM=screen-256color-bce tmux"

function listprocs() {
  ps -ef | grep $1 | grep -v grep
}
function killprocs() {
  ps -ef | grep $1 | grep -v grep | awk '{ system( "kill " $2 ) }'
}
function dos2unix() {
  perl -i -pe 's/\r\n|\n|\r/\n/g' $1
}

# Teamocil tab completion
complete -W "$(teamocil --list)" teamocil

# Show path in prompt
export PS1="[\u@\h \w]\\$ "

# Git settings
source ${dotfiles_dir}/third_party/git-completion.bash
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

# vim mode
set -o vi
