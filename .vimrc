set nocompatible
filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
filetype plugin indent on

" Indent Configure:
set ts=2 
set tw=0
set autoindent
set shiftwidth=2
set noexpandtab

" Visual Configure:
set number

" Color Scheme Configure:
syntax enable
set background=light
let g:solarized_termtrans=1
let g:solarized_termcolors=256
colorscheme solarized

" Create directory automatically:
augroup vimrc-auto-mkdir
	autocmd!
	autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
	function! s:auto_mkdir(dir, force)
		if !isdirectory(a:dir) && (a:force ||
		\ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
			call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
			endif
		endfunction
augroup

" ---------------------
"  Vim-latex Configure:
" --------------------
" filetype plugin on
let tex_flavor = 'latex'
set grepprg=grep\ -nH\ $*
set shellslash
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
