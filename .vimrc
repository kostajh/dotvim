filetype plugin on
let mapleader=","
syntax enable
au BufNewFile,BufRead *.{module,install} set filetype=php.drupal
colorscheme railscasts2
filetype plugin on
call pathogen#runtime_append_all_bundles()
source ~/.vim/drupalrc/vimrc
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
