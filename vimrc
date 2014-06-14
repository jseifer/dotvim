" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'vim-scripts/supertab'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/zoomwin'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'tsaleh/vim-align'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kien/ctrlp.vim'
Plugin 'troydm/easybuffer.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/syntastic'
Plugin 'chase/vim-ansible-yaml'
Plugin 'tomasr/molokai'

call vundle#end()

 let mapleader=";"

 set nocompatible

 set number
 set ruler
 syntax on

 " Set encoding
 set encoding=utf-8

 " Whitespace stuff
 set nowrap
 set tabstop=2
 set shiftwidth=2
 set softtabstop=2
 set expandtab
 set list listchars=tab:\ \ ,trail:·

 " Searching
 set hlsearch
 set incsearch
 set ignorecase
 set smartcase

 " Turn off highlight after search
map <Leader>nh :silent noh<CR>
"
" " Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc
"
"
" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" EasyBuffer
map <Leader>b :EasyBuffer<CR>

 " Remember last location in file
 if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
     \| exe "normal g'\"" | endif
 endif

 function s:setupWrapping()
   set wrap
   set wm=2
   set textwidth=72
 endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

 " make uses real tabs
 au FileType make                                     set noexpandtab

 " Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
 au BufRead,BufNewFile {Guardfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

 " md, markdown, and mk are markdown and define buffer-local preview
 au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

 au BufRead,BufNewFile *.txt call s:setupWrapping()

 " make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
 au FileType python  set tabstop=4 textwidth=79

 " allow backspacing over everything in insert mode
 set backspace=indent,eol,start

 " load the plugin and indent settings for the detected filetype
 filetype plugin indent on

 " No highlight after search
 map <Leader>nh :nohlsearch<CR>

 " Opens an edit command with the path of the currently edited file filled in
 " Normal mode: <Leader>e
" map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

 " Opens a tab edit command with the path of the currently edited file filled in
 " Normal mode: <Leader>t
" map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

 " Inserts the path of the currently edited file into a command
 " Command mode: Ctrl+P
" cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

 map <Leader>v :YRShow<CR>

" Unimpaired configuration
" Bubble single lines
" nmap <C-Up> [e
" nmap <C-Down> ]e
" " Bubble multiple lines
" vmap <C-Up> [egv
" vmap <C-Down> ]egv

" Enable syntastic syntax checking
 let g:syntastic_enable_signs=1
 let g:syntastic_quiet_messages = {'level': 'warnings'}

 " Use modeline overrides
 set modeline
 set modelines=10

 " Default color scheme
 color molokai

 " Directories for swp files
 set backupdir=~/.vim/backup/
 set directory=~/.vim/backup/

 " MacVIM shift+arrow-keys behavior (required in .vimrc)
 let macvim_hig_shift_movement = 1

 " Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
end

 "

 " Ruby.vim settings
 imap <S-CR>    <CR><CR>end<Esc>-cc
"
" "unmap <C-P>
let g:yankring_replace_n_key = ''
"
" "These are moved to vim/after/plugin/mappings.vim
"map <C-P> <Nop>
"map <C-P> :CtrlP<CR>
"map <C-Y> :YRShow<CR>
"
nnoremap <leader>p :CtrlP<CR>
"
"
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal" || $TERM == "xterm-color"
  set t_Co=256
endif
"
