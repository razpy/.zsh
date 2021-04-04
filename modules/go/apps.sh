
if [ -d $HOME/.gvm/scripts/gvm ];then
  source $HOME/.gvm/scripts/gvm

  if type go > /dev/null; then
    # powerline-goを呼び出す関数をprecmdに登録
    if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
      install_powerline_precmd
    fi
  else
    gvm list
  fi
fi
