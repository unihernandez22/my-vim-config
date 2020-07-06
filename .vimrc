" Plugins
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'zah/nim.vim'
Plug 'tomasr/molokai'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

" Tabs
set autoindent
set tabstop=4
set shiftwidth=4

" Syntax Highlighting
syntax on

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" The fucking backspace
set backspace=indent,eol,start

" Make visible the invisible characters
set listchars=eol:↲,tab:↦\ ,extends:…,space:⋅

" Color Scheme
" set background=dark
" let g:molokai_original = 1
" colo monokai
packadd! dracula
syntax enable
colorscheme dracula

" My language highlight
au BufNewFile,BufRead *.uni set syntax=python

" Show line and char numbers in corner
set ruler

" :Run command
function! FunRun(...)
	w
	let filename = expand("%:p")
	let ext = expand("%:e")
	let args = "'" . filename . "' " . join(a:000)
	if ext == "nim"
		exe "!nim c -r " . args
	elseif ext == "py"
		exe "!python " . args
	elseif ext == "d"
		exe "!rdmd " . args
	endif
endfunction

command! -nargs=* Run call FunRun(<args>)
" command! Run call FunRun()

" D language server
let g:LanguageClient_serverCommands = {
    \ 'd': ['/home/unai/Descargas/dls-v0.26.2.linux.x86_64/dls']
    \ }


nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Saludame
autocmd VimEnter * echo "Bienvenido Uni :)"
autocmd VimLeave * echo "Nos vemos en el infierno."
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
" let s:opam_share_dir = system("opam config var share")
" let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')
" 
" let s:opam_configuration = {}
" 
" function! OpamConfOcpIndent()
"   execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
" endfunction
" let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')
" 
" function! OpamConfOcpIndex()
"   execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
" endfunction
" let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')
" 
" function! OpamConfMerlin()
"   let l:dir = s:opam_share_dir . "/merlin/vim"
"   execute "set rtp+=" . l:dir
" endfunction
" let s:opam_configuration['merlin'] = function('OpamConfMerlin')
" 
" let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
" let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
" let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
" for tool in s:opam_packages
"   " Respect package order (merlin should be after ocp-index)
"   if count(s:opam_available_tools, tool) > 0
"     call s:opam_configuration[tool]()
"   endif
" endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
