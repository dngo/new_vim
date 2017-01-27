let maplocalleader=',' 
set nocompatible
set number
execute pathogen#infect()
syntax on
filetype plugin indent on
set mouse=a
set hid
set incsearch
set sts=2
set ignorecase  "case insensitive by default


runtime! macros/matchit.vim

augroup myfiletypes
	autocmd!
	autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

au BufRead sup.*        set ft=mail

autocmd BufNewFile,BufRead *.yml set ft=ruby fenc=utf-8
autocmd BufWritePre *.rb call TrimWhiteSpace()
autocmd BufWritePre *.haml call TrimWhiteSpace()
autocmd BufWritePre *.yml call TrimWhiteSpace()
autocmd BufWritePre *.css call TrimWhiteSpace()
autocmd BufWritePre *.js call TrimWhiteSpace()
autocmd CursorHold,CursorHoldI * update   "autosave

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s\+$//e
endfunction

:command -bar -nargs=1 OpenURL :!open  

set nobackup
set noswapfile
set nowritebackup
set updatetime=250

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"let g:proj_flags="imsgtv"

colorscheme vividchalk
set background=dark

hi MBENormal guibg=black ctermbg=black
hi MBEVisibleNormal guibg=green ctermbg=green
hi MBEChanged guibg=red ctermbg=red
hi MBEVisibleChanged guibg=yellow ctermbg=yellow

"if has("gui_macvim")
  "Fullscreen MacVim
"  set fuopt=maxhorz,maxvert
"endif

set statusline=%m%F%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"set statusline=%F[%p%%]
map rr :%s///gc 
"map rt :call RunTest('')<RETURN>

set runtimepath^=~/.vim/bundle/ctrlp.vim
map <TAB> <ESC>:CtrlP<RETURN>

"open up nerd tree when pressing tab twice
map <TAB><TAB> <ESC>:NERDTreeToggle<RETURN> 

"redo latest changes to file
map <S-U> <ESC>:red<RETURN> 

"alt-left changes to previous buffer and saves file
map <S-Left> <ESC>:w<RETURN><ESC>:bp<RETURN> 
 "alt-right changes to next buffer and saves file
map <S-Right> <ESC>:w<RETURN><ESC>:bn<RETURN> 

set pastetoggle=<F2> "press F2 to toggle between :set paste and :set nopaste
set bs=2
set selection=exclusive

let NERDTreeShowBookmarks=1       " Show the bookmarks table on startup
let NERDTreeShowFiles=1           " Show hidden files, too
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1          " Quit on opening files from the tree
let NERDTreeHighlightCursorline=1 " Highlight the selected entry in the tree
let NERDTreeMouseMode=2           " Use a single click to fold/unfold directories
                                  " and a double click to open files
"let g:EasyMotion_leader_key = '<SPACE>' 

" strips off two full keystrokes from almost every Vim command since I dont have to press shift
nnoremap ; :
