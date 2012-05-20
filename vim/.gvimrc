"文字コードの設定
"set encoding=utf-8

"端末の表示に使われる文字コード
set termencoding=utf-8

"カラースキームの設定
colorscheme molokai

"フォントの設定
if(has('win32') || has('win64'))
	set guifont=TakaoGothic:h12
else
	set guifont=TakaoGothic\ 12
endif


""
function! s:Show_pp_menu()
        set go+=m	
endfunction

function! s:Close_pp_menu()
        set go-=m	
endfunction

if(has('reltime'))
	function! s:Random(n)
		let l:match_end = matchend(reltimestr(reltime()), '\d\+\.') + 1
		let l:rand = reltimestr(reltime())[l:match_end : ] % (a:n + 1)
		return l:rand
	endfunction
"    function! s:MakeRandomTab()
"            let i = 0
"            let tmp_buf = bufname("%") 
"            let str=''
"            tabnew
"            let v
"            while i < 10
"                let v = s:Random(100)
"                let i = i + 1
"            endwhile
"            return 0
"    endfunction
endif
command! Rand :echo <SID>Random(100)

"日本語文字カウント
function! s:JCharCount()
  let len = 0
  let maxline = line('$')
  let i = 1
  while i <= maxline
    let len += strlen(substitute(getline(i), '.', 'x', 'g'))
    let i += 1
  endwhile 
  return len
endfunction
"右クリックメニューの設定
amenu PopUp.-Sep- :
amenu PopUp.メニューを召喚!(∵\ ).on :<silent><C-u>call <SID>Show_pp_menu()<CR>
amenu PopUp.メニューを召喚!(∵\ ).off :<silent><C-u>call <SID>Close_pp_menu()<CR>

"メニューが表示されていない場合は
":set go+=m でメニューが表示される
":set go-=m でメニューが非表示になる
"メニューバーにメニュー追加
amenu myTools.hello :echo('hello')<CR>
amenu myTools.日本語文字カウント :<silent><C-u>call <SID>JCharCount()<CR>
amenu myTools.Pi :echo sin(1/4)<CR>
amenu myTools.現在のファイルをvimソースとして読み込む(&S) :so %<CR>
amenu myTools.&ListTwitter :ListTwitter 
if(has('reltime'))
		amenu myTools.乱数 :<C-u>call <SID>MakeRandomTab()<CR>
endif

"コピペにクリップボードを使う
set clipboard=unnamed







