set nocompatible               " be iMproved

call pathogen#infect()
syntax on
filetype plugin indent on
let mapleader=","
syntax enable
au BufNewFile,BufRead *.{module,install} set filetype=php.drupal
colorscheme railscasts2
filetype plugin on
source ~/Documents/Source/drupal/vimrc/.vimrc
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
source ~/.vim/gvimrc
