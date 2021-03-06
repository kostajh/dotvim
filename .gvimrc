source ~/.vimrc
set visualbell

if has("gui_running")
  hi LineNr guifg=#646464 guibg=#002b36 gui=NONE ctermfg=darkgray ctermbg=black cterm=NONE
  set lines=999 columns=999
  map <D-r> :CtrlPBufTag<CR>
endif

if has("gui_macvim")
  set cursorline
  set transparency=0
  " Buffer nav
  " Vertical Split
  map <D-V> <C-w>v<C-w>l
  " Horizontal Split
  map <D-H> <C-w>s<C-w>l
  " Apple-R for buffer tag list
  macmenu File.Print key=<nop>
  " Apple-P for Command-T
  map <D-p> :CommandT<CR>
  " Command-Shift-F for Ack
  map <D-F> :Ag<space>
  " Command K to hide NERDTree
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
  set guifont=Source\ Code\ Pro\ for\ Powerline:h14
  set noballooneval
   " Command-][ to increase/decrease indentation
  vmap <D-]> >gv
  vmap <D-[> <gv
  " Don't beep
  set visualbell
endif
