# 開発用ディレクトリのPATHを追加
DEV=$HOME/Developer
if [ ! -d $DEV ];then 
  mkdir $DEV
fi
export DEV

# 開発環境のPATHを追加
DEVENV=$DEV/.dev_env
if [ ! -d $DEVENV ];then
  mkdir $DEVENV
fi
export DEVENV

# 文字コード
export LANG=ja_JP.UTF-8

# localのPATHを優先させる
export PATH=/usr/local/bin:$PATH

# デフォルトのエディター
export EDITOR=vim

# LSした結果の色を変更
export CLICOLOR=1
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export LSCOLORS=gxfxcxdxbxegedabagacad

# commitしたくないzshenv.privateを読み込む
ZENVPRIVATE=$ZDOTDIR/.zshenv.private
if [ -f $ZENVPRIVATE ];then
  source $ZENVPRIVATE
else 
  touch $ZENVPRIVATE
fi

## module envs
source $ZDOTDIR/modules/env.sh