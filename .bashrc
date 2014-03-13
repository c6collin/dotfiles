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
