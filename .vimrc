let mapleader = " "
let maplocalleader=','
set nocompatible
set number

"set the runtime path to include Vundle and initialize
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
"Plugin 'tpope/vim-rails'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-commentary'
"Plugin 'thoughtbot/vim-rspec'
"Plugin 'tpope/vim-dispatch'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'elixir-lang/vim-elixir'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'airblade/vim-gitgutter'
" All of your Plugins must be added before the following line
call vundle#end()            " required


execute pathogen#infect()
syntax on
filetype plugin indent on
set mouse=a
set hid
set incsearch
set sts=2
set ignorecase  "case insensitive by default

set ruler         " show the cursor position all the time



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

let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" " Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:javascript_plugin_flow = 1

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s\+$//e
endfunction

:command -bar -nargs=1 OpenURL :!open

set nobackup
set noswapfile
set nowritebackup
set updatetime=75

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

"shortcut for find and replace
map rr :%s///gc

set runtimepath^=~/.vim/bundle/ctrlp.vim
map <TAB> <ESC>:CtrlPClearCache<CR><ESC>:CtrlP<RETURN>

"open up nerd tree when pressing tab twice
map <TAB><TAB> <ESC>:NERDTreeToggle<RETURN>

"redo latest changes to file
map <S-U> <ESC>:red<RETURN>

"alt-left changes to previous buffer and saves file
map <S-Left> <ESC>:w<RETURN><ESC>:bp<RETURN>
 "alt-right changes to next buffer and saves file
map <S-Right> <ESC>:w<RETURN><ESC>:bn<RETURN>

map <Leader>s :call RunNearestSpec()<CR>
map <Leader>ss :call RunCurrentSpecFile()<CR>
map a :Ack! -i 

"close the current buffer
map q <ESC>:bd<RETURN>


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


" strips off two full keystrokes from almost every Vim command since I dont have to press shift
nnoremap ; :
