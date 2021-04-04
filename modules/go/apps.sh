
if [ -d $HOME/.gvm/scripts/gvm ];then
  source $HOME/.gvm/scripts/gvm

  if type go > /dev/null; then
    
  else
    gvm list
  fi
fi
