source ~/.vimrc
if has("gui_running")
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
