" Vim configuration file

"-------------------------------------------------------------------------------
" General
"-------------------------------------------------------------------------------
set nocompatible				" Disable vi compatibility
"set exrc                       " Allow local .vimrc files
"set secure                     " Restrict local .vimrc files shell/writ<F3>e access

"-------------------------------------------------------------------------------
" Leader Mappings
"-------------------------------------------------------------------------------
let mapleader = " "
let localleader = "\\"

"map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :qall<CR>
map <Leader>gs :Gstatus<CR>

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
filetype plugin indent on		" Enable filetype detection

" Make .h and .c files treated as pure c not c++
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c " .doxygen
augroup END

"-------------------------------------------------------------------------------
" Load plugins
"-------------------------------------------------------------------------------
call plug#begin('~/.vim/bundle')
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

    " Tab autocompletion
    Plug 'Valloric/YouCompleteMe'
    " Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
    "Plug 'ervandew/supertab'

    "Plug 'vim-syntastic/syntastic'
    Plug 'matze/vim-move' 
	Plug 'jiangmiao/auto-pairs'
	" Plug 'octol/vim-cpp-enhanced-highlight'
    " Plug 'bfrg/vim-cpp-modern'
    " Plug 'jeaye/color_coded'

    " Comment toggling
    " Plug 'scrooloose/nerdcommenter'
    Plug 'tomtom/tcomment_vim'

    Plug 'junegunn/vim-easy-align'
    Plug 'mbbill/undotree'
    Plug 'tomasr/molokai'
    Plug 'airblade/vim-rooter'
    " Plug 'w0rp/ale'
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    "Plug 'wesQ3/vim-windowswap'

    " File system navigation
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tacahiroy/ctrlp-funky'
    " Plug 'wincent/command-t'
    Plug 'octref/rootignore'

    " Document navigation
    " Plug 'joequery/Stupid-EasyMotion'
    Plug 'easymotion/vim-easymotion'

    "Plug 'ericcurtin/CurtineIncSw.vim'
    "Plug 'haya14busa/incsearch.vim'
    "Plug 'SirVer/ultisnips'

    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    "Plug 'tpope/vim-eunuch'
    "Plug 'tpope/vim-sensible'
    "Plug 'tpope/vim-unimpaired'
    " Plug 'wikitopian/hardmode'

    "Plug 'mileszs/ack.vim'

    "Plug 'pangloss/vim-javascript'
    "Plug 'plasticboy/vim-markdown'

	Plug 'elzr/vim-json'
    Plug 'nessss/vim-gml'
	
	" Git
    "Plug 'tpope/vim-fugitive'
    "Plug 'gregsexton/gitv', {'on': ['Gitv']}
    "Plug 'airblade/vim-gitgutter'
call plug#end()

"-------------------------------------------------------------------------------
" UTF-8 encoding
"-------------------------------------------------------------------------------
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8
"scriptencoding utf-8

"-------------------------------------------------------------------------------
" Colors & Formatting
"-------------------------------------------------------------------------------

syntax on

set background=dark
set t_Co=256					" Enable 256 colour support

let g:molokai_original = 1
colors molokai

set lines=80 columns=179		" Set page size

set colorcolumn=80				" Draw column marker"
highlight ColorColumn ctermbg=darkgray

set cursorline                  " Highlight current line

"set listchars=extends:→         " Show arrow if line continues rightwards
"set listchars+=precedes:←       " Show arrow if line continues leftwards

"set guifont=Fixedsys:h9:cANSI:qDRAFT	" Default font
"set guifont=OpenDyslexicMono:h9		" Dyslexic font


"-------------------------------------------------------------------------------
" Interface
"-------------------------------------------------------------------------------
set number						" Enable line numbering
set numberwidth=5
set showcmd						" Display commands under status bar
set wildmenu					" Command mode <tab> auto completion
" set wildmode=longest:full       " Use intelligent completion
set laststatus=2                " Show status line on startup
set autoread                    " Auto reload changed files

set clipboard=unnamed			" Use system clipboard
"set clipboard=unnamedplus      " X-Windows clipboard

set ruler						" Always show cursor position
set noerrorbells novisualbell	" Turn off visual and audible bells

set guioptions-=L	            " Fix windows aero snap by disabling left scollbar
set splitright                  " Open new splits to the right
set splitbelow                  " Open new splits to the bottom

set nowrap                      " Don't wrap lines at page boundary
set backspace=2                 " set backspace=indent,eol,start
set showmatch					" Highlight matching braces ( % jump to matching braces )

set complete-=i                 " Limit the files searched for auto-completes
set lazyredraw                  " No redraw during macro and script execution
set ttyfast                     " Send more characters in fast terminals
set showtabline=2
set scrolloff=5                 " Leave 5 lines of buffer when scrolling
"set sidescrolloff=10            " Leave 10 characters of horizontal buffer when scrolling

" Update term title but restore old title after leaving Vim
set title
set titleold=

"-------------------------------------------------------------------------------
" Mouse
"-------------------------------------------------------------------------------
set mouse=a                     " Enable mouse in all modes

":nmap <ScrollWheelUp> <nop>
":nmap <S-ScrollWheelUp> <nop>
":nmap <C-ScrollWheelUp> <nop>
":nmap <ScrollWheelDown> <nop>
":nmap <S-ScrollWheelDown> <nop>
":nmap <C-ScrollWheelDown> <nop>
:nmap <ScrollWheelLeft> <nop>
:nmap <S-ScrollWheelLeft> <nop>
:nmap <C-ScrollWheelLeft> <nop>
:nmap <ScrollWheelRight> <nop>
:nmap <S-ScrollWheelRight> <nop>
:nmap <C-ScrollWheelRight> <nop>

"-------------------------------------------------------------------------------
" Search
"-------------------------------------------------------------------------------
set incsearch					" Show search results as you type
set ignorecase					" Case insensitive
set smartcase					" Use case if any caps used in search
set hlsearch                    " Highlight search results

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"-------------------------------------------------------------------------------
" Whitespace
"-------------------------------------------------------------------------------
set tabstop=4					" Tab width is 4 spaces
set softtabstop=4				" Backspace keeps tab alignment
set shiftwidth=4				" Indent with 4 spaces
set expandtab					" Expand tabs to spaces
set shiftround                  " Round indentation to nearest multiple of shiftwidth
"set noexpandtab				" Do not expand tabs to spaces
"set smarttab                   " Use tabs for indent and spaces for alignment

set autoindent					" Use indentation of previous line
set smartindent				    " Use intelligent indentation for C
set cindent					    " Stricter rules for C programs
set cinoptions+=g0,(0,u0,U0     " Fix cindent style
"set cinoptions+=:0,g0          " Fix cindent style
"set preserveindent             " Preserve indent after <Esc>

"set spell                      " Enable spell checking
"set nospell                    " Disable spell checking
set spl=en_gb                   " Use real english for spelling

"-------------------------------------------------------------------------------
" Folding
"-------------------------------------------------------------------------------
"set foldenable                  " Enable folding
"set foldlevelstart=10           " Open most folds by default
"set foldnestmax=10              " Nested fold max
"set foldmethod=indent            " Fold based on indent level

" Open/closes folds
"nnoremap <leader>za

"-------------------------------------------------------------------------------
" Reference settings for future use
"-------------------------------------------------------------------------------

"set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape

"set formatoptions+=r		    " Auto close comments
"set textwidth=80				" Wrap lines at 80 chars
"set relativenumber             " Show cursor relative line numbers
" intelligent comments
"set comments=sl:/*,mb:\ *,elx:\ */
au FileType c,cpp,cs,java,javascript setlocal comments-=:// comments+=f://
au FileType vim setlocal comments-=:" comments+=f:"


"let &path.="src/include,/usr/include/AL,"

"-------------------------------------------------------------------------------
" Setup build shortcuts
"-------------------------------------------------------------------------------

if has('win32') || has('win64')
    compiler msvc
    set makeprg=nmake
    noremap <F5> :<C-U>make<CR>
endif

" Build Project
"set makeprg=make\ -C\ ../build\ -j9
"nnoremap <F4> :make!<cr>

" Run Program

"nnoremap <F5> :!./my_great_program<cr>
"map <F4> :call CurtineIncSw()<CR>
map <F3> :NERDTreeToggle<CR>

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
" OSX clang support
" ./install.py --system-libclang --clang-completer

" let g:ycm_show_diagnostics_ui = 1

"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

"let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
"let g:ycm_key_list_stop_completion = ['<C-y>', '<C-Space>', '<Space>']

" let g:ycm_goto_buffer_command = 'new-tab'
let g:ycm_always_populate_location_list = 1
" let g:syntastic_always_populate_loc_list = 1

nnoremap <leader>ff :YcmCompleter FixIt<CR>
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>cc :close<CR>

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

" <Ctrl-P> <Ctrl-N>
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"let g:ctrlp_user_command = 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/node_modules/

"-------------------------------------------------------------------------------
" Ctrlp funky settings
"-------------------------------------------------------------------------------
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

"-------------------------------------------------------------------------------
" EasyAlign settings
"-------------------------------------------------------------------------------
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

"let g:easy_align_ignore_groups = ['Comment', 'String']
let g:easy_align_ignore_groups = ['String']

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
set history=500                 " Increase the undo limit

"-------------------------------------------------------------------------------
" Backup & Swap 
"-------------------------------------------------------------------------------
"set nobackup
"set noswapfile
"set nobackup nowritebackup noswapfile " Turn off backup files

"-------------------------------------------------------------------------------
" Helper mappings
"-------------------------------------------------------------------------------

" Force vim navigation
"nnoremap <Left> :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up> :echoe "Use k"<CR>
"nnoremap <Down> :echoe "Use j"<CR>

" Windows cut & paste
":inoremap <C-v> <ESC>"+pa
":vnoremap <C-c> "+y
":vnoremap <C-d> "+d

" Insert newline without mode switch
nmap <A-o> o<ESC>
nmap <A-O> O<ESC>

" Next/Prev location (Error/Warnings list)
noremap <leader>] :lnext<CR>
noremap <leader>[ :lprev<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"-------------------------------------------------------------------------------
" Ale settings
"-------------------------------------------------------------------------------
" let g:ale_linters = {
" \   'javascript': ['jshint'],
" \   'c++': ['clang'],
" \   'c': ['clang']
" \}
"
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin\n"
        let g:move_map_keys = 0
        vmap ∆ <Plug>MoveBlockDown
        vmap ˚ <Plug>MoveBlockUp
        nmap ∆ <Plug>MoveLineDown
        nmap ˚ <Plug>MoveLineUp

        nmap ø o<ESC>
        nmap Ø O<ESC>
  endif
endif

"-------------------------------------------------------------------------------
" Buffer selection
"-------------------------------------------------------------------------------
nnoremap <leader>n :bnext<CR>
nnoremap <leader>b :bprevious<CR>

"nmap <leader>n :bnext<CR>
"nmap <leader>b :bprevious<CR>

"-------------------------------------------------------------------------------
" Enhanced keyboard mappings
"-------------------------------------------------------------------------------

" In normal mode F2 will save the file
nmap <F2> :w<CR>
" In insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" Switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" Recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" Create doxygen comment
"map <F6> :Dox<CR>
" Build using makeprg with <F7>
map <F7> :make<CR>
" Build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" Goto definition with F12
map <F12> <C-]>
" In diff mode we use the spell check keys for merging
if &diff
  ” diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " Spell settings
"  :setlocal spell spelllang=en
  " Set the spellfile - folders must exist
"  set spellfile=$HOME/vimfiles/spellfile.add
"  map <M-Down> ]s
"  map <M-Up> [s
endif

