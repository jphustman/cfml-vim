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

" progressively check higher values... falls out on first "true"
" (note addition of zero ... this guarantees return from function is numeric)
function SetTimeOfDayColors()
	let currentHour = strftime("%H")
	if currentHour < 6 + 0
		set background=dark
	elseif currentHour < 12 + 0
		set background=dark
	elseif currentHour < 18 + 0
		set background=light
	else
		set background=dark
	endif
endfunction

call SetTimeOfDayColors()

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


















" neocomplcache.vim"{{{
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

let bundle = neobundle#get('neocomplcache')
function! bundle.hooks.on_source(bundle)
" Use smartcase.
  let g:neocomplcache_enable_smart_case = 0
" Use camel case completion.
  let g:neocomplcache_enable_camel_case_completion = 0
" Use underbar completion.
  let g:neocomplcache_enable_underbar_completion = 0
" Use fuzzy completion.
  let g:neocomplcache_enable_fuzzy_completion = 1
" Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 3
" Set auto completion length.
  let g:neocomplcache_auto_completion_start_length = 2
" Set manual completion length.
  let g:neocomplcache_manual_completion_start_length = 0
" Set minimum keyword length.
  let g:neocomplcache_min_keyword_length = 3
" let g:neocomplcache_enable_cursor_hold_i = v:version > 703 ||
" \ v:version == 703 && has('patch289')
  let g:neocomplcache_enable_cursor_hold_i = 0
  let g:neocomplcache_cursor_hold_i_time = 300
  let g:neocomplcache_enable_insert_char_pre = 0
  let g:neocomplcache_enable_prefetch = 0
  let g:neocomplcache_skip_auto_completion_time = '0.6'

  if !exists('g:neocomplcache_wildcard_characters')
    let g:neocomplcache_wildcard_characters = {}
  endif
  let g:neocomplcache_wildcard_characters._ = '-'

" For auto select.
  let g:neocomplcache_enable_auto_select = 1

  let g:neocomplcache_enable_auto_delimiter = 1
"let g:neocomplcache_disable_caching_buffer_name_pattern = '[\[*]\%(unite\)[\]*]'
  let g:neocomplcache_disable_auto_select_buffer_name_pattern = '\[Command Line\]'
" let g:neocomplcache_lock_buffer_name_pattern = '\.txt'
"let g:neocomplcache_disable_auto_complete = 0
  let g:neocomplcache_max_list = 100
  let g:neocomplcache_force_overwrite_completefunc = 1
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
  endif
  let g:neocomplcache_enable_auto_close_preview = 1

" For clang_complete.
  let g:neocomplcache_force_overwrite_completefunc = 1
  let g:neocomplcache_force_omni_patterns.c =
        \ '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplcache_force_omni_patterns.cpp =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
  let g:clang_complete_auto = 0
  let g:clang_auto_select = 0
  let g:clang_use_library = 1

" For jedi-vim.
" let g:jedi#auto_initialization = 1
" let g:jedi#popup_on_dot = 0
" let g:jedi#rename_command = '<leader>R'
" let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'

" Define dictionary.
  let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'scheme' : expand('~/.gosh_completions'),
        \ 'scala' : expand('$DOTVIM/dict/scala.dict'),
        \ 'ruby' : expand('$DOTVIM/dict/ruby.dict'),
        \ 'int-termtter' : expand('~/.vimshell/int-history/int-termtter'),
        \ }

  let g:neocomplcache_omni_functions = {
        \ 'ruby' : 'rubycomplete#Complete',
        \ }

" Define keyword pattern.
  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
  endif
" let g:neocomplcache_keyword_patterns.default = '\h\w*'
  let g:neocomplcache_keyword_patterns['default'] = '[0-9a-zA-Z:#_]\+'
  let g:neocomplcache_keyword_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" let g:neocomplcache_force_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
  let g:neocomplcache_omni_patterns.php = '[^. *\t]\.\w*\|\h\w*::'
  let g:neocomplcache_omni_patterns.mail = '^\s*\w\+'
  let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplcache_caching_limit_file_size = 500000

  if !exists('g:neocomplcache_same_filetype_lists')
    let g:neocomplcache_same_filetype_lists = {}
  endif
"let g:neocomplcache_same_filetype_lists.perl = 'ref'

" let g:neocomplcache_source_look_dictionary_path = $HOME . '/words'
  let g:neocomplcache_source_look_dictionary_path = ''

" Set $RSENSE_HOME path.
  let g:neocomplcache#sources#rsense#home_directory = '/opt/rsense'

  let g:neocomplcache_vim_completefuncs = {
        \ 'Ref' : 'ref#complete',
        \ 'Unite' : 'unite#complete_source',
        \ 'VimShellExecute' :
        \ 'vimshell#vimshell_execute_complete',
        \ 'VimShellInteractive' :
        \ 'vimshell#vimshell_execute_complete',
        \ 'VimShellTerminal' :
        \ 'vimshell#vimshell_execute_complete',
        \ 'VimShell' : 'vimshell#complete',
        \ 'VimFiler' : 'vimfiler#complete',
        \ 'Vinarise' : 'vinarise#complete',
        \}
  if !exists('g:neocomplcache_source_completion_length')
    let g:neocomplcache_source_completion_length = {
          \ 'look' : 4,
          \ }
  endif

" Test."{{{
"let g:neocomplcache_auto_completion_start_length = 1
"let g:neocomplcache_plugin_completion_length = {
"\ 'snippets_complete' : 1,
"\ 'buffer_complete' : 2,
"\ 'syntax_complete' : 2,
"\ 'tags_complete' : 3,
"\ 'vim_complete' : 4,
"\ }
  let g:neocomplcache_source_disable = {
        \ 'tags_complete' : 1,
        \}
"}}}

" mappings."{{{
" <C-f>, <C-b>: page move.
  inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
  inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"
" <C-y>: paste.
  inoremap <expr><C-y> pumvisible() ? neocomplcache#close_popup() : "\<C-r>\""
" <C-e>: close popup.
  inoremap <expr><C-e> pumvisible() ? neocomplcache#cancel_popup() : "\<End>"
" <C-k>: unite completion.
  imap <C-k> <Plug>(neocomplcache_start_unite_complete)
" - unite quick match.
" imap <expr> - pumvisible() ?
" \ "\<Plug>(neocomplcache_start_unite_quick_match)" : '-'
  inoremap <expr> O &filetype == 'vim' ? "\<C-x>\<C-v>" : "\<C-x>\<C-o>"
" <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" <C-n>: neocomplcache.
  inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>\<Down>"
" <C-p>: keyword completion.
  inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
  inoremap <expr>' pumvisible() ? neocomplcache#close_popup() : "'"

  inoremap <expr><C-x><C-f> neocomplcache#manual_filename_complete()

  imap <C-s> <Plug>(neocomplcache_start_unite_snippet)

" <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
  endfunction

" <TAB>: completion.
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ neocomplcache#start_manual_complete()
  function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
  endfunction"}}}
" <S-TAB>: completion back.
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" For cursor moving in insert mode(Not recommended)
  inoremap <expr><Left> neocomplcache#close_popup() . "\<Left>"
  inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
  inoremap <expr><Up> neocomplcache#close_popup() . "\<Up>"
  inoremap <expr><Down> neocomplcache#close_popup() . "\<Down>"
"}}}
endfunction

function! CompleteFiles(findstart, base)
  if a:findstart
" Get cursor word.
    let cur_text = strpart(getline('.'), 0, col('.') - 1)

    return match(cur_text, '\f*$')
  endif

  let words = split(expand(a:base . '*'), '\n')
  let list = []
  let cnt = 0
  for word in words
    call add(list, {
          \ 'word' : word,
          \ 'abbr' : printf('%3d: %s', cnt, word),
          \ 'menu' : 'file_complete'
          \ })
    let cnt += 1
  endfor

  return { 'words' : list, 'refresh' : 'always' }
endfunction

unlet bundle
"}}}










if !has('vim_starting')
	" Call on_source hook when reloading .vimrc.
	call neobundle#call_hook('on_source')
endif
