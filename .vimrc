set nocompatible               " be iMproved
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle Bundles
Bundle 'gmarik/vundle'
Bundle 'shawncplus/phpcomplete.vim' 
Bundle 'scratch.vim'
Bundle 'tpope/vim-dispatch'
Bundle 'joonty/vim-phpunitqf.git'
Bundle 'nelstrom/vim-markdown-folding'
Bundle 'stephpy/vim-phpdoc'
Bundle 'nginx.vim'
Bundle 'spf13/PIV'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'farseer90718/vim-taskwarrior'
Bundle 'jamessan/vim-gnupg'
Bundle 'suan/vim-instant-markdown'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-liquid'
Bundle 'SirVer/ultisnips'
Bundle 'xolox/vim-misc'
Bundle 'Raimondi/delimitMate'
Bundle 'StanAngeloff/php.vim'
Bundle 'othree/html5.vim'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'xolox/vim-easytags'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-sensible'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'honza/vim-snippets'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-surround'
Bundle 'rking/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'ervandew/supertab'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neosnippet'
Bundle 'tpope/vim-git'
Bundle 'sjl/gundo.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'vim-flake8'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'rstacruz/sparkup'
Bundle 'airblade/vim-gitgutter'
Bundle 'techlivezheng/vim-plugin-tagbar-phpctags'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'veloce/vim-behat'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'xolox/vim-notes'
Bundle 'mikewest/vimroom'
Bundle 'chrisbra/csv.vim'
Bundle 'sukima/xmledit'
Bundle 'scratch'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'git://drupalcode.org/project/vimrc.git', {'rtp': 'bundle/vim-plugin-for-drupal/'}
Bundle 'joonty/vdebug'

filetype plugin indent on
syntax on

" Eclim
nnoremap <silent> <buffer> <cr> :PhpSearchContext<cr>
let g:EclimCompletionMethod = 'omnifunc'

" Quick edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYGVIMRC<cr>

" Fullscreen mode
map <silent> <F11>
\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

" DelimitMate
let g:delimitMate_expand_cr = 1

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,vim,rubyythonerl6,scala,vb,elixir,go' : ['.'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

let g:ycm_filetype_whitelist = { '*': 1 }

" Autocompletion
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
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
  return neocomplete#smart_close_popup() . "\<CR>"
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

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd Filetype php setlocal omnifunc=phpcomplete#CompletePHP
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" Neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Vimroom
nnoremap <silent> <Leader>mz <Plug>VimroomToggle

" CSV
let g:csv_autocmd_arrange = 1
aug CSV_Editing
  au!
  au BufRead,BufWritePost *.csv :%ArrangeColumn
  au BufWritePre *.csv :%UnArrangeColumn
aug end

" Xdebug
let g:vdebug_features = { 'max_children': 128 }
let g:vdebug_options = { 'break_on_open': 0 }

" GitGutter
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

" No undo files
set noundofile

" XML formatting
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" RST
command! RstPreview :!rst2html.py % > /tmp/rstprev.html && open /tmp/rstprev.html
nnoremap <C-p><C-r> :RstPreview<CR>

" CtrlPBuffer
nnoremap <C-p><C-y> :CtrlPBufTag<CR>

" Always edit in utf-8:
set encoding=utf-8

" Enforce consistent line endings: if 'ff' is set to "unix" and there are any
" stray '\r' characters at ends of lines, then automatically remove them. See
" $VIMRUNTIME/indent/php.vim .
let PHP_removeCRwhenUnix = 1

" Shortcut syntax enable
map <leader>se :syntax enable<CR>

" Easytags
let g:easytags_python_enabled = 1

" BuffergatorToggle
nnoremap <leader>b :BuffergatorToggle<CR>

" No vim backups
set nobackup
set nowritebackup
set noswapfile

" Tagbar
let g:tagbar_phpctags_bin='/usr/local/bin/phpctags'
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=40
map <leader>y :TagbarToggle<CR>

" Set PHP executable
let s:php_executable='/usr/bin/php'

" Highlight editing line
hi LineNr guifg=#3D3D3D guibg=black gui=NONE ctermfg=darkgray ctermbg=black cterm=NONE

" PHP Settings
let g:phpqa_codesniffer_args = "--standard=Drupal --extensions=php,module,inc,install,test,profile,theme"
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codecoverage_autorun = 0

" Drupal hooks
iabbr Hook <C-R>=HookFunc()<CR>

" HookFunc(): Drupal helper function
function! HookFunc()
  let f = strpart(expand("%:t"), 0, stridx(expand("%:t"), '.', 0))

  " wtf?
  let a = input("")

  let h = input("Which hook? ")

  return "/**\<CR>Implements hook_" . h . "()\<CR>/\<CR>" . "function " . f . "_" . h . "() {\<CR>}\<ESC>k%i"
endfunction

" Behat
let feature_filetype='behat'

" Drupal plugin
let g:Drupal_dirs = {6: '~/.drush/drupal-versions/drupal-6.x-dev', 7: '~/.drush/drupal-versions/drupal-7.x-dev', 8: '~/src/drupal/drupal'}

" Standards
set number
set wildmode=longest,list
set fileformats=unix
set history=300
set ruler
set showmode
set showmatch
set nowrap
set hlsearch
set backspace=2
set linebreak
set formatoptions=1
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab

" Indents
set smartindent

" Save on lose focus
au FocusLost * :wa

" Gutters
set numberwidth=4

" Git gutter
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1

" Map leader to ","
let mapleader=","

" Theme. Enable Solarized.
syntax enable
" Whitespace intentional on this line!
set fillchars+=vert:\
let g:vimroom_guibackground = '#002b36'
let g:vimroom_ctermbackground = 8
set background=dark
set t_Co=256
let g:solarized_termcolors=16
colorscheme solarized
call togglebg#map("<F5>")

" Code folding
set foldmethod=indent
set foldlevel=99

" Search
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <leader>a :Ag

" Task list binding
map <leader>td <Plug>TaskList

" Gundo toggle
map <leader>g :GundoToggle<CR>

" NERD Tree customizations
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.pyc$', 'CVS', '\~$']
let NERDTreeHijackNetrw=1
let NERDTreeChDirMode=2
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>nb :NERDTreeFromBookmark
nnoremap <leader>nc :NERDTreeCWD<cr>

" Remember last location in file
if has("automcd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" PHPCS and Syntastic. Drupal checkers are added by the Drupal plugin.
let g:syntastic_php_phpcs_args="--report=csv --standard=PSR-2"
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
highlight SyntasticErrorSign guifg=white guibg=red
highlight SyntasticErrorLine guibg=#2f0000
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1
let g:syntastic_always_populate_loc_list=1

" Hide tildes
hi NonText guifg=bg

" Strip whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Reselect pasted text
nnoremap <leader>v V`]

" Automatically change window's cwd to file's dir
"set autochdir

" Window splits
nnoremap <leader>w <C-w>v<C-w>l

" Bind Ctrl+movement keys to navigate splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" SuperTab
let g:SuperTabDefaultCompletionType = "context"

" Highlight long lines
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=85

" Misc shortcuts
nnoremap ; :

" Python specific
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

" Powerline
" set rtp+=.vim/bundle/powerline/powerline/bindings/vim
" set laststatus=2
" set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" let g:Powerline_symbols = 'fancy'

" Vim notes
let g:notes_suffix = '.md'
let g:notes_directories = ['~/Dropbox/Notes']

" NERD Tree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Powerline - see https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
