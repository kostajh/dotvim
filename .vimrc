" Following lines added by drush vimrc-install on Wed, 15 May 2013 01:01:05 +0000.
set nocompatible
call pathogen#infect('/Users/kosta/.drush/vimrc/bundle/{}')
call pathogen#infect('/Users/kosta/.vim/bundle/{}')
" End of vimrc-install additions.
execute pathogen#infect()
syntax on
filetype plugin indent on

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

" Task list binding
map <leader>td <Plug>TaskList

" Gundo toggle
map <leader>gu :GundoToggle<CR>

" Bind Ctrl+movement keys to navigate splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" SuperTab
let g:SuperTabDefaultCompletionType = "context"

" Python specific
" pep8 binds to 8
let g:pep8_map='<leader>8'
au FileType python set omnifunc=pythoncomplete#Complete

" Rope
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

