source ~/.vimrc
if has("gui_running")
   hi LineNr guifg=#3D3D3D guibg=#002b36 gui=NONE ctermfg=darkgray ctermbg=NONE cterm=NONE
  set cursorline
  set transparency=0
   " Command-Shift-F for Ack
  map <D-F> :Ack<space>
  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>
  set showbreak=\ \ \ ↳
  set go-=T
  " remove toolbar
  set guioptions-=T
  " remove menu bar
  set guioptions-=m
  " Don't show right scrollbar
  set guioptions-=r
  set guifont=Source\ Code\ Pro\ for\ Powerline:h15
  set noballooneval
endif
