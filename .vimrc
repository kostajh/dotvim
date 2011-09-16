set nocompatible               " be iMproved
filetype on " See https://github.com/gmarik/vundle/wiki for explanation
source ~/Documents/Source/drupal/vimrc/.vimrc
filetype off                   " required!
set eol
" Kosta's config
let mapleader=","
syntax enable
au BufNewFile,BufRead *.{module,install} set filetype=php.drupal
colorscheme railscasts2
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
Bundle 'vim-scripts/taglist.vim'
Bundle 'grndlvl/drupal-snippets'

filetype plugin on     " required!
let $GIT_SSL_NO_VERIFY = 'true'
