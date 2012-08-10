
"Windows風キーバインド
"if has('vim_starting') && has('gui_running')
"    source $VIMRUNTIME/mswin.vim
"endif

"テストコードの読み込み
"source 'test.vim'


"バックアップフォルダの指定 {{{
set backupdir=~/.vimbackup
if !isdirectory(&g:backupdir)
	call mkdir(&g:backupdir, 'p')
endif
"}}}


"swapファイルを生成しない
set noswapfile


"ドロップで新しいタブで開く
"複数ファイルの場合、タブで開かれないが裏バッファで開かれる
"complcacheと一緒に使うと補完したときにタブが開いておかしくなる
"autocmd VimEnter * tab all
"autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'
if has('win32') || has('win64')
	set encoding=utf-8
		
endif
scriptencoding cp932

"toggle encoding
"function! s:toggle_encoding()
"if $encoding==utf-8
"	set	$encoding=cp932
"else
"	set $encoding=utf-8
"endif
"endfunction


filetype plugin indent off

"vimの設定フォルダの指定
if has('win32') || has('win64')
	let $DOTVIMPATH = expand('~/vimfiles')
else
	let $DOTVIMPATH = expand('~/.vim')
endif

"if (has('win32') || has('win64')) && has('vim_starting')
"    if(!isdirectory('~/Dropbox/vim'))
"        echoerr "HOMEディレクトリにDropBox/vimがありません"
"    endif
"endif

"コマンドラインの補完でTabを押したときに
"候補を横に列挙する
set wildmenu

"検索の時に大文字小文字区別無し
set ignorecase

"大文字と小文字が混ざってるときは区別して検索
set smartcase
set hidden "保存していないバッファあっても表示しない
set ambiwidth=double	"コマンドライン補完をする時　強化版
set incsearch "インクリメンタルサーチ
set cmdheight=1 "コマンドラインの高さ
set hlsearch "前回の検索パターンをハイライト :nohでハイライト消せる

"vimshell
let g:vimshell_user_prompt = 'getcwd()'

"tab
set tabstop=4
set shiftwidth=4

"エンコードの自動判別 windowsだとcp932でばける？
if(has('unix'))
	set fileencodings=ucs-bom,cp932,euc-jp,utf-8,default,latin1
endif


"メニューとツールバー削除 {{{
set guioptions+=b
set guioptions-=m
set guioptions-=T
set nocompatible

"}}}


"NeoBundleの設定
if has('vim_starting')
    if has('win32') || has('win64')	
        set runtimepath+=~/vimfiles/bundle/neobundle.vim
	else
		set runtimepath+=~/.vim/bundle/neobundle.vim
    endif
    call neobundle#rc(expand('~/.bundle'))
endif

 " My Bundles here:
 "
 " original repos on github
" NeoBundle 'Shougo/neobundle.vim'
 NeoBundle 'Shougo/vimproc'
 NeoBundle 'Shougo/vimshell'
 NeoBundle 'Shougo/vimfiler'
 NeoBundle 'Shougo/neocomplcache-snippets-complete' 
 NeoBundle 'L9'
" NeoBundle 'FuzzyFinder'
 
 NeoBundle 'Shougo/unite.vim' 
 NeoBundle 'quickrun.vim'
 NeoBundle 'h1mesuke/unite-outline'
 NeoBundle 'SingleCompile'
 NeoBundle 'TwitVim'
 NeoBundle 'thinca/vim-ref'
 NeoBundle 'Shougo/neocomplcache-clang'
 NeoBundle 'Shougo/neocomplcache'
 "NeoBundle 'clang-complete'
 "
 NeoBundle 'EnhCommentify.vim'
 "NeoBundle 'Search-Google'
 NeoBundle 'YankRing.vim'
 NeoBundle 'colorsel.vim'
 NeoBundle 'copypath.vim'
 NeoBundle 'unite-font'
 NeoBundle 'vim-refact'
 NeoBundle 'visual_studio.vim'
 NeoBundle 'restart.vim'
 NeoBundle 'reload.vim'
 NeoBundle 'openurl.vim'
 NeoBundle 'hier'
 if has('win32') || has('win64')
	 NeoBundle 'debug.vim'
 endif
 "compile
 "wordpress
 NeoBundle 'VimRepress'
 
 "Tree Explorer
 NeoBundle 'opsplorer'

 "ステータスライン PowerLine
 "NeoBundle 'Lokaltog/vim-powerline'
 
 "カラースキーム切り替え
 NeoBundle 'unite-colorscheme'
 
 "eskk インストールするとなぜかunite.vimでエラーが大量にでる
"NeoBundle 'tyru/eskk.vim'
"NeoBundle 'Rip-Rip/clang_complete'
"NeoBundle 'osyo-manga/neocomplcache-clang_complete'
 " ...

 NeoBundle 'yuratomo/w3m.vim'
 NeoBundle 'tyru/open-browser.vim'
 NeoBundle 'Shougo/vinarise'

 "テンプレートの自動切り替え template
 "*.py *.cppなどをtemplateフォルダに入れる
 "
 "filetype=*.py
 "Makefile_*
 "なども検索対象
 NeoBundle 'qtmplsel.vim'
 


"d + s + 囲んでるもの
"ds'     (今カーソルのある文字列を囲んでいる ' を消す)
"ds"     (" を)
"ds(     (() を)
"dst     (<tag> を)
"
"c + s + 囲んでるもの, + 変更したいもの
"cs'"            (今囲んでいる ' を " に変える)
"cs"<tag>        (今囲んでいる " を <tag> に変える)
"cst<tag>        (直近で囲まれてるタグを <tag> に)
"
"ys + 範囲 + 囲む文字列
 NeoBundle 'surround.vim'

 

 "Dart snippets
 NeoBundle 'osyo-manga/neocomplcache-snippets-complete-dart.git'
 NeoBundle 'vim-scrtips/Dart.git'
 
 

 filetype plugin indent on     " required! 

"タブの設定
set autoindent
set tabstop=4

"テンプレートファイルの設定　read template files.
"autocmd BufNewFile *.c 0r $DOTVIMPATH/template/c.txt
"autocmd BufNewFile Makefile 0r $DOTVIMPATH/template/Makefile.txt
"autocmd BufNewFile *.cpp 0r $DOTVIMPATH/template/cpp.txt

"Boost version
let s:boostver="1_47"

if has('win32') || has('win64')
	let $BOOST_ROOT = expand("C:/Program Files/boost/boost_".s:boostver."/boost")
else
	"for ubuntu
 	let $BOOST_ROOT = expand("/usr/include/boost")
endif


"dart quickrun
"let g:quickrun_config.dart = {
"\ "command" : "dart"
"\ }

"GCC version
if has('win32') || has('win64')
	let s:gccver=expand('4.6.2')
else
	"for ubuntu
	let s:gccver=''
endif

" Use clang dll.
let g:neocomplcache_clang_use_library = 1

" Clang Path
if has('win32') || has('win64')
	let s:clang_path = expand('C:/lib/clang') 
else
	let s:clang_path = expand('~/scripts/') 
endif
"if has('win32') || has('win64')
"let s:clang_exec = expand('C:/lib/clang/clang.exe') 

"error check for clang path
if(!isdirectory(s:clang_path))
	throw 'Cant detect clang.dll -> ' . s:clang_path 
endif
"if(!filereadable(s:clang_exec))
"    throw 'Cant detect clang.dll -> ' . s:clang_exec 
"endif

"set path
let g:neocomplcache_clang_library_path = s:clang_path

"Include path(neocomplcache-clang)
if has('win32') || has('win64')
	set path+=C:/MinGW/include
endif

" More user include path.(neocomplcache-clang)
"let g:neocomplcache_clang_user_options = '' . 
"\ '-I C:/MinGW/lib/gcc/mingw32/'. s:gccver .'/include '.
"\ '-fms-extensions -fgnu-runtime '.
"\ '-include malloc.h '


"\ '-I '. $BOOST_ROOT . ' '.

"clang-complete
"let g:clang_complete_auto = 1
"let g:clang_use_library = 0 
"let g:clang_library_path = s:clang_path 
"let g:clang_exec = s:clang_exec
"if has('win32') || has('win64')
"    let g:clang_user_options =
"\ '-I C:/MinGW/lib/gcc/mingw32/'. s:gccver .'/include '.
"\ '-I '. $BOOST_ROOT . ' '.
"\ '-fms-extensions -fgnu-runtime '.
"\ '2> NUL || exit 0'

"    let g:clang_user_options =
"\ '-I C:/MinGW/lib/gcc/mingw32/'. s:gccver .'/include '.
"\ '-I '. $BOOST_ROOT . ' '.
"\ '-fms-extensions -fgnu-runtime '.
"\ '-include malloc.h 2> NUL || exit 0'

"let g:clang_user_options = '-I C:/MinGW/lib/gcc/mingw32/'. s:gccver .'/include -fms-extensions -fmsc-version=1300 -fgnu-runtime -D__MSVCRT_VERSION__=0x700 -D_WIN32_WINNT=0x0500 -include malloc.h 2> NUL || exit 0"'

"    let g:clang_user_options = '2> NUL || exit 0"'
"else
	"for ubuntu
"    let g:clang_user_options = '2>/dev/null || exit 0"'
"endif

" More neocomplcache candidates.
let g:neocomplcache_max_list = 1000

"スニペットファイルの読み込み
let g:NeoComplCache_SnippetsDir = $DOTVIMPATH .'/snippets'

"quick match 補完時にアルファベットのショートカット -を入力すると表示される
let neocomplcache_enable_quick_match = 1

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"文字のカラーをセット
"colorscheme delek

"ステータス行を表示
set laststatus=2

set statusline=%<%f\ %m%r%h%w[%Y]
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V%8P

""" twitvim
let twitvim_count = 40
nnoremap ,tp :<C-u>PosttoTwitter<CR>
nnoremap ,tf :<C-u>FriendsTwitter<CR>
nnoremap ,tu :<C-u>UserTwitter<CR>
nnoremap ,tr :<C-u>RepliesTwitter<CR>
nnoremap ,tn :<C-u>NextTwitter<CR>
nnoremap ,tl :<C-u>ListTwitter 

autocmd FileType twitvim call s:twitvim_my_settings()
function! s:twitvim_my_settings()
	set nowrap
endfunction


function! s:HandleURI()
	let uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
if has('win32') || has('win64')
	let browser = "opera"
else
	let browser = "open!"
endif
	echo uri
	if uri != ""
		exec "!". browser. " \"" . uri . "\""
	else
		echo "No URI found in line."
	endif
endfunction

nnoremap <Leader>w :<C-u>call <SID>HandleURI()<CR>


"neocomplcache enable
let g:neocomplcache_enable_at_startup = 1
"if !exists('g:neocomplcache_include_paths')
"    let g:neocomplcache_include_paths = {}
"endif

"if has('win32') || has('win32')
"    let g:neocomplcache_include_paths.cpp = "C:/MinGW/lib/gcc/mingw32/4.6.2/include/C++"
"endif

"if has('win32') || has('win32')
"    set path+=C:/MinGW/include
"    set path+=C:/MinGW/lib/gcc/mingw32/4.6.2/include
"endif

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
endfunction"}}}





"vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_sort_type = 'filename'
let g:vimfiler_enable_clipboard = 1
let g:vimfiler_safe_mode_by_default = 0

"call vimfiler#set_execute_file('vim', 'vim')
"    call vimfiler#set_execute_file('txt', 'notepad')
"    call vimfiler#set_execute_file('c', ['vim', 'notepad'])
"    
"     Edit file by tabedit.
"    let g:vimfiler_edit_action = 'tabopen'
"    
"    let g:vimfiler_as_default_explorer = 1
"    
"     Enable file operation commands.
"    let g:vimfiler_safe_mode_by_default = 0
"    
"     Like Textmate icons.
"    let g:vimfiler_tree_leaf_icon = ' '
"    let g:vimfiler_tree_opened_icon = '笆ｾ'
"    let g:vimfiler_tree_closed_icon = '笆ｸ'
"    let g:vimfiler_file_icon = '-'
"    let g:vimfiler_marked_file_icon = '*'

	" Use trashbox.
	" Windows only and require latest vimproc.
	"let g:unite_kind_file_use_trashbox = 1



"ref
"let g:ref_alc_cmd = 'lynx --dump '
let s:lynx = expand('C:/Program Files/Lynx for Win32/lynx.exe')
let s:lynx_cfg = expand('C:/Program Files/Lynx for Win32/lynx.cfg')
let g:ref_alc_cmd = s:lynx . ' -cfg=' . s:lynx_cfg . ' --dump %s'
let g:ref_alc_use_cache = 1
let g:ref_alc_start_linenumber = 39 " 余計な行を読み飛ばす
let g:ref_alc_encoding = 'SHIFT-JIS'    
"let g:ref_cache_dir = 'g:\cache\'   " ローカルにキャッシュ
"if exists('*ref#register_detection')
"     filetypeが分からんならalc
"    call ref#register_detection('_', 'alc')
"endif

"let g:ref_use_vimproc = 1

nnoremap ,ufo : <C-u>Unite font<CR> 
nnoremap ,ra : <C-u>Ref alc<Space>
nnoremap ,uo : <C-u>Unite outline<CR>
nnoremap ,um : <C-u>Unite mapping<CR> 
nnoremap ,ur : <C-u>Unite file_mru<CR> 
nnoremap ,un : <C-u>Unite 
nnoremap <silent>,ub : <C-u>Unite buffer<CR> 
nnoremap ,ufi : <C-u>UniteWithBufferDir -buffer-name=files file<CR> 
nnoremap ,ufav : <C-u>Unite bookmark<CR>
nnoremap ,ure : <C-u>Unite -buffer-name=register register<CR>
nnoremap ,sc : <C-u>SingleCompile<CR>
nnoremap <silent>,run : <C-u>SingleCompileRun<CR>
nnoremap ,, : <C-u>tabnew
nnoremap <silent>,vf : <C-u>VimFiler<CR>
nnoremap <silent>,vs : <C-u>call <SID>DoVimShell()<CR>
nnoremap <silent>,xc : <C-u>:qa!<CR>
nnoremap <silent>,ni : <C-u>NeoBundleInstall<CR>
nnoremap <silent>,nu : <C-u>NeoBundleUpdate<CR>
nnoremap <silent>,nc : <C-u>NeoBundleClean<CR>

"一番右へ移動
nnoremap ,ll $
"一番左へ移動
nnoremap ,hh 0

nnoremap <UP> kk 
nnoremap <Down> jj 
nnoremap <Left> hh 
nnoremap <Right> ll 


"nnoremap <MiddleMouse> <nop>
"nnoremap <RightMouse> "+y 

function! s:DoVimShell()
VimShellPop
endfunction

nnoremap ,ua : <C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"nnoremap ,vex : <C-u>Vex<CR>vertical resize -15
nnoremap ,vex :<C-u>call <SID>DoVex()<CR>
function! s:DoVex()
	Vex
	vertical resize 25	
endfunction

nnoremap ,ops :<C-u>call <SID>DoOps()<CR>
function! s:DoOps()
	Ops	
endf

"全て保存終無効
nnoremap ZZ <Nop>

"スペースキーで　スクロール
nnoremap <Space> jzz
nnoremap <M-Space> kzz
nnoremap <S-Space> kzz

"SingleComiple
"Key bindings
 nmap <F6> :SCCompile<cr> 
 nmap <F5> :SCCompileRun<cr>
 
 " 使用する msvc を設定
 
"{{{ Single Compile 
if has('win32') || has('win64')
	let $VSINSTALLDIR="C:/Program Files/Microsoft Visual Studio 10.0"
	let $VCINSTALLDIR=$VSINSTALLDIR."/VC"

	let $DevEnvDir=$VSINSTALLDIR."/Common7/IDE;"
	let $PATH=$VSINSTALLDIR."Common7/Tools;".$PATH
	let $PATH=$VCINSTALLDIR."/bin;".$PATH
	let $PATH=$DevEnvDir.";".$PATH

	let $INCLUDE=$VCINSTALLDIR."/include;".$INCLUDE
	let $LIB=$VCINSTALLDIR."/LIB;".$LIB
	let $LIBPATH=$VCINSTALLDIR."/LIB;".$LIBPATH
	" Windows SDK（or Platform SDK？）
	let $WindowsSdkDir="C:/Program Files/Microsoft SDKs/Windows/v7.1"
	let $INCLUDE=$WindowsSdkDir."/include;".$INCLUDE
	let $LIB=$WindowsSdkDir."/lib;".$LIB

	"Boost
	let $INCLUDE="C:/Program Files/boost/boost_1_47;".$INCLUDE

endif
"}}}

"QuickRun
"let g:quickrun_compile_command="/EHsc"


"msvc
"let g:quickrun_config["msvc_debug"]={}




let g:quickrun_config = {}


" C++ 用の設定
" 基本的にコンパイルのみ行う設定で、
" 実行は ["run/vimproc"] で行う

let s:quickrun_cpp_default = {
			\ "type" : "cpp",
			\ "runner" : "vimproc",
			\ "outputter" : "quickfix"
			\ }

let s:gcc_lib_path=' '

" gcc コンパイラオプション
if has('win32') || has('win64')
	let $BOOST_LATEST_ROOT="C:/Program Files/boost/boost_1_47"
	let include_dirs = $BOOST_LATEST_ROOT
	let s:gcc_option= include_dirs.' -Wall -fexec-charset=CP932 '
else
	let $BOOST_LATEST_ROOT="/usr/include/boost"
	let include_dirs = $BOOST_LATEST_ROOT
	let s:gcc_option= include_dirs.' -Wall'
endif

" 実行
let g:quickrun_config["run/vimproc"] = {
			\ "exec": "%s:p:r %a",
			\ "output_encode" : "utf-8",
			\ "runner" : "vimproc",
			\ "outputter" : "buffer"
			\ }


if has('win32') || has('win64')

	"    let s:gcc_lib_path='-L '.$BOOST_LATEST_ROOT.'/stage/lib '

	" デフォルトの設定
	"let g:quickrun_config["_"] = {
	"            \  "runner/vimproc/updatetime" : 100,
	"            \ "split": "{'rightbelow 8sp'}"
	"            \ }

	" msvc のオプション設定
	let s:msvc_debug_option =
				\"/Zi /nologo /W3 /WX- /Od /Ob1 /Oy- /DWIN32".
				\"/D_DEBUG /D_CONSOLE /D_UNICODE /DUNICODE".
				\"/Gm /EHsc /RTC1 /MTd /GS ".include_dirs

	let s:msvc_release_option = 
				\"/DWIN32 /D_CONCOLE /DNDEBUG ".
				\"/nologo /MT /EHsc /GR ".include_dirs

	let s:msvc_release_link_option=
				\"/link -LIBPATH:".$BOOST_LATEST_ROOT."/stage/lib ".
				\" 'kernel32.lib' 'user32.lib' 'gdi32.lib' ".
				\"'comdlg32.lib' 'advapi32.lib' 'shell32.lib' 'ole32.lib' ".
				\"'oleaut32.lib' 'uuid.lib' 'odbc32.lib' 'odbccp32.lib' "

	let s:msvc_debug_link_option = s:msvc_release_link_option."/DEBUG "

	" msvc デバッグビルド
	let g:quickrun_config["msvc_debug"]={}
	call extend(g:quickrun_config["msvc_debug"], s:quickrun_cpp_default)
	let g:quickrun_config["msvc_debug"]["command"]="cl"
	let g:quickrun_config["msvc_debug"]["exec"]="%c %o %s ".s:msvc_debug_link_option
	let g:quickrun_config["msvc_debug"]["cmdopt"]= s:msvc_debug_option
	let g:quickrun_config["msvc_debug"]["output_encode"]="sjis"

	" msvc リリースビルド
	let g:quickrun_config["msvc_release"]={}
	call extend(g:quickrun_config["msvc_release"], g:quickrun_config["msvc_debug"])
	let g:quickrun_config["msvc_release"]["exec"]="%c %o %s ".s:msvc_release_link_option
	let g:quickrun_config["msvc_release"]["cmdopt"]= s:msvc_release_option

endif
" g++
let g:quickrun_config["g++"]={}
call extend(g:quickrun_config["g++"], s:quickrun_cpp_default)
let g:quickrun_config["g++"]["command"]="g++"
let g:quickrun_config["g++"]["exec"]="%c %o %s -o %s:p:r".s:gcc_lib_path
let g:quickrun_config["g++"]["cmdopt"]= s:gcc_option

" g++0x
let g:quickrun_config["g++0x"]={}
call extend(g:quickrun_config["g++0x"], g:quickrun_config["g++"])
let g:quickrun_config["g++0x"]["cmdopt"]=s:gcc_option." -std=gnu++0x "

" clang++
let g:quickrun_config["clang++"]={}
call extend(g:quickrun_config["clang++"], g:quickrun_config["g++"])
let g:quickrun_config["clang++"]["command"]="clang++"

" clang++0x
let g:quickrun_config["clang++0x"]={}
call extend(g:quickrun_config["clang++0x"], g:quickrun_config["g++0x"])
let g:quickrun_config["clang++0x"]["command"]="clang++"




"SingleCompile
let common_run_command = '$(FILE_TITLE)$'
if has('win32') || has('win64')
	call SingleCompile#SetCompilerTemplate(
		\ 'cpp', 'msvc', 
		\ 'Microsoft Visual C++(original v.geyser)', 'cl',
				\'/DWIN32 /D_CONCOLE /DNDEBUG '.
				\'/nologo /MT /EHsc /GR ', 
		\common_run_command)

	call SingleCompile#ChooseCompiler('cpp', 'msvc')
else
"    call SingleCompile#SetCompilerTemplate(
"                \ 'cpp', 'g++0x', 
"                \ 'GNU C++ Compiler', 'g++',
"                \'-std=gnu++0x -g -o '.
"                \'$(FILE_TITLE)$', 
"                \common_run_command)
	" gcc の C++0x 版を追加する
"    call SingleCompile#SetCompilerTemplate(
"        \ 'cpp', 'g++0x original', 
"        \ 'GNU C++ Compiler', 'g++', '-std=gnu++0x -g -o $(FILE_TITLE)$', 
"        \common_run_command)

"    call SingleCompile#ChooseCompiler('cpp', 'g++0x original')
endif


"C/C++のインクルードガード
nmap <silent> ,ig o<C-r>%<Esc>F.r_$<S-v>gU<C-v>$h"fdddi#ifndef __DEF<C-r>f__<Cr>#define __DEF<C-r>f__<Cr><Cr><Cr><Cr>#endif<Cr><Esc>kkka

"リネーム
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))




"pythonの設定
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finallly,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4


"eskkの設定
let eskk#enable_completion = 1

"set imdisable

if has('win32') || has('win64')
	let s:skk_dict_path = "C:/dict"
endif

"let g:eskk#directory = "~/.eskk"
"let g:eskk#dictionary = { 'path': "~/.skk-jisyo", 'sorted': 0, 'encoding': 'utf-8', }
if has('win32') || has('win64')
	let g:eskk#large_dictionary = { 'path': s:skk_dict_path . "/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp', }
else
	let g:eskk#large_dictionary = { 'path': "~/.eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp', }
endif


"snippets スニペットのフォルダ
let g:neocomplcache_snippets_dir=$DOTVIMPATH . '/snippets'

"Visualモードで連番
"http://d.hatena.ne.jp/fuenor/20090907/1252315621
"coと入力すると連番になる
"0 → 0
"0 → 1
"0 → 2
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endforタブの設定


"w3m {{{
if has('win32') || has('win64')
	let g:w3m#command = "C:/cygwin/bin/w3m.exe"
else
	let g:w3m#command = "/usr/bin/w3m"
endif
"}}}


"unite-source
":Unite menu
"参考: http://d.hatena.ne.jp/osyo-manga/20111011/1318313743

if !exists("g:unite_source_menu_menus")
   let g:unite_source_menu_menus = {}
endif

" menu の説明
let s:commands = {
\   'description' : 'Shortcut',
\}

" コマンドを登録
let s:commands.candidates = {
\   "BoostTest" : "VimFiler $TEST_BOOST",
\   "C++Test"   : "VimFiler $TEST_CPP",
\   "ghci"      : "VimShellInteractive ghci",
\   "python"    : "VimShellInteractive python",
\   "Unite Beautiful Attack" : "Unite -auto-preview colorscheme",
\   "Boost.MPL Ref" : "OpenBrowser http://www.boost.org/doc/libs/release/libs/mpl/doc/refmanual/refmanual_toc.html",
\   "Designe pattern" : "OpenBrowser http://www.geocities.jp/ky_webid/design_pattern/index.html",
\   "VimShellPop" : "VimShellPop",
\}

" 上記で登録したコマンドを評価する関数
" 最終的にこれで評価した結果が unite に登録される
function s:commands.map(key, value)
   return {
\       'word' : a:key,
\       'kind' : 'command',
\       'action__command' : a:value,
\}
endfunction

let g:unite_source_menu_menus["shortcut"] = deepcopy(s:commands)
unlet s:commands

" 呼び出しのキーマップ
nnoremap <silent> <Space>ll :Unite menu:shortcut<CR>


let s:commands = {
\   'description' : 'Boost Reference',
\}

let s:commands.candidates = {
\   "Lambda"  : "OpenBrowser http://www.boost.org/doc/libs/release/doc/html/lambda.html",
\   "Phoenix" : "OpenBrowser http://www.boost.org/doc/libs/release/libs/phoenix/doc/html/index.html",
\   "Asio"    : "OpenBrowser http://www.boost.org/doc/libs/release/doc/html/boost_asio.html",
\   "MPL"     : "OpenBrowser http://www.boost.org/doc/libs/release/libs/mpl/doc/index.html",
\}

function s:commands.map(key, value)
   return {
\       'word' : a:key,
\       'kind' : 'command',
\       'action__command' : a:value,
\}
endfunction

let g:unite_source_menu_menus["boost-ref"] = deepcopy(s:commands)
unlet s:commands

" 呼び出しのキーマップ
nnoremap <silent> <silent> <Space>bb :Unite menu:boost-ref<CR>

"Vimの戦闘力計測
"http://d.hatena.ne.jp/thinca/20091031/1257001194
function! g:Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)






"  vim: set foldmethod=marker :
