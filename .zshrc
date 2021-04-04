# Created by newuser for 5.7.1
## read custom_commands(alias & function)
source $ZDOTDIR/custom_commands.sh

# Bindkeys
### 履歴をさかのぼる
bindkey '^r' history-incremental-pattern-search-backward
### 履歴を進める
bindkey '^s' history-incremental-pattern-search-forward
### 展開する前に補完候補を出させる(Ctrl-iで補完するようにする)
bindkey "^I" menu-complete
### コマンド履歴から補完を出す
bindkey "^p" history-beginning-search-backward-end # さかのぼる
bindkey "^b" history-beginning-search-forward-end  # すすむ

# zsh config 
## ${fg[色指定]}と${reset_color}で囲んだ部分がカラー表示
autoload -Uz colors && colors
## ワードジャンプ
autoload -Uz select-word-style && select-word-style default
zstyle ':zle:*' word-chars "_-./;@"
zstyle ':zle:*' word-style unspecified
## コマンド履歴からの補完、補完したあとカーソルを行末に置いてくれる
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
## hookを登録 https://qiita.com/mollifier/items/558712f1a93ee07e22e2#hook名とは
autoload -Uz add-zsh-hook

## 一括ファイル名変更（incrementalなファイルに限る)
autoload -Uz zmv

## beep音を消す
setopt NOBEEP
setopt NOLISTBEEP

## History
### 補完リストが多いときに尋ねない
LISTMAX=1000
### ヒストリーサイズ設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
### 他のターミナル間で履歴を共有しない
unsetopt SHARE_HISTORY
### 同じコマンドを連続して実行しても履歴としては 1 回しか出てこないようにする
setopt HIST_IGNORE_DUPS
### コマンド終了時に、履歴ファイルに書き込む。
setopt INC_APPEND_HISTORY_TIME
### ヒストリファイルを上書きするのではなく、追加するようにする
setopt APPEND_HISTORY
### 履歴がいっぱいの時は最も古いものを先ず削除
setopt HIST_EXPIRE_DUPS_FIRST
### 履歴検索中、重複を飛ばす
setopt HIST_FIND_NO_DUPS
### ヒストリリストから関数定義を除く
setopt HIST_NO_FUNCTIONS

## 入力補完
source $ZDOTDIR/modules/completion.sh

### path名を入力するとcdする
setopt AUTO_CD
### rm *で確認
setopt RM_STAR_WAIT
## 補完候補リストの日本語を正しく表示
setopt PRINT_EIGHT_BIT

## modulesのアプリケーションを読み込み
source $ZDOTDIR/modules/apps.sh