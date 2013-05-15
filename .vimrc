" Following lines added by drush vimrc-install on Wed, 15 May 2013 01:01:05 +0000.
set nocompatible
call pathogen#infect('/Users/kosta/.drush/vimrc/bundle/{}')
call pathogen#infect('/Users/kosta/.vim/bundle/{}')
" End of vimrc-install additions.
execute pathogen#infect()
syntax on
filetype plugin indent on

" No vim backups
set nobackup
set nowritebackup

" Tagbar
let g:tagbar_phpctags_bin='/usr/local/bin/phpctags'
map <leader>y :TagbarToggle<CR>

" PHP Settings
let g:phpqa_messdetector_ruleset = "/path/to/phpmd.xml"

" Behat
let feature_filetype='behat'

" Drupal plugin
let g:Drupal_dirs = {6: '~/Sites/drupal6', 7: '~/Sites/drupal7', 8: '~/src/drupal/drupal8'}

" Standards
set number
set ruler
set showmatch
set nowrap
set hlsearch
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab

" Gutters
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set numberwidth=3
"highlight clear SignColumn

" Map leader to ","
let mapleader=","

" Theme. Enable Solarized.
syntax enable
set background=dark
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
nnoremap <leader>d :NERDTreeToggle<cr>

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

" Buffer explorer
let g:miniBufExplForceSyntaxEnable = 0
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

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

" Rope
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" Powerline
set rtp+=.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2
let g:Powerline_symbols = 'fancy'
