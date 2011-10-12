set nocompatible               " be iMproved
filetype on " See https://github.com/gmarik/vundle/wiki for explanation
source ~/Documents/Source/drupal/vimrc/.vimrc
filetype off                   " required!
set eol
" Kosta's config
let mapleader=","
syntax enable
au BufNewFile,BufRead *.{module,install} set filetype=php.drupal
syntax enable
let g:solarized_termcolors=256
colorscheme Solarized
set background=dark

filetype plugin on
" Format comment length
set textwidth=80
set formatoptions=croql
set comments=sr:/**,m:*\ ,ex:*/,://
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
if has("gui_macvim")
  let macvim_hig_shift_movement = 1
endif
nnoremap <Leader>l :execute "!php -l %"<CR>
nnoremap <Leader>f :execute "!php -f %"<CR>

" Taglist
let Tlist_Ctags_Cmd="/usr/local/Cellar/ctags/5.8/bin/ctags"

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Status bar
set laststatus=2

" Command-T configuration
let g:CommandTMaxHeight=20

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Show (partial) command in the status line
set showcmd

" Vundle settings

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'ervandew/supertab'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'tpope/vim-fugitive'
Bundle 'theunraveler/Drupal-Snippets-for-Vim'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'grndlvl/drupal-snippets'
Bundle 'trailing-whitespace'
Bundle 'The_NERD_tree'
Bundle 'Solarized'
Bundle 'tmallen/transmit-vim'
Bundle 'scss-syntax'
Bundle 'Sass'
Bundle 'delimitMate'
Bundle 'taglist-plus'
Bundle 'tlib'

filetype plugin on     " required!
let $GIT_SSL_NO_VERIFY = 'true'
