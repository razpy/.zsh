
## Completion
### 保管機能を有効にして、実行する
autoload -Uz compinit && compinit
### 補完候補など表示する時はその場に表示し、終了時に画面から消す
setopt ALWAYS_LAST_PROMPT
### コマンドの引数などで使われる=以降でも補完できるようにする e.g. command --prefix=/opt/hoge/fuga
setopt MAGIC_EQUAL_SUBST
### 自動補完される余分なカンマなどを適宜削除してスムーズに入力できるようにする
setopt AUTO_PARAM_KEYS
### 補完候補を自動で補完
setopt AUTO_MENU
### ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt MARK_DIRS
### 補完候補一覧でファイルの種別を識別マーク表示
setopt LIST_TYPES
### ドットの指定なしで.から始まるファイルをマッチ
setopt GLOBDOTS
### cd [TAB] で以前移動したディレクトリを表示
setopt AUTO_PUSHD
### pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt PUSHD_IGNORE_DUPS
### 語の途中でもカーソル位置で補完
setopt COMPLETE_IN_WORD
### CompletionのStyle
### 補完の表示を過剰にする(邪魔に感じたら消す)
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "- %{${fg[yellow]}%}%d%{${reset_color}%} -"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:prefix:*' add-space true
### 補完候補に説明がある場合に(gitなど)、そのコマンドと説明文の境界を変更
zstyle ':completion:*' list-separator '-->'
### 補完方法毎にグループ化する。
zstyle ':completion:*' group-name ''
### ファイル補完候補に色を付ける。
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
## kill の候補にも詳細と色付きで表示
zstyle ':completion:*:*:kill:*' verbose yes
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#) #([^ ]#)*=$color[cyan]=$color[yellow]=$color[green]"
### highlight parameters with uncommon names
zstyle ':completion:*:parameters' list-colors "=[^a-zA-Z]*=$color[red]"
### highlight aliases
zstyle ':completion:*:aliases' list-colors "=*=$color[green]"
### highlight the original input.
zstyle ':completion:*:original' list-colors "=*=$color[red];$color[bold]"
### highlight words like 'esac' or 'end'
zstyle ':completion:*:reserved-words' list-colors "=*=$color[red]"
### colorize hostname completion
zstyle ':completion:*:*:*:*:hosts' list-colors "=*=$color[cyan];$color[bg-black]"
### Completionの利便性をあげる
### 表示する補完候補を拡張
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する
zstyle ':completion:*:default' menu select=2
### 補完時に小文字大文字の区別をなくす
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
### 何も入力されていないときのTABでTABが挿入されるのを抑制
zstyle ':completion:*' insert-tab false
### 配列などのindexの何番に何が入ってるか表示してくれる
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
### コマンドにsudoを付けても補完
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
### manコマンドの候補をセクションで別けてくれる
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
### カレントディレクトリに候補がない場合のみ cdpath 上のディレクトリを候補に出す
cdpath=($HOME $DEV) # あらかじめcdpathを適当に設定しておく
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
### cd は親ディレクトリからカレントディレクトリを選択しないので表示させないようにする (例: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd

### brew zsh-completionsで補完力をさらに上げてくれる
if [ -e /usr/local/share/zsh-completions ]; then
  export FPATH=/usr/local/share/zsh-completions:$FPATH
fi