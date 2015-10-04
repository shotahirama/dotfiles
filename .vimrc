" vim settings

set tabstop=2
set expandtab
set autoindent
set smartindent
set backspace=start,eol,indent
set cindent
set shiftwidth=2
set number
set whichwrap=b,s,[,],<,>,~
set incsearch
set wildmenu wildmode=list:full

syntax on
set cursorline

set laststatus=2
set statusline=%F%r%h%=
highlight Normal ctermbg=none ctermfg=white
highlight StatusLine term=none cterm=none ctermfg=Cyan ctermbg=black

set backup
set backupdir=~/backvim

set incsearch
set clipboard=unnamed

inoremap {<Enter> {}<Left><CR><ESC><S-o>

""""""""""""""""""
"puraguinn setup
""""""""""""""""""

" NeoBundle starting
"
if has('vim_starting')
  set nocompatible

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'hachibeeDI/python_hl_lvar.vim'
NeoBundleLazy 'vim-jp/cpp-vim',{
      \ 'autoload' : {'filetypes' : 'cpp'}
      \ }
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'ompugao/ros.vim'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'osyo-manga/vim-reunions'
NeoBundle 'osyo-manga/vim-marching', {
            \ 'depends' : ['Shougo/vimproc.vim', 'osyo-manga/vim-reunions'],
            \ 'autoload' : {'filetypes' : ['c', 'cpp']}
            \ }
NeoBundle 'Rip-Rip/clang_complete'

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
:NeoBundleCheck
""""""""""""""""""""""""""""""""""""""""""""""""

call neobundle#end()

" Required:
filetype plugin indent on

if has('lua')

	" neocomplete settings

	let g:acp_enableAtStartup = 0
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#skip_auto_completion_time = ""
	let g:neocomplete#enable_smart_case = 1
	let g:neocomplete#sources#syntax#min_keyword_length = 3
	let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
	" Define dictionary.
	let g:neocomplete#sources#dictionary#dictionaries = {
	    \ 'default' : '',
	    \ 'vimshell' : $HOME.'/.vimshell_hist',
	    \ 'scheme' : $HOME.'/.gosh_completions'
		\ }
	" Define keyword.
	if !exists('g:neocomplete#keyword_patterns')
	    let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default'] = '\h\w*'
	" Plugin key-mappings.
	inoremap <expr><C-g>     neocomplete#undo_completion()
	inoremap <expr><C-l>     neocomplete#complete_common_string()
	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
	  return neocomplete#close_popup() . "\<CR>"
	  " For no inserting <CR> key.
	  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplete#close_popup()
	inoremap <expr><C-e>  neocomplete#cancel_popup()
	" Close popup by <Space>.
	"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
	" For cursor moving in insert mode(Not recommended)
	"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
	"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
	"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
	"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
	" Or set this.
	"let g:neocomplete#enable_cursor_hold_i = 1
	" AutoComplPop like behavior.
	"let g:neocomplete#enable_auto_select = 1
	" Shell like behavior(not recommended).
	"set completeopt+=longest
	"let g:neocomplete#enable_auto_select = 1
	"let g:neocomplete#disable_auto_complete = 1
	"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
	" Enable heavy omni completion.
	if !exists('g:neocomplete#sources#omni#input_patterns')
	  let g:neocomplete#sources#omni#input_patterns = {}
	endif
	"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
	"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
	" For perlomni.vim setting.
	" https://github.com/c9s/perlomni.vim
	let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
	let g:marching_enable_neocomplete = 1


else

	" Disable AutoComplPop.
	let g:acp_enableAtStartup = 0
	" " Use neocomplcache.
	let g:neocomplcache_enable_at_startup = 1
	" " Use smartcase.
	let g:neocomplcache_enable_smart_case = 1
	" " Set minimum syntax keyword length.
	let g:neocomplcache_min_syntax_length = 3
	let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
	"
	" " Define dictionary.
	let g:neocomplcache_dictionary_filetype_lists = {
	     \ 'default' : ''
	     \ }
	"
	"         " Plugin key-mappings.
	inoremap <expr><C-g>     neocomplcache#undo_completion()
	inoremap <expr><C-l>     neocomplcache#complete_common_string()
	"
	"         " Recommended key-mappings.
	"         " <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
	  return neocomplcache#smart_close_popup() . "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	"           " <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplcache#close_popup()
	inoremap <expr><C-e>  neocomplcache#cancel_popup() "
endif

autocmd FileType python setlocal completeopt-=preview
set path+=/usr/local/include
set path+=/usr/include/c++/4.8
set path+=/usr/include/c++/4.8.4
set path+=/opt/ros/indigo/include

" augroup cpp-path
"   autocmd!
"   autocmd FileType cpp setlocal path+=.,/usr/include,/usr/local/include,/usr/lib/c++/v1,/opt/ros/indigo/include,/usr/include/c++/4.8
" augroup END

" ------------------- clang_complete -------------
"
" neocomplcacheとの競合を避けるため、自動呼び出しはOff
let g:neocomplcache_force_overwrite_completefunc=1
let g:clang_complete_auto=0
let g:clang_auto_select=0
"libclangを使う
let g:clang_use_library=1
let g:clang_debug=1
let g:clang_user_options = '-std=c++11'
let g:clang_use_library_path='/usr/lib'

if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_force_omni_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.objc =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.objcpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"let g:clang_use_library = 1
"
"--------------------------------------------
" jedi-vim Setting
"
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
" これがないとQuickRunのショートカットが使えない
let g:jedi#rename_command = '<Leader>R'


"------------------------------------------------------------
" vim-indent-guides
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=darkgray
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""

"<Ctrl+Space> ：手動補完候補表示
"inoremap <expr><nul> pumvisible() ? "\<down>" : neocomplete#start_manual_complete()
inoremap <expr><nul> pumvisible() ? "\<C-n>" : "\<nul>"

" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

let g:quickrun_config={'_': {'split': 'vertical'}}
set splitright
let g:quickrun_config._ = {
  \ 'runner': 'vimproc',
  \ 'outputter/buffer/into': 1,
  \ }

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets behavior.
imap <expr><nul> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\  : "\<down>"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><nul> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\  : "\<down>"
"\: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
