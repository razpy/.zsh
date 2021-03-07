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
