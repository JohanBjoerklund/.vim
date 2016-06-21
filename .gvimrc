"When the GUI starts, t_vb is reset to its default value.
"Reassert that no flash or beep is wanted.
set visualbell t_vb=
set guioptions-=M
set guioptions-=T   "turn off needless toolbar on gvim/mvim
set guioptions-=L   "turn off left toolbar
set guioptions-=r   "turn off right toolbar
set guioptions-=b   "turn off bottom toolbar
set guioptions-=m   "remove toolbar"

if has('win32')
  au GUIEnter * simalt ~x
endif
