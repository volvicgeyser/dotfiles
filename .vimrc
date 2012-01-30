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
