set nocompatible

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle'))

" Let neobundle manage neobundle
NeoBundleFetch 'Shougo/neobundle.vim'


" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Lokaltog/powerline'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'git@github.com:jphustman/cf-utils.vim.git'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/nerdcommenter'

NeoBundle 'JLimperg/Align'
NeoBundle 'git@github.com:jphustman/SQLUtilities.git'

NeoBundle 'Shougo/neocomplcache', '', 'default'
call neobundle#config('neocomplcache', {
			\ 'lazy' : 1,
			\ 'autoload' : {
			\ 'insert' : 1,
			\ }})

NeoBundle 'Shougo/neocomplcache-rsense', '', 'default'
call neobundle#config('neocomplcache-rsense', {
			\ 'lazy' : 1,
			\ 'depends' : 'Shougo/neocomplcache',
			\ 'autoload' : { 'filetypes' : 'ruby' }
			\ })

NeoBundle 'Shougo/neosnippet', '', 'default'
call neobundle#config('neosnippet', {
			\ 'lazy' : 1,
			\ 'autoload' : {
			\ 'insert' : 1,
			\ 'filetypes' : 'snippet',
			\ 'unite_sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
			\ }})
" NeoBundle 'git@github.com:Shougo/neocomplcache-snippets-complete.git'

NeoBundle 'Shougo/neobundle-vim-scripts', '', 'default'

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


" TagBar {
nnoremap <silent> <F9> :TagbarToggle<CR>

"}


" Settings
let mapleader = ','
set number
set cursorline
set lines=40
set colorcolumn=80
set columns=84
set incsearch " jumps to search word as you type

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

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set guifont=Inconsolata\ Medium\ 10

set tags=tags,./tags

" Ease split window movement
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_




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















" neocomplcache.vim"{{{
" Use neocomplcache.
"Note: This option must set it in .vimrc(_vimrc). NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplcache#smart_close_popup() . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left> neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up> neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down> neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"}}}










if !has('vim_starting')
	" Call on_source hook when reloading .vimrc.
	call neobundle#call_hook('on_source')
endif
