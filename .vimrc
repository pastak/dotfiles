set modelines=0		" CVE-2007-2438
let lisp_rainbow = 1

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" 輝度を高くする

let g:solarized_visibility = "high"

" コントラストを高くする

let g:solarized_contrast = "high"
" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

"set clipboard=unnamed

set nobackup
set viminfo=!,'50,<1000,s100,\"50 "
set history=100
set ruler

set number
set scrolloff=5

"インデント幅
"set tabstop=4
"set shiftwidth=4

"for タブ幅の設定
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

"インデントの設定
set autoindent
"set smartindent
set cindent

" 補完時に無視されるファイル名のsuffix
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

"検索時に最後まで行ったら最初に戻る
set wrapscan

"検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

"入力中のコマンドをステータスに表示する
set showcmd

"括弧入力時の対応する括弧を表示
set showmatch

"検索結果文字列のハイライトを有効にする
set hlsearch

"ステータスラインを常に表示
set laststatus=2

augroup vimrc
		autocmd! FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
		autocmd! FileType php setlocal shiftwidth=2 tabstop=2 softtabstop=2
		autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
		autocmd! FileType css  setlocal shiftwidth=4 tabstop=2 softtabstop=2
		autocmd! FileType scheme  setlocal shiftwidth=2 tabstop=2 softtabstop=2
		autocmd! FileType go  setlocal shiftwidth=2 tabstop=2 softtabstop=2
		autocmd! FileType ace  setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

syntax on
autocmd BufNewFile *.user.js silent! 0r ~/.vim/templates/user.js.tpl
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl
au BufNewFile,BufRead *.pde setf arduino

"Bundle関係
set nocompatible
filetype off
"
if has('vim_starting')
	set runtimepath+=~/.vim/neobundle.vim.git
	call neobundle#rc(expand('~/.bundle'))
endif

"NeoBundle 'kana/vim-fakeclip'
NeoBundle 'naberon/vim-cakehtml'
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
NeoBundle 'rhysd/vim-operator-surround'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'fatih/vim-go'
NeoBundle 'yosssi/vim-ace'
" operator mappings
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)
" if you use vim-textobj-multiblock
nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)
NeoBundle 'moznion/hateblo.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'aharisu/vim_goshrepl'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'mac' : 'make -f make_mac.mak'
  \},
 \}
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'teramako/jscomplete-vim'
NeoBundle 'amdt/vim-niji'
"NeoBundle 'Markdown'
"NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
NeoBundle 'superbrothers/vim-quickrun-markdown-gfm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'git@github.com:kannokanno/previm.git'
"let g:previm_open_cmd = 'open -a Google\ Chrome'
autocmd BufRead,BufNewFile *.mkd  setfiletype markdown
autocmd BufRead,BufNewFile *.md  setfiletype markdown
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'
"NeoBundle 'moznion/jskotobuki-vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'kmnk/vim-unite-giti.git'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'itchyny/calendar.vim'
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'MyFugitive',
    \   'readonly': 'MyReadonly',
    \   'modified': 'MyModified',
    \   'filename': 'MyFilename'
    \ },
    \ 'separator': { 'left': '⮀', 'right': '⮂' },
    \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
    \ }

function! MyModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! MyReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "⭤"
    else
        return ""
    endif
endfunction

function! MyFugitive()
      return exists('*fugitive#head') && strlen(fugitive#head()) ? '⭠ '.fugitive#head() : ''
  endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

"end lightline.vim setting

filetype plugin on
filetype indent on

"let g:neobundle#types#git#default_protocol = 'https'


let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
    \     'type': 'markdown/gfm',
    \     'outputter': 'browser'
    \}
let g:quickrun_config['lisp/sbcl'] = {
\ 'command':'sbcl',
\ 'cmdopt':'--script'
\ }
let g:neocomplcache_enable_at_startup = 1
let g:jscomplete_use = ['dom', 'moz']
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict
"autocmd FileType php set makeprg=php\ -l\ %
"autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif
"au FileType javascript call JavaScriptFold()
let g:neocomplcache_source_rank = {
  \ 'jscomplete' : 500,
  \ }

"ここにneocomplcacheの設定
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
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
let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell': $HOME.'/.vimshell_hist',
	\ 'perl'    : $HOME.'/.vim/dict/perl.dict',
	\ 'php'		: $HOME.'/.vim/dict/php.dict'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" delimiterを指定する via  http://hakobe932.hatenablog.com/entry/2014/01/21/214100
if !exists('g:neocomplcache_delimiter_patterns')
        let g:neocomplcache_delimiter_patterns = {}
    endif
    let g:neocomplcache_delimiter_patterns['php'] = []

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
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
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

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

" ペーストするときにコメントになるのを防ぐ！
autocmd FileType * set formatoptions-=ro

" 文字コードの自動認識
" from ずんWiki http://www.kawaz.jp/pukiwiki/?vim#content_1_7
set encoding=utf-8
set fileencoding=utf-8
if &encoding !=# 'utf-8' " utf-8をデフォルトに
	set encoding=japan
	set fileencoding=japan
endif
if has('iconv')
	let s:enc_euc = 'euc-jp'
	let s:enc_jis = 'iso-2022-jp'
	" iconvがeucJP-msに対応しているかをチェック
	if iconv("¥x87¥x64¥x87¥x6a", 'cp932', 'eucjp-ms') ==# "¥xad¥xc5¥xad¥xcb"
		let s:enc_euc = 'eucjp-ms'
		let s:enc_jis = 'iso-2022-jp-3'
		" iconvがJISX0213に対応しているかをチェック
	elseif iconv("¥x87¥x64¥x87¥x6a", 'cp932', 'euc-jisx0213') ==# "¥xad¥xc5¥xad¥xcb"
		let s:enc_euc = 'euc-jisx0213'
		let s:enc_jis = 'iso-2022-jp-3'
	endif
	" fileencodingsを構築
	if &encoding ==# 'utf-8'
		let s:fileencodings_default = &fileencodings
		let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
		let &fileencodings = &fileencodings .','. s:fileencodings_default
		unlet s:fileencodings_default
	else
		let &fileencodings = &fileencodings .','. s:enc_jis
		set fileencodings+=utf-8,ucs-2le,ucs-2
		if &encoding =~# '^¥(euc-jp¥|euc-jisx0213¥|eucjp-ms¥)$'
			set fileencodings+=cp932
			set fileencodings-=euc-jp
			set fileencodings-=euc-jisx0213
			set fileencodings-=eucjp-ms
			let &encoding = s:enc_euc
			let &fileencoding = s:enc_euc
		else
			let &fileencodings = &fileencodings .','. s:enc_euc
		endif
	endif
	let &fileencodings = 'utf-8' . ',' . &fileencodings " XXX: adhocな対応
	" 定数を処分
	unlet s:enc_euc
	unlet s:enc_jis
endif

" 日本語を含まない場合は
" fileencoding
" に
" encoding
" を使うようにする
if has('autocmd')
	function! AU_ReCheck_FENC()
		if &fileencoding =~# 'iso-2022-jp' && search("[^¥x01-¥x7e]", 'n') == 0
			let &fileencoding=&encoding
		endif
	endfunction
	autocmd BufReadPost * call AU_ReCheck_FENC()
endif

" 改行コードの自動認識
set fileformats=unix,dos,mac

" 補完候補の色づけ
hi Pmenu ctermfg=Black
hi Pmenu ctermbg=Gray
hi PmenuSel ctermfg=Black
hi PmenuSel ctermbg=Cyan
hi PmenuSbar ctermfg=White
hi PmenuSbar ctermbg=DarkGray

set background=dark
colorscheme solarized
hi Comment ctermfg=182

let javascript_enable_domhtmlcss=1
"set regexpengine
syntax enable

let tex_flavor = 'latex'
set grepprg=grep\ -nH\ $*
set shellslash
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_ViewRule_pdf = '/usr/bin/open -a Preview.app'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"警告エラー無視
let g:Tex_IgnoredWarnings =
    \'Underfull'."\n".
    \'Overfull'."\n".
    \'specifier changed to'."\n".
    \'You have requested'."\n".
    \'Missing number, treated as zero.'."\n".
    \'There were undefined references'."\n".
    \'Citation %.%# undefined'."\n".
    \"Font shape \`JT1/gt/m/it\' undefined"."\n".
    \"Font shape \`JY1/gt/m/it\' undefined"."\n".
    \"Font shape \`JT1/mc/m/it\' undefined"."\n".
    \"Font shape \`JY1/mc/m/it\' undefined"."\n".
    \'LaTeX Font Warning: Some font shapes were not available, defaults substituted.'
let g:Tex_IgnoreLevel = 12

let g:neocomplcache_keyword_patterns['gosh-repl'] = "[[:alpha:]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*"
vmap <CR> <Plug>(gosh_repl_send_block)
let g:gosh_buffer_direction = "v"
