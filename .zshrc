export LANG=ja_JP.UTF-8
#history
HISTFILE=$HOME/.zsh-history
#メモリに保存する履歴の数
HISTSIZE=100000
#保存する履歴の数
SAVEHIST=100000
#コアダンプのサイズを制限
limit coredumpsize 102400
#出力の末尾に改行コードが無い
unsetopt promptcr
#Emacs Like Key-bind
bindkey -v
#Use color
setopt prompt_subst
#Don't use beep
setopt nobeep
#jobs long
setopt long_list_jobs
#show file type
setopt list_types
#Auto resume
setopt auto_resume
#auto list
setopt auto_list
setopt hist_ignore_dups
#auto add cd history
setopt auto_pushd
#dont add history if same directory
setopt pushd_ignore_dups
#automenu
setopt auto_menu
#add start time and end time to history file
setopt extended_history
#cd無しでディレクトリの移動
setopt auto_cd
#コマンドの引数を補完する
autoload -U compinit
compinit
#プロンプトの設定
PROMPT="%n@%m: %~$ "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "
setopt magic_equal_subst
setopt hist_verify
setopt numeric_glob_sort
setopt print_eight_bit
setopt share_history
setopt correct
setopt brace_ccl
#ls color
alias ls='ls --color=auto'
#compctl
compctl -f vim
compctl -/ cd
compctl -F man

#コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#エディタの設定
export EDITOR='vim'

#PATHの追加
PATH=$PATH:$HOME/scripts:$HOME/android/android-sdk-linux_x86/tools

#aliasの設定
alias ll='ls -l'
alias la='ls -a'
alias lf='ls -f'
alias del='rm -i'
alias updatenmz='mknmz -O ~/index ~/myhtml'
alias bc='bc -l -q'
alias w3mg='w3m http://google.co.jp'
alias emacs='emacs -nw'
alias twitvim='vim -c FriendsTwitter'

#例　$ls L
alias -g L='| less' 
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'


if [ x$TERM = xjfbterm ]; then
    alias exit="kill `ps -eH | grep $$ -B1 | grep jfbterm | sed -r "s,^ *([0-9]+).*$,\1,"`"
fi

if [ ${TERM} = "dumb" ]; then
    alias ls='ls -F'
fi

#eclipseの設定
if [ -d $HOME/android-sdk-linux_x86 ]; then
	export ANDROID_HOME="$HOME/android-sdk-linux_x86"
	export PATH="$ANDROID_HOME/tools:$PATH"
	export PATH="$ANDROID_HOME/platform-tools:$PATH"
fi

