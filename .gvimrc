"色の設定
colorscheme koehler

"フォントの設定
set guifont="Takao Pゴシック:h12"

"コピペにクリップボードを使う
if(has('win32') || has('win64'))
	set clipboard=unnamed
else
"    set clipboard=unnamed,autoselect
	set clipboard=unnamed    
endif

"フォントの設定
if(has('win32') || has('win64'))
		set guifont=Tako ゴシック:h12
else
"        set guifont=TakoP ゴシック:h12
endif


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


"メニューの設定
amenu PopUp.-Sep- :

"windows only
amenu PopUp.メニューを召喚!(∵\ ).on :<silent><C-u>call <SID>Show_pp_menu()<CR>
amenu PopUp.メニューを召喚!(∵\ ).off :<silent><C-u>call <SID>Close_pp_menu()<CR>

amenu myTools.hello :echo('hello')<CR>
"amenu myTools.Pi :echo sin(1/4)<CR>
if(has('reltime'))
		amenu myTools.乱数 :<C-u>call <SID>MakeRandomTab()<CR>
endi
