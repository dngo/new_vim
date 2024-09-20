set encoding=utf-8
set number
set nocompatible
filetype off                  " required

let mapleader = " "
let maplocalleader=','
let g:javascript_plugin_jsdoc = 1


"let g:ycm_python_binary_path = '/usr/local/bin/python3'

"set the runtime path to include Vundle and initialize
filetype off                  " required
=======
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-rails'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'tpope/vim-dispatch'
Plugin 'vim-ruby/vim-ruby'
Plugin 'janko/vim-test'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'preservim/nerdtree'
Plugin 'slim-template/vim-slim.git'
Plugin 'christoomey/vim-sort-motion'
Plugin 'christoomey/vim-system-copy'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'flazz/vim-colorschemes'
Plugin 'airblade/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
" All of your Plugins must be added before the following line
call vundle#end()            " required

call plug#begin()
" List your plugins here
Plug 'preservim/nerdtree'
Plug 'pangloss/vim-javascript'
call plug#end()

execute pathogen#infect()
syntax on
filetype plugin indent on
set autoread  " reload files when changed on disk, i.e. via `git checkout`
set backspace=2 " fix broken backspace in some setups
set mouse=a
set hid
set incsearch "highlight matches as you type
set hlsearch "highlight matches
set sts=2
set ignorecase  "case insensitive by default
set smartcase   "but case-sensitive if expression contains a capital letter
"set cursorline " highlight current line
"
let g:NERDTreeFileExtensionHighlightFullName = 1



set ruler         " show the cursor position all the time

"tabs and indentation
set expandtab
set autoindent
set smartindent

"configure tabstyle
set tabstop=2
set softtabstop=2
set shiftwidth=2

"set textwidth=100
"set colorcolumn=+1

runtime! macros/matchit.vim

augroup myfiletypes
	autocmd!
	autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

autocmd FileType eruby
    \ if b:eruby_subtype ==# 'javascript'
    \   set sw=2
    \ endif


au BufRead sup.*        set ft=mail

autocmd BufNewFile,BufRead *.yml set ft=ruby fenc=utf-8
autocmd BufWritePre *.rb call TrimWhiteSpace()
autocmd BufWritePre *.haml call TrimWhiteSpace()
autocmd BufWritePre *.yml call TrimWhiteSpace()
autocmd BufWritePre *.css call TrimWhiteSpace()
autocmd BufWritePre *.slim call TrimWhiteSpace()
autocmd BufWritePre *.js call TrimWhiteSpace()
autocmd BufWritePre *.py call TrimWhiteSpace()
autocmd CursorHold,CursorHoldI * update   "autosave

let g:javascript_plugin_flow = 1

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s\+$//e
endfunction

:command -bar -nargs=1 OpenURL :!open

set nobackup
set noswapfile
set nowritebackup
set updatetime=250 "autosave current file every 500ms
set hidden                      " Allow buffer change w/o saving

:au FocusLost * silent! wa "autosave buffer when focus lost
:set autowrite "autosave buffer on switch


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

"shortcut for find and replace word under cursor
"map rr :%s///gc
map rr :%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left>

"for commenting out code
map # :s/^/# /


set runtimepath^=~/.vim/bundle/ctrlp.vim
map <TAB> :CtrlP<CR>
map ~ <ESC> 
"open up nerd tree when pressing tab twice
map <TAB><TAB> :NERDTreeToggle<CR>

"redo latest changes to file
  map <S-U> :red<CR>

"shift-h or shift-left saves file and goes to previous buffer
  nnoremap <silent> <S-Left> :w\|bp<CR>
  nnoremap <silent> <S-h> :w\|bp<CR>

"shift-e or shift-right saves file and goes to next buffer
  nnoremap <silent>  <S-Right> :w\|bn<CR>
  nnoremap <silent>  <S-e> :w\|bn<CR>

"In a test file runs the test nearest to the cursor, otherwise runs the last nearest test.
nmap <Leader>s :w<CR> :TestNearest<CR>
" In a test file runs all tests in the current file, otherwise runs the last file tests.
nmap <Leader>ss :w<CR> :TestFile<CR>

nnoremap f :Ack!

"imap only applies while in insert mode
"imap ` <Esc>
"inoremap ` <Esc>

" Up/down/left/right {{{
 nnoremap h h|xnoremap h h|onoremap h h|
 nnoremap l k|xnoremap l k|onoremap l k|
 nnoremap n j|xnoremap n j|onoremap n j|
 nnoremap e l|xnoremap e l|onoremap e l|
" }}}

" find/next/remap {{{
 nnoremap k n|
 nnoremap K N|
" }}}
"
"Window handling {{{
   nnoremap <C-h> <c-w>h
   nnoremap <C-l> <c-w>k
   nnoremap <C-n> <c-w>j
   nnoremap <C-e> <c-w>l
   nnoremap <C-Left> <c-w>h
   nnoremap <C-Up> <c-w>k
   nnoremap <C-Down> <c-w>j
   nnoremap <C-Right> <c-w>l
"}}}
"
" go to top/bottom {{{
 map <S-Up> gg
 map <S-Down> <S-g>
" }}}

"disable arrow keys
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

" Alt-right/left to navigate forward/backward in the ctags stack
map <M-Left> <C-T>
map <M-Right> <C-]>


"close the current buffer without closing window splits
map q :bp\|bd #<CR>

set pastetoggle=<F2> "press F2 to toggle between :set paste and :set nopaste
set bs=2
set selection=inclusive

let NERDTreeWinSize=60
let NERDTreeShowBookmarks=1       " Show the bookmarks table on startup
let NERDTreeShowFiles=1           " Show hidden files, too
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1          " Quit on opening files from the tree
let NERDTreeHighlightCursorline=1 " Highlight the selected entry in the tree
let NERDTreeMouseMode=2           " Use a single click to fold/unfold directories
                                  " and a double click to open files


let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.git']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:100,results:100'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_custom_ignore = {
  \ 'dir': 'bin\|node_modules\|public\|log\|git',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'javascript',
  \ }


" strips off two full keystrokes from almost every Vim command since I dont have to press shift
nnoremap ; :

" ctrlp Press <F5> to refresh the cache

" ctags
" Alt-right go forward in ctags stack
" Alt-left go backward in the ctags stack
" Ctrl+Left MouseClick - Go to definition
" Ctrl+Right MouseClick - Jump back from definition
" ctrl-] go to tag
" ctrl-o return from gf

" :%norm A ; "appends ; to the end of all lines
" :%norm I , "prepends , to the end of all lines
" i "opens in split while in nerdtree
" shift-[ "jump to prev empty line
" shift-] "jump to next empty line
" !<command> "executes shell command

" vim-fugitive commands
" Gblame, Gstatus, Gcommit

"vim-surround
" ds"  "removes surrounding quotes
" ysiw" "add surrounding quotes

" :bufdo e "reloads all buffers

"sort-motion
"highlight text in visual mode, gs

"system-copy
"cp is mapped to copy the highlighted contents to cliboard
"cv is mapped to paste the content of system clipboard to the next line
