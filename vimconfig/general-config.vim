" Syntax Highlighting
syntax on

" Mouse
set mouse=a

" Airline config
let g:airline#extensions#tabline#enabled = 1

" The fucking backspace
set backspace=indent,eol,start

" Invisible characters
set listchars=eol:↲,tab:↦\ ,extends:…,space:⋅

" Color Scheme
syntax enable
colorscheme dracula

" My language highlight
au BufNewFile,BufRead *.uni set syntax=python

" Show line and char numbers in corner
set ruler

" Saludame
autocmd VimEnter * echo "Bienvenido Uni :)"
autocmd VimLeave * echo "Nos vemos en el infierno."
