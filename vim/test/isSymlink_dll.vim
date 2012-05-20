"volvic geyser 改変 2012/05/04
"必要なもの: vimproc
"isSymlink.exeをパスに通す
"
"""IsSymLink.exeの場所
let g:is_symlink_exec_path = 'isSymlink.exe'

"実行ファイルの有無
if !executable(g:is_symlink_exec_path)
  throw printf("IsSymLink.exeが確認できませんでした。シンボリックファイル自体が上書きされてしまいます\n g:is_symlink_exe_path =  %s", g:is_symlink_exec_path)
else
	autocmd BufRead * call s:IsSymlink()
	function! s:IsSymlink()
		let l:dll_path=expand('<sfile>:p:h') . "/vimfiles/plugin/isSymlink_dll.dll"
		if !filereadable(l:dll_path)
			throw printf('isSymlink_dll.dllがありません %s', l:dll_path)
		endif
		let s:res = libcall(l:dll_path, "is_symlink", expand('%:p'))  
		"let s:res = split(vimproc#system(g:is_symlink_exec_path . ' "' . escape(expand('%:p'), '\') . '"'), ',')
		if (s:res[0] == 'true')
			let s:filetype = &filetype
			edit `=s:res[1]`
			let &syntax = s:filetype
		elseif (s:res[0] == 'error')
			echoerr 'isSymlink : ' . s:res[1]
		endif
	endfunction

endif
