map <D-M-Left> :bp<CR>
map <D-M-Right> :bn<CR>

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  macmenu &Edit.Find.Find\.\.\. key=<nop>
  map <D-t> :CommandT<CR>
  set go-=T

  map <D-M-Left> :bp<CR>
  map <D-M-Right> :bn<CR>
end