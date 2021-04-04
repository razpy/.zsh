## aliases
alias cls='clear'
alias ls='ls -G'
alias la='ls -a'
alias ll='ls -la'
alias grep='grep -G'
### 一括ファイル名変更（incrementalなファイルに限る)
alias zmv='noglob zmv -W'

## functions
### cdするときにファイル名がないと作成する関数
function mkcd() {
  if [[ -d $1 ]]; then
    echo "$1 already exists!"
    cd $1
  else
    mkdir -p $1 && cd $1
  fi
}

function chpwd() { 
  ls
}

## Powerline-goの関数
zmodload zsh/datetime

function preexec() {
  __TIMER=$EPOCHREALTIME
}

function powerline_precmd() {
  local __ERRCODE=$?
  local __DURATION=0

  if [ -n $__TIMER ]; then
    local __ERT=$EPOCHREALTIME
    __DURATION="$(($__ERT - ${__TIMER:-__ERT}))"
  fi
  PS1="$($GOPATH/bin/powerline-go -error $__ERRCODE -shell zsh -cwd-max-depth 3 -newline -duration $__DURATION -modules newline,user,git,docker,time,newline,ssh,cwd,duration)"
  unset __TIMER
}
function install_powerline_precmd() {
  # precmdにpowerline_precmdが無ければ追加する
  if ! ((${precmd_functions[(I)powerline_precmd]})) ;then
    precmd_functions+=(powerline_precmd)
  fi
}
