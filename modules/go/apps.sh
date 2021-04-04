
if type gvm > /dev/null 2>&1 ; then
  if type go > /dev/null 2>&1 ; then
    # powerline-goを呼び出す関数をprecmdに登録
    if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
      install_powerline_precmd
    fi
  else
    gvm list
  fi
fi
