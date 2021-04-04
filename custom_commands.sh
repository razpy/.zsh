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
function powerline_precmd() {
  PS1="$($GOPATH/bin/powerline-go -error $? -jobs ${${(%):%j}:-0})"
}
function install_powerline_precmd() {
  # precmdにpowerline_precmdが無ければ追加する
  if ! ((${precmd_functions[(I)powerline_precmd]})) ;then
    precmd_functions+=(powerline_precmd)
  fi
}