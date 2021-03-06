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

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp

set laststatus=2
set statusline=%F%r%h%=
highlight Normal ctermbg=none ctermfg=white
highlight StatusLine term=none cterm=none ctermfg=Cyan ctermbg=black

set backup
set backupdir=~/.backvim

set incsearch
set clipboard=unnamed,autoselect

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
" 非同期処理プラグイン
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
NeoBundle 'andviro/flake8-vim'
NeoBundleLazy 'osyo-manga/vim-marching', {
            \ 'depends' : ['Shougo/vimproc.vim', 'osyo-manga/vim-reunions'],
            \ 'autoload' : {'filetypes' : ['c', 'cpp']}
            \ }
NeoBundle 'sudo.vim'

:NeoBundleCheck
""""""""""""""""""""""""""""""""""""""""""""""""

call neobundle#end()
" Required:
filetype plugin indent on

if neobundle#is_installed('neocomplete')
  if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.cpp =
          \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
  " Disable AutoComplPop
  let g:acp_enableAtStartup=0
  " 起動時に有効化
  let g:neocomplete#enable_at_startup=1
  " 大文字が入力されるまで大文字小文字の区別を無視する
  let g:neocomplete#enable_smart_case=1
  " アンダースコア区切りの補完を有効化
  let g:neocomplete#enable_underbar_completion=1
  let g:neocomplete#enable_camel_case_completion=1
  " ポップアップメニューで表示される候補の数
  let g:neocomplete#max_list=10
  " シンタックスをキャッシュするときの最小文字長
  let g:neocomplete#sources#syntax#min_keyward_length=3
  " 補完を表示する最小文字数
  let g:neocomplete#auto_completion_start_length=3
  " preview window を閉じる
  let g:neocomplete#enable_auto_close_preview=1

  let g:neocomplete#max_keyword_width=10000

  let g:neocomplete#data_directory=$HOME + '/.cache/neocomplete'

   
  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

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
  "<Ctrl+Space> ：手動補完候補表示
  inoremap <expr><nul> pumvisible() ? "\<down>" : neocomplete#start_manual_complete()
  inoremap <expr><nul> pumvisible() ? "\<C-n>" : "\<nul>"
endif

if neobundle#is_installed('vim-marching')
  let g:marching_enable_neocomplete=1
endif

if neobundle#tap('neosnippet')
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif

  " Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1
  " let g:neosnippet#snippets_directory='~/dotfiles/snippets'
endif

if neobundle#is_installed('jedi-vim')
  autocmd Filetype python setlocal omnifunc=jedi#completions
  autocmd Filetype python setlocal completeopt-=preview
  
  let g:jedi#completions_enabled = 1
  let g:jedi#auto_vim_configuration = 1
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  " これがないとQuickRunのショートカットが使えない
  let g:jedi#rename_command = '<Leader>R'

endif

if neobundle#is_installed('vim-indent-guides')
  let g:indent_guides_auto_colors=0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=black
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=darkgray
  let g:indent_guides_enable_on_vim_startup=1
  let g:indent_guides_guide_size=1
endif

if neobundle#is_installed('unite.vim')
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
endif

if neobundle#is_installed('vim-quickrun')
  " <C-c> で実行を強制終了させる
  " quickrun.vim が実行していない場合には <C-c> を呼び出す
  nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
  
  let g:quickrun_config={'_': {'split': 'vertical'}}
  set splitright
  let g:quickrun_config._ = {
  \ 'runner': 'vimproc',
  \ 'outputter/buffer/into': 1,
  \ }
endif

augroup cpp-clangformat
  autocmd!
  autocmd FileType c,cpp,objc noremap <C-K> :pyf /path/to/clang-format.py<CR>
augroup END

augroup cpp-path
  autocmd!
  autocmd FileType cpp setlocal path+=.,/usr/include,/usr/include/c++/4.8.4,/usr/local/include,/opt/ros/indigo/include
augroup END

augroup filetypedetect
  au! BufRead,BufNewFile *.launch       setfiletype xml
augroup END

augroup python_env
  autocmd!
  autocmd BufNewFile *.py :call append(0, "#!/usr/bin/env python")
  autocmd BufNewFile *.sh :call append(0, "#!/bin/sh")
augroup END
