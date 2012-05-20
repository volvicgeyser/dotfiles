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

#alias aptitude
alias ai='sudo aptitude install'
alias ar='sudo aptitude remove'
alias aiy='sudo aptitude install -y'
alias aiu='sudo aptitude update'
alias aiug='sudo aptitude upgrade'

#alias git
alias gita='git add .'
alias gits='git status'
alias gitc='git commit'


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

#gentooフォルダのパス
declare EPREFIX="$HOME/gentoo"

#gentoo prefixの設定
if [ -d $EPREFIX ]; then
	export EPREFIX=$EPREFIX
fi


#url http://gist.github.com/414589
#auto_fu.zshによる自動補完
if [ -f "$HOME/.zsh/auto-fu.zsh/auto-fu.zsh" ]; then
	unsetopt sh_wordsplit
	zstyle ':completion:*' completer _oldlist _complete _expand _match _prefix _approximate _list _history

	AUTO_FU_NOCP=1 source $HOME/.zsh/auto-fu.zsh/auto-fu.zsh
	zle-line-init() {
		auto-fu-init
	}
	zle -N zle-line-init

    # http://d.hatena.ne.jp/tarao/20100823/1282543408
    #auto-fu.zshでコマンドを確定するときに不完全な補完サフィックスを無視する
	#例:
	#$ ls -l dir
	#と入力した時に
	#Enterを押さずにTabキーを押してしまうと
	#$ ls -l directory-with-very-long-name/0
	#まで補完される
	#
	#Tabを押しても/0まで補完しないようにする
	function afu+delete-unambiguous-prefix () {
        afu-clearing-maybe
        local buf; buf="$BUFFER"
        local bufc; bufc="$buffer_cur"
        [[ -z "$cursor_new" ]] && cursor_new=-1
        [[ "$buf[$cursor_new]" == ' ' ]] && return
        [[ "$buf[$cursor_new]" == '/' ]] && return
        ((afu_in_p == 1)) && [[ "$buf" != "$bufc" ]] && {
            # there are more than one completion candidates
            zle afu+complete-word
            [[ "$buf" == "$BUFFER" ]] && {
                # the completion suffix was an unambiguous prefix
                afu_in_p=0; buf="$bufc"
            }
            BUFFER="$buf"
            buffer_cur="$bufc"
        }
    }
    zle -N afu+delete-unambiguous-prefix
    function afu-ad-delete-unambiguous-prefix () {
        local afufun="$1"
        local code; code=$functions[$afufun]
        eval "function $afufun () { zle afu+delete-unambiguous-prefix; $code }"
    }
    afu-ad-delete-unambiguous-prefix afu+accept-line
    afu-ad-delete-unambiguous-prefix afu+accept-line-and-down-history
    afu-ad-delete-unambiguous-prefix afu+accept-and-hold

fi


# http://d.hatena.ne.jp/tyru/20100828/run_tmux_or_screen_at_shell_startup
# tmux -> tscreen -> screen　の優先順位で起動する
is_screen_running() {
    # tscreen also uses this varariable.
    [ ! -z "$WINDOW" ]
}
is_tmux_runnning() {
    [ ! -z "$TMUX" ]
}
is_screen_or_tmux_running() {
    is_screen_running || is_tmux_runnning
}
shell_has_started_interactively() {
    [ ! -z "$PS1" ]
}
resolve_alias() {
    cmd="$1"
    while \
        whence "$cmd" >/dev/null 2>/dev/null \
        && [ "$(whence "$cmd")" != "$cmd" ]
    do
cmd=$(whence "$cmd")
    done
echo "$cmd"
}


if ! is_screen_or_tmux_running && shell_has_started_interactively; then
for cmd in tmux tscreen screen; do
if whence $cmd >/dev/null 2>/dev/null; then
            $(resolve_alias "$cmd")
            break
fi
done
fi


#export PATH="$PATH:$EPREFIX/usr/bin:$EPREFIX/bin:$EPREFIX/tmp/usr/bin:$EPREFIX/tmp/bin:/usr/sfw/bin:/usr/sfw/i386-sun-solaris2.10/bin:/usr/sfw/sparc-sun-solaris2.10/bin:/usr/bin:/bin"
