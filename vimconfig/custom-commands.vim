" :Run command
function! FunRun(...)
	w
	let filename = expand("%:p")
	let ext = expand("%:e")
	let args = "'" . filename . "' " . join(a:000)
  if ext == "nim"
		exe "!nim c -r " . args
	elseif ext == "nims"
		exe "!nim e " . args
	elseif ext == "py"
		exe "!python " . args
	elseif ext == "d"
		exe "!ldc2 --run " . args
	elseif ext == "tex"
		exe "!pdflatex " . filename
	elseif ext == "hs"
		exe "!runhaskell " . filename
	endif
endfunction

"command! -nargs=* Run call FunRun(<args>)


