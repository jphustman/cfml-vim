set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'




" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

Bundle 'altercation/vim-colors-solarized'
" Bundle 'Lokaltog/powerline'
Bundle 'scrooloose/syntastic'
Bundle 'pangloss/vim-javascript'
" NeoBundle 'git@github.com:jphustman/cf-utils.vim.git'
" NeoBundle 'majutsushi/tagbar'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'matchit.zip'
Bundle 'tpope/vim-fugitive'


Bundle 'JLimperg/Align'
Bundle 'git@github.com:jphustman/SQLUtilities.git'
Bundle 'git@github.com:jphustman/dbext.vim.git'

" NeoBundle 'Shougo/neocomplcache', '', 'default'
" call neobundle#config('neocomplcache', {
" 			\ 'lazy' : 1,
" 			\ 'autoload' : {
" 			\ 'insert' : 1,
" 			\ }})
" 
" NeoBundle 'Shougo/neocomplcache-rsense', '', 'default'
" call neobundle#config('neocomplcache-rsense', {
" 			\ 'lazy' : 1,
" 			\ 'depends' : 'Shougo/neocomplcache',
" 			\ 'autoload' : { 'filetypes' : 'ruby' }
" 			\ })
" 
" NeoBundle 'Shougo/neosnippet', '', 'default'
" call neobundle#config('neosnippet', {
" 			\ 'lazy' : 1,
" 
" 
" 			\ 'autoload' : {
" 			\ 'insert' : 1,
" 			\ 'filetypes' : 'snippet',
" 			\ 'unite_sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
" 			\ }})
"  NeoBundle 'git@github.com:Shougo/neocomplcache-snippets-complete.git'

" NeoBundle 'Shougo/neobundle-vim-scripts', '', 'default'

" ...

filetype plugin indent on " Required!



" Solarized
syntax enable
set background=dark
colorscheme solarized



" Powerline
" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
" set laststatus=2 " Always display the statusline in all windows
"set noshowmode " Hide the default mode text (e.g. --INSERT -- below the statusline)


" Syntastic
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_check_on_open=1



" SQLUtilities

let g:sqlutil_align_comma = 1
let g:sqlutil_keyword_case = '\U'





" Settings
let mapleader = ','
set number
set cursorline
set lines=40
set colorcolumn=80
set columns=120
set incsearch " jumps to search word as you type
set spell

set linespace=0
set showmatch
set hlsearch
set ignorecase
set smartcase
set foldenable

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set autoindent
set virtualedit=onemore

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set guifont=Inconsolata\ Medium\ 10
set backspace=indent,eol,start  " Backspace for dummies

set tags=tags,./tags

" Ease split window movement
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

 " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

 " Adjust viewports to the same size
    map <Leader>= <C-w>=





    if has('cmdline_info')
        set ruler " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd " Show partial commands in status line and
" Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

" Broken down into easily includeable segments
        set statusline=%<%f\ " Filename
        set statusline+=%w%h%m%r " Options
        set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y] " Filetype
        set statusline+=\ [%{getcwd()}] " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
    endif


 " Toggle search highlighting
    nmap <silent> <leader>/ :set invhlsearch<CR>



noremap <F11> :set list!<CR>

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

" GUI Settings {

" GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set lines=40 " 40 lines of text instead of 24
        if has("gui_gtk2")
            set guifont=Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
        elseif has("gui_mac")
            set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
        elseif has("gui_win32")
            set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
        endif
        if has('gui_macvim')
            set transparency=5 " Make the window slightly transparent
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
"set term=builtin_ansi " Make arrow and other keys work
    endif

" }
