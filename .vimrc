" Following lines added by drush vimrc-install on Wed, 15 May 2013 01:01:05 +0000.
set nocompatible
call pathogen#infect('/Users/kosta/.drush/vimrc/bundle/{}')
call pathogen#infect('/Users/kosta/.vim/bundle/{}')
" End of vimrc-install additions.
execute pathogen#infect()
syntax on
filetype plugin indent on

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

" Always edit in utf-8:
set encoding=utf-8

" Enforce consistent line endings: if 'ff' is set to "unix" and there are any
" stray '\r' characters at ends of lines, then automatically remove them. See
" $VIMRUNTIME/indent/php.vim .
let PHP_removeCRwhenUnix = 1

" Shortcut syntax enable
map <leader>se :syntax enable<CR>

" CtrlP
nnoremap <leader>b :CtrlPBuffer<CR>

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
hi LineNr guifg=#3D3D3D guibg=black gui=NONE ctermfg=darkgray ctermbg=NONE cterm=NONE

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
nnoremap <tab> %
vnoremap <tab> %

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

" Ack
nnoremap <leader>a :Ack

" Reselect pasted text
nnoremap <leader>v V`]

" Automatically change window's cwd to file's dir
set autochdir

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

" Training wheels
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

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
