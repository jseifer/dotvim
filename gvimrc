map <D-M-Left> :bp<CR>
map <D-M-Right> :bn<CR>

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  macmenu &Edit.Find.Find\.\.\. key=<nop>
  macmenu &Tools.Make key=<nop>

  map <D-t> :CommandT<CR>
  map <D-b> :CommandTBuffer<CR>
  map <F5> :CommandTFlush<CR>
  " map <D-f> :maca toggleFileBrowser:<CR>
  " let g:ctrlp_map = "<D-t>"
  " map <D-t> :CtrlP<CR>
  " let g:ctrlp_working_path_mode = 0
  " let g:ctrlp_persistent_input = 0
  " let g:ctrlp_open_new_file = 0
  set go-=T

  map <D-M-Left> :bp<CR>
  map <D-M-Right> :bn<CR>
end
