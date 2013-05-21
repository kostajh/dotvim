set nocompatible               " be iMproved
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle Bundles
Bundle 'gmarik/vundle'
Bundle 'skammer/vim-css-color'
Bundle 'davidhalter/jedi-vim'
Bundle 'tpope/vim-liquid'
Bundle 'Raimondi/delimitMate'
Bundle 'StanAngeloff/php.vim'
Bundle 'othree/html5.vim'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'xolox/vim-easytags'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-sensible'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'garbas/vim-snipmate'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'honza/vim-snippets'
Bundle 'tomtom/tlib_vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-surround'
Bundle 'rking/ag.vim'
Bundle 'kien/ctrlp'
Bundle 'pangloss/vim-javascript'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'ervandew/supertab'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-git'
Bundle 'sjl/gundo.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'vim-scripts/pep8'
Bundle 'alfredodeza/pytest.vim'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'Lokaltog/powerline'
Bundle 'rstacruz/sparkup'
Bundle 'airblade/vim-gitgutter'
Bundle 'techlivezheng/vim-plugin-tagbar-phpctags'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'veloce/vim-behat'
Bundle 'xolox/vim-notes'
Bundle 'mattn/webapi-vim'
Bundle 'mikewest/vimroom'
Bundle 'chrisbra/csv.vim'
Bundle 'sukima/xmledit'
Bundle 'wincent/Command-T'
Bundle 'scratch'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'git://drupalcode.org/project/vimrc.git', {'rtp': 'bundle/vim-plugin-for-drupal/'}

filetype plugin indent on
syntax on

" Quick edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYGVIMRC<cr>

" DelimitMate
let g:delimitMate_expand_cr = 1

" Vimroom
nnoremap <silent> <Leader>mz <Plug>VimroomToggle

" CSV
let g:csv_autocmd_arrange = 1
aug CSV_Editing
  au!
  au BufRead,BufWritePost *.csv :%ArrangeColumn
  au BufWritePre *.csv :%UnArrangeColumn
aug end

" XML formatting
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" RST
command! RstPreview :!rst2html.py % > /tmp/rstprev.html && open /tmp/rstprev.html
nnoremap <C-p><C-r> :RstPreview<CR>

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

" CtrlP
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>. :CtrlPTag<cr>

" No vim backups
set nobackup
set nowritebackup
set noswapfile

" Tagbar
let g:tagbar_phpctags_bin='/usr/local/bin/phpctags'
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
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

"" DrupalCS support
noremap <silent> <Leader>dcs :!phpcs --standard=Drupal --extensions=php,module,inc,install,test,profile,theme %

" Behat
let feature_filetype='behat'

" Drupal plugin
let g:Drupal_dirs = {6: '~/Sites/drupal6', 7: '~/Sites/drupal7', 8: '~/src/drupal/drupal8'}

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

" Gutters
set numberwidth=3

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

" Task list binding
map <leader>td <Plug>TaskList

" Gundo toggle
map <leader>gu :GundoToggle<CR>

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

" PHPCS and Syntastic
let g:syntastic_php_phpcs_args="--report=csv --standard=Drupal --extensions=php,module,inc,install,test,profile,theme"
let g:syntastic_php_phpcs_disable=0
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_php_drupal_checkers=['phpcs']
highlight SyntasticErrorSign guifg=white guibg=red
highlight SyntasticErrorLine guibg=#2f0000

" Marked
nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

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
" pep8 binds to 8
let g:pep8_map='<leader>8'
au FileType python set omnifunc=pythoncomplete#Complete

" Powerline
set rtp+=.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
let g:Powerline_symbols = 'fancy'

" Vim notes
let g:notes_suffix = '.md'
let g:notes_directories = ['~/Dropbox/Notes']

" Powerline - see https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
