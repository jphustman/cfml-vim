set nocompatible

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle'))

" Let neobundle manage neobundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Use neobundle standard recipes.
NeoBundle 'Shougo/neobundle-vim-scripts'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Lokaltog/powerline'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'git@github.com:jphustman/cf-utils.vim.git'

" ...

filetype plugin indent on " Required!

" Installation check.
NeoBundleCheck

"...

" Solarized
syntax enable
set background=dark
colorscheme solarized




" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2 " Always display the statusline in all windows
"set noshowmode " Hide the default mode text (e.g. --INSERT -- below the statusline)


" Syntastic
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_check_on_open=1





" Settings
set number
set cursorline
set lines=40
set colorcolumn=80
set columns=84
set incsearch " jumps to search word as you type

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set guifont=Inconsolata\ Medium\ 10


autocmd FileType c,cfml,cfscript,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()

" Strip whitespace
function! StripTrailingWhitespace()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" do the business:
	%s/\s\+$//e
	" clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction



if !has('vim_starting')
	" Call on_source hook when reloading .vimrc.
	call neobundle#call_hook('on_source')
endif
