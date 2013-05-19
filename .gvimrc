source ~/.vimrc
if has("gui_macvim")
  hi LineNr guifg=#646464 guibg=#002b36 gui=NONE ctermfg=darkgray ctermbg=NONE cterm=NONE
  set cursorline
  set transparency=0
  " Apple-R for buffer tag list
  macmenu File.Print key=<nop>
  map <D-r> :CtrlPBufTag<CR>
  " Apple-P for Fuzzy File
  map <D-p> :FufCoverageFile<CR>
  " Command-Shift-F for Ack
  map <D-F> :Ack<space>
  " Command K+B to hide NERDTree
  map <D-k> :NERDTreeToggle<cr>
  " Command shift p for NERDTreeFromBookmark
  map <D-P> :NERDTreeFromBookmark<space>
  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>
  set showbreak=\ \ \ ↳
  set go-=T
  " remove toolbar
  set guioptions-=,
  " remove menu bar
  set guioptions-=m
  " Don't show right or left scrollbar
  set guioptions-=r
  set guioptions-=L
  set guifont=Source\ Code\ Pro\ for\ Powerline:h15
  set noballooneval
   " Command-][ to increase/decrease indentation
  vmap <D-]> >gv
  vmap <D-[> <gv
  " Don't beep
  set visualbell
endif
