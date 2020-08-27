function! VisualSelection()
    if mode()=="v"
        let [line_start, column_start] = getpos("v")[1:2]
        let [line_end, column_end] = getpos(".")[1:2]
    else
        let [line_start, column_start] = getpos("'<")[1:2]
        let [line_end, column_end] = getpos("'>")[1:2]
    end
    if (line2byte(line_start)+column_start) > (line2byte(line_end)+column_end)
        let [line_start, column_start, line_end, column_end] =
        \   [line_end, column_end, line_start, column_start]
    end
    let lines = getline(line_start, line_end)
    if len(lines) == 0
            return ''
    endif
    let lines[-1] = lines[-1][: column_end - 1]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

command! EditSel exe 'edit ' . VisualSelection()

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
		exe "!ldc --run " . args
	elseif ext == "tex"
		exe "!pdflatex " . filename
	endif
endfunction

command! -nargs=* Run call FunRun(<args>)


