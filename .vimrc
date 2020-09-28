" Don't try to be vi compatible
set nocompatible
set nocursorline
set ttyfast
set lazyredraw

" Uncomment below to enable pathogen
execute pathogen#infect()

" Set color mode
if (has("termguicolors"))
  if empty($COLORTERM)
    set t_Co=256
  else
    set termguicolors
  endif
endif

" Enable mouse support
set mouse=a

" Use UTF-8 encoding
set encoding=UTF-8

" Turn on syntax highlighting
syntax on

" Default to 2 spaces for indentation
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set ai
set si
set wrap

" Show indentations
let g:indentLine_char=''
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar='∙'

" Show marginal whitespaces
set list
set listchars=eol:¬,tab:⇥»,trail:∙

" Turn on line numbers
set number

" Show file stats
set ruler
