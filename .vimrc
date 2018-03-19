" Vim config

"-------------------------------------------------------------------------------
" General
"-------------------------------------------------------------------------------
set nocompatible				" be iMproved, required

" Leader
let mapleader = " "
let localleader = "//"


"-------------------------------------------------------------------------------
" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
"-------------------------------------------------------------------------------
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

"-------------------------------------------------------------------------------
" Filetype handling
"-------------------------------------------------------------------------------
filetype plugin indent on		" enable filetype detection

" Make .h and .c files treated as pure c not c++
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c " .doxygen
augroup END

"-------------------------------------------------------------------------------
" Load plugins
"-------------------------------------------------------------------------------
call plug#begin('~/.vim/bundle')
	"Plug 'tpope/vim-sensible'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	"Plug 'Valloric/YouCompleteMe'
	Plug 'jiangmiao/auto-pairs'
	"Plug 'vim-syntastic/syntastic'
	Plug 'octol/vim-cpp-enhanced-highlight'
	"Plug 'ericcurtin/CurtineIncSw.vim'
	"Plug 'haya14busa/incsearch.vim'
	"Plug 'airblade/vim-rooter'
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'ctrlpvim/ctrlp.vim'
	"Plug 'tacahiroy/ctrlp-funky'
	Plug 'SirVer/ultisnips'
	Plug 'junegunn/vim-easy-align'
	Plug 'tpope/vim-repeat'
	"Plug 'mileszs/ack.vim'
	Plug 'mbbill/undotree'
	Plug 'tomasr/molokai'
"	Plug 'kien/ctrlp.vim'
	
	" Git
	"Plug 'tpope/vim-fugitive'
	"Plug 'gregsexton/gitv', {'on': ['Gitv']}
	"Plug 'airblade/vim-gitgutter'
call plug#end()

"-------------------------------------------------------------------------------
" Setup build shortcuts
"-------------------------------------------------------------------------------

compiler msvc
set makeprg=nmake
noremap <F5> :<C-U>make<CR>

"-------------------------------------------------------------------------------
" Highlighing and colour
"-------------------------------------------------------------------------------
set background=dark
set t_Co=256					" Enable 256 colour support
let g:molokai_original = 1
colors molokai


syntax on

set colorcolumn=80				" Draw column marker"
highlight ColorColumn ctermbg=darkgray

"-------------------------------------------------------------------------------
" Interface
"-------------------------------------------------------------------------------
set number						" Enable line numbering
set showcmd						" Display incomplete commands

"set scrolloff=5                " Leave 5 lines of buffer when scrolling
"set sidescrolloff=10  " Leave 10 characters of horizontal buffer when scrolling

set clipboard=unnamed				" Use system clipboard
"set clipboard=unnamedplus          " X-Windows clipboard
set mouse=a
set noerrorbells novisualbell		" Turn off visual and audible bells


"-------------------------------------------------------------------------------
" Search
"-------------------------------------------------------------------------------
set incsearch					" enable incremental searching
set ignorecase					" case insensitive
set smartcase					" use case if any caps used in search
set hlsearch					" enable search highlighting

"-------------------------------------------------------------------------------
" Status line
"-------------------------------------------------------------------------------
set laststatus=2				" Alway display the status line

set ruler						" Always show cursor position
set wildmenu					" Command <tab> auto completion"

set lines=80 columns=100		" set page size
set guioptions-=L	" Fix windows aero snap by disabling left scollbar
set splitbelow
set splitright

"-------------------------------------------------------------------------------
" Whitespace
"-------------------------------------------------------------------------------
set tabstop=4					" tab width is 4 spaces
set softtabstop=4				
set shiftwidth=4				" indent with 4 spaces
"set noexpandtab				" do not expand tabs to spaces
set expandtab					" expand tabs to spaces
set showtabline=4
set nowrap
"set textwidth=80				" wrap lines at 80 chars
"set autoindent					" use indentation of previous line
"set smartindent				" use intelligent indentation for C
"set cindent					" stricter rules for C programs
"set smarttab
"set complete-=i

set showmatch					" highlight matching braces

set backspace=2 "set backspace=indent,eol,start

"set guifont=Fixedsys:h9:cANSI:qDRAFT	" Default font
"set guifont=OpenDyslexicMono:h9		" Dyslexic font

"-------------------------------------------------------------------------------
" set UTF-8 encoding
"-------------------------------------------------------------------------------
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8

set spl=en_gb                   " Use real english for spelling
"set spell                      " Enable spell checking
"set nospell                    " Disable spell checking

set autoread				" Enable autoloading when file changes

"set formatoptions+=r		" Auto close comments

"augroup project
"    autocmd!
"    autocmd BufRead,BufNewFile *.h,*.c
"augroup END

"let &path.="src/include,/usr/include/AL,"

" Build Project
"set makeprg=make\ -C\ ../build\ -j9
"nnoremap <F4> :make!<cr>

" Run Program

"nnoremap <F5> :!./my_great_program<cr>
"map <F4> :call CurtineIncSw()<CR>
map <F2> :NERDTreeToggle<CR>


"-------------------------------------------------------------------------------
" Airline Theme
"-------------------------------------------------------------------------------
if has('win32') || has('win64') 
    set guifont=Inconsolata-g\ for\ Powerline
else
    set guifont=Monaco\ for\ Powerline
endif

let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"-------------------------------------------------------------------------------
" YouCompleteMe settings
"-------------------------------------------------------------------------------
"let g:ycm_show_diagnostics_ui = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

"let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
"let g:ycm_key_list_stop_completion = ['<C-y>', '<C-Space>', '<Space>']

"-------------------------------------------------------------------------------
" Syntasic settings
"-------------------------------------------------------------------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"-------------------------------------------------------------------------------
" Ctrlp settings
"-------------------------------------------------------------------------------
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'

"let g:ctrlp_root_markers = ['Makefile', '.git']

"set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"-------------------------------------------------------------------------------
" Ctrlp funky settings
"-------------------------------------------------------------------------------
"nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
"nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

"-------------------------------------------------------------------------------
" Undo tree settings
"-------------------------------------------------------------------------------
noremap <Leader>u :UndotreeToggle<CR>

"-------------------------------------------------------------------------------
" Persistent undo
"-------------------------------------------------------------------------------
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

set history=500

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip

"-------------------------------------------------------------------------------
" Backup & Swap 
"-------------------------------------------------------------------------------
"set nobackup
"set noswapfile

"-------------------------------------------------------------------------------
" Colors & Formatting
"-------------------------------------------------------------------------------

" Showcase comments in italics
"highlight Comment cterm=italic gui=italic


" Force vim navigation
"nnoremap <Left> :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up> :echoe "Use k"<CR>
"nnoremap <Down> :echoe "Use j"<CR>

" Windows cut & paste
":inoremap <C-v> <ESC>"+pa
":vnoremap <C-c> "+y
":vnoremap <C-d> "+d

" intelligent comments
"set comments=sl:/*,mb:\ *,elx:\ */

"-------------------------------------------------------------------------------
" Enhanced keyboard mappings
"-------------------------------------------------------------------------------

" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>
" in diff mode we use the spell check keys for merging
if &diff
  ” diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " spell settings
"  :setlocal spell spelllang=en
  " set the spellfile - folders must exist
"  set spellfile=$HOME/vimfiles/spellfile.add
"  map <M-Down> ]s
"  map <M-Up> [s
endif


