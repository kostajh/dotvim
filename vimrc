fun SetupVAM()
	" YES, you can customize this vam_install_path path and everything still works!
          let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
          exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

          " * unix based os users may want to use this code checking out VAM
          " * windows users want to use http://mawercer.de/~marc/vam/index.php
          "   to fetch VAM, VAM-known-repositories and the listed plugins
          "   without having to install curl, unzip, git tool chain first
          if !isdirectory(vam_install_path.'/vim-addon-manager') && 1 == confirm("git clone VAM into ".vam_install_path."?","&Y\n&N")
            " I'm sorry having to add this reminder. Eventually it'll pay off.
            call confirm("Remind yourself that most plugins ship with documentation (README*, doc/*.txt). Its your first source of knowledge. If you can't find the info you're looking for in reasonable time ask maintainers to improve documentation")
            exec '!p='.shellescape(vam_install_path).'; mkdir -p "$p" && cd "$p" && git clone --depth 1 git://github.com/MarcWeber/vim-addon-manager.git'
          endif
          call vam#ActivateAddons(['Sass', 'fugitive', 'syntastic', 'command-t', 'ack', 'delimitMate', 'snipmate', 'snipmate-snippets', 'supertab', 'surround', 'taglist-plus', 'The_NERD_commenter', 'tlib', 'vim-addon-mw-utils', 'vim-addon-manager'], {'auto_install' : 0})
          " sample: call vam#ActivateAddons(['pluginA','pluginB', ...], {'auto_install' : 0})
          " where pluginA could be github:YourName or snipmate-snippets see vam#install#RewriteName()
          " also see section "5. Installing plugins" in VAM's documentation
          " which will tell you how to find the plugin names of a plugin
        endf
        call SetupVAM()
        " experimental: run after gui has been started (gvim) [3]
        " option1:  au VimEnter * call SetupVAM()
        " option2:  au GUIEnter * call SetupVAM()
        " See BUGS sections below [*]

set nocompatible
filetype off
autocmd!
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

