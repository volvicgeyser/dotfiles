"辞書ファイルの設定 .vim/dict/


" required!
filetype off

"vimの設定フォルダの指定
if has('win32') || has('win64')
    let $DOTVIMPATH = expand('~/vimfiles')
else
    let $DOTVIMPATH = expand('~/.vim')
endif


"vundleの設定
 set rtp+=$DOTVIMPATH/bundle/vundle/
 call vundle#rc($DOTVIMPATH . '/bundle')

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'tpope/vim-rails.git'

 Bundle 'Shougo/vimproc'
 Bundle 'Shougo/vimshell'
 Bundle 'Shougo/vimfiler'
 Bundle 'Shougo/neocomplcache-snippets-complete' 
 " vim-scripts repos
 Bundle 'L9'
 Bundle 'FuzzyFinder'
 " non github repos
 Bundle 'git://git.wincent.com/command-t.git'
 
 
 Bundle 'unite.vim' 
 Bundle 'quickrun.vim'
 Bundle 'AutoComplPop'
 Bundle 'h1mesuke/unite-outline'
 Bundle 'GoogleSuggest-Complete'
 Bundle 'SingleCompile'
 Bundle 'TwitVim'
 Bundle 'neocomplcache'
 Bundle 'thinca/vim-ref'
 Bundle 'Shougo/neocomplcache-clang'

 "
 Bundle 'EnhCommentify.vim'
 "Bundle 'Search-Google'
 Bundle 'YankRing.vim'
 Bundle 'colorsel.vim'
 Bundle 'copypath.vim'
 Bundle 'unite-font'
 Bundle 'vim-refact'
 Bundle 'visual_studio.vim'
 Bundle 'restart.vim'
 Bundle 'reload.vim'
 Bundle 'openurl.vim'
 Bundle 'hier'

 "wordpress
 Bundle 'VimRepress'

 " ...

 filetype plugin indent on     " required! 
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - swww.namazu.orgearch(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..



"タブの設定
set autoindent
set tabstop=4


"テンプレートファイルの設定　read template files.
autocmd BufNewFile *.c 0r $HOME/.vim/template/c.txt
autocmd BufNewFile Makefile 0r $HOME/.vim/template/Makefile.txt
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/cpp.txt

"クリップボードをGUIと連携
set clipboard=unnamed

"タブの設定
set autoindent
set tabstop=4

autocmd BufNewFile *.c 0r $HOME/.vim/template/c.txt
autocmd BufNewFile Makefile 0r $HOME/.vim/template/Makefile.txt

"高度なインデント
set smartindent

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"文字のカラーをセット
colorscheme delek

"ステータス行を表示
set laststatus=2

set statusline=%<%f\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V%8P

""" twitvim
let twitvim_count = 40
nnoremap ,tp :<C-u>PosttoTwitter<CR>
nnoremap ,tf :<C-u>FriendsTwitter<CR><C-w>j
nnoremap ,tu :<C-u>UserTwitter<CR><C-w>j
nnoremap ,tr :<C-u>RepliesTwitter<CR><C-w>j
nnoremap ,tn :<C-u>NextTwitter<CR>

autocmd FileType twitvim call s:twitvim_my_settings()
function! s:twitvim_my_settings()
  set nowrap
endfunction


function! s:HandleURI()
  let uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  let browser = "firefox"
  echo uri
  if uri != ""
    exec "!". browser. " \"" . uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction

nnoremap <Leader>w :<C-u>call <SID>HandleURI()<CR>
