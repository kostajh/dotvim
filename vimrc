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

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

if has("gui_macvim")
	  let macvim_hig_shift_movement = 1
endif

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

source ~/.vim/gvimrc
