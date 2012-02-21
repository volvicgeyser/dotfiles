"インクリメンタルサーチ
set incsearch

"前回の検索パターンをハイライト :nohでハイライト消せる
set hlsearch

"エンコードの自動判別
set fileencodings=ucs-bom,cp932,euc-jp,utf-8,default,latin1


"メニューとツールバー削除
set guioptions+=b
set guioptions-=m
set guioptions-=T
set nocompatible


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
 "Bundle 'Shougo/neocomplcache-snippets-complete' 
 " vim-scripts repos
 Bundle 'L9'
 Bundle 'FuzzyFinder'
 " non github repos
 Bundle 'git://git.wincent.com/command-t.git'
 
 
 Bundle 'unite.vim' 
 Bundle 'quickrun.vim'
 "Bundle 'AutoComplPop'
 Bundle 'h1mesuke/unite-outline'
 Bundle 'GoogleSuggest-Complete'
 Bundle 'SingleCompile'
 Bundle 'TwitVim'
 Bundle 'thinca/vim-ref'
 "Bundle 'Shougo/neocomplcache-clang'
 Bundle 'neocomplcache'

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
autocmd BufNewFile *.c 0r $DOTVIMPATH/template/c.txt
autocmd BufNewFile Makefile 0r $DOTVIMPATH/template/Makefile.txt
autocmd BufNewFile *.cpp 0r $DOTVIMPATH/template/cpp.txt

let s:boostver="1_47"
if has('win32') || has('win64')
	let $BOOST_ROOT = "C:/Program Files/boost/boost".s:boostver."/boost"
else
	"for ubuntu
 	let $BOOST_ROOT = "/usr/include/boost"
endif


"スニペットファイルの読み込み
let g:NeoComplCache_SnippetsDir = $DOTVIMPATH .'/snippets'


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


"neocomplcache
let g:neocomplcache_enable_at_startup = 1


"dictionary neocomplcacheの辞書の設定
let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'php'	: $DOTVIMPATH . expand('/dict/php.dict'), 
		\ 'cpp'	: $DOTVIMPATH . expand('/dict/cpp.dict'),
		\ 'pl'	: $DOTVIMPATH . expand('/dict/pl.dict'),
\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif


let g:neocomplcache_keyword_patterns['default'] = '\h\w*'


"これを有効にするとdd（一行削除）の挙動がおかしくなる！
"noremap d. :NeoComplCacheCachingDictionary


"コードスニペット
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

"neocomplcache
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>"
function! s:check_back_space()"{{{
let col = col('.') - 1
return !col || getline('.')[col - 1] =~ '\s'
endfunction"}}

"ref
let g:ref_alc_cmd = 'w3m -dump %s'
let g:ref_alc_start_linenumber = 39 
if exists('*ref#register_detection')
	call ref#register_detection('_', 'alc')
endif


nnoremap ,ufo : <C-u>Unite font<CR> 
nnoremap ,ra : <C-u>Ref alc<Space>
nnoremap ,uo : <C-u>Unite outline<CR>
nnoremap ,um : <C-u>Unite mapping<CR> 
nnoremap ,ur : <C-u>Unite file_mru<CR> 
nnoremap ,ub : <C-u>Unite buffer<CR> 
nnoremap ,ufi : <C-u>UniteWithBufferDir -buffer-name=files file<CR> 
nnoremap ,ufav : <C-u>Unite bookmark<CR>
nnoremap ,ure : <C-u>Unite -buffer-name=register register<CR>
nnoremap ,sc : <C-u>SingleCompile<CR>
nnoremap ,, : <C-u>tabnew<CR>
