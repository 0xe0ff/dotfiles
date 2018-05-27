" Vim configuration file

"-------------------------------------------------------------------------------
" Identify platform
"-------------------------------------------------------------------------------
silent function! OSX()
    return has('macunix')
endfunction
silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
    return  (has('win32') || has('win64'))
endfunction

"-------------------------------------------------------------------------------
" General
"-------------------------------------------------------------------------------
set nocompatible                " Disable vi compatibility
"set exrc                       " Allow local .vimrc files
"set secure                     " Restrict local .vimrc files shell/writ<F3>e access

"-------------------------------------------------------------------------------
" UTF-8 encoding
"-------------------------------------------------------------------------------
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8
scriptencoding utf-8

"-------------------------------------------------------------------------------
" Leader Mappings
"-------------------------------------------------------------------------------
let mapleader = " "
let maplocalleader = "\\"

"map <Space> <leader>
map <Leader>ww :update<CR>
map <silent><C-q> :Bdelete<CR>
map <silent><C-Q> :Bdelete!<CR>
map <silent><Leader>q :q<CR>
map <Leader>qa :qall<CR>
" map <Leader>gs :Gstatus<CR>

"-------------------------------------------------------------------------------
" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
"-------------------------------------------------------------------------------
if WINDOWS()
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

"-------------------------------------------------------------------------------
" Filetype handling
"-------------------------------------------------------------------------------
filetype plugin indent on    " Enable filetype detection

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
    " Plug 'ervandew/supertab'
    " Plug 'vim-syntastic/syntastic'
    " Plug 'majutsushi/tagbar'
    " Plug 'OmniCppComplete'
    " Plug 'rhysd/vim-clang-format'
    " Plug 'sickill/vim-monokai'
    " Plug 'lyuts/vim-rtags', { 'for': ['c', 'cpp'] }
    " Plug 'edkolev/vim-amake'

    Plug 'matze/vim-move'
    Plug 'jiangmiao/auto-pairs'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'pbrisbin/vim-mkdir'
    " Plug 'octol/vim-cpp-enhanced-highlight'
    " Plug 'bfrg/vim-cpp-modern'
    " Plug 'jeaye/color_coded'
    " Plug 'vim-scripts/ReplaceWithRegister'

    " Comment toggling
    " Plug 'scrooloose/nerdcommenter'
    Plug 'tomtom/tcomment_vim'
    " Plug 'vim-scripts/tComment'
    " Plug 'tpope/vim-commentary'

    Plug 'junegunn/vim-easy-align'
    " Plug 'godlygeek/tabular'
    Plug 'tomasr/molokai'
    " Plug 'w0rp/ale'

    " Window management
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'wesQ3/vim-windowswap'
    Plug 'cesheridan/tabwins'
    Plug 'moll/vim-bbye'
    " Plug 'romainl/vim-qf'
    " Plug 'blarghmatey/split-expander'
    " Plug 'vim-scripts/sessionman.vim'

    " File system navigation
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tacahiroy/ctrlp-funky'
    Plug 'airblade/vim-rooter'
    Plug 'octref/rootignore'
    Plug 'FelikZ/ctrlp-py-matcher'
    " Plug 'wincent/command-t'

    " Plug 'yegappan/mru'

    " Document navigation
    Plug 'easymotion/vim-easymotion'
    Plug 'ericcurtin/CurtineIncSw.vim'
    " Plug 'vim-scripts/ShowMarks'
    Plug 'farmergreg/vim-lastplace'
    Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
    " Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

    " Search enhancments
    Plug 'mileszs/ack.vim'
    " Plug 'jremmen/vim-ripgrep'
    " Plug 'haya14busa/incsearch.vim'
    " Plug 'haya14busa/incsearch-easymotion.vim'
    " Plug 'ddrscott/vim-side-search'

    " Plug 'tmhedberg/matchit'

    " Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'

    " Plug 'AndrewRadev/switch.vim'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'

    Plug 'tpope/vim-endwise'
    " Plug 'tpope/vim-eunuch'
    " Plug 'tpope/vim-sensible'
    " Plug 'tpope/vim-unimpaired'
    " Plug 'wikitopian/hardmode'

    " Json
    Plug 'elzr/vim-json'

    " Gamemaker
    Plug 'nessss/vim-gml'

    " Lua
    " Plug 'tbastos/vim-lua'
    " Plug 'vim-lua-ftplugin'

    " Javascript
    " Plug 'pangloss/vim-javascript'

    " Csv
    " Plug 'chrisbra/csv.vim'

    " lldb debugger interface
    " Plug 'gilligan/vim-lldb'

    " Markdown
    " Plug 'plasticboy/vim-markdown'

    " Uml diagram editing
    " Plug 'aklt/plantuml-syntax'
    " Plug 'scrooloose/vim-slumlord'

    " Tmux integration
    " Plug 'benmills/vimux'
    " Plug 'christoomey/vim-tmux-navigator'

    " Git
    " Plug 'tpope/vim-fugitive'
    " Plug 'gregsexton/gitv', {'on': ['Gitv']}
    " Plug 'airblade/vim-gitgutter'
    " Plug 'jreybert/vimagit'
    " Plug 'junegunn/gv.vim'
call plug#end()

"-------------------------------------------------------------------------------
" Colors & Formatting
"-------------------------------------------------------------------------------
syntax on                       " Enable syntax highlighting

set background=dark             " Use colours for dark background
set t_Co=256                    " Enable 256 colour support

let g:molokai_original = 1
" let g:rehash256 = 1
" colors molokai
colorscheme molokai

set lines=80 columns=179        " Set page size

set colorcolumn=81              " Draw column marker"
highlight ColorColumn ctermbg=darkgray

set cursorline                  " Highlight current line

" set listchars=extends:→       " Show arrow if line continues rightwards
" set listchars+=precedes:←     " Show arrow if line continues leftwards

" set guifont=Fixedsys:h9:cANSI:qDRAFT  " Default font
" set guifont=OpenDyslexicMono:h9    " Dyslexic font

set fileformats=unix

"-------------------------------------------------------------------------------
" Interface
"-------------------------------------------------------------------------------
set number                      " Enable line numbering
set numberwidth=5
set showcmd                     " Display commands under status bar
set wildmenu                    " Command mode <tab> auto completion
" set wildmode=list:longest:full  " Use intelligent completion
set laststatus=2                " Always show the status bar
set autoread                    " Auto reload files changed outside vim

" set clipboard=unnamed         " Use system clipboard
" set clipboard=unnamedplus     " X-Windows clipboard
if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

set ruler                       " Always show cursor position
" set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set noerrorbells novisualbell   " Turn off visual and audible bells
" set visualbell                " Turn on visual bell

set guioptions-=L               " Fix windows aero snap by disabling left scollbar
set splitright                  " Open new splits to the right
set splitbelow                  " Open new splits to the bottom

set nowrap                      " Don't wrap lines at page boundary
set backspace=2                 " set backspace=indent,eol,start
set showmatch                   " Highlight matching braces
                                " ( % jump to matching braces )

set complete-=i                 " Limit the files searched for auto-completes
set lazyredraw                  " No redraw during macro and script execution
set ttyfast                     " Send more characters in fast terminals
set showtabline=2
set scrolloff=5                 " Leave lines of buffer when scrolling
" set sidescrolloff=5           " Leave columns of buffer when scrolling
set hidden                      " Allow buffer changing without saving
" set showmode                  " Display the current mode
" set shortmess=atI             "

set title                       " Set window title to current file
set titleold=                   " Restore window title on exit

set timeoutlen=1000             " Set leader timeout default 1000
" set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape

" if !WINDOWS()
"     let g:is_posix = 1
"     set shell=/bin/sh         " The shell used to execute commands
" endif

" set nostartofline             " Keep the cursor on the same column

" set virtualedit=block         " Enable visual block editing

" Visualise line wrap
" let &showbreak = '↳ '
" set breakindent
" set breakindentopt=sbr

"-------------------------------------------------------------------------------
" Mouse
"-------------------------------------------------------------------------------

" silent! set ttymouse=xterm2   " Enable mouse tab/buffer select and resize
set mouse=a                     " Enable mouse in all modes
" set mousehide                 " Hide the mouse cursor while typing

" Disable mouse scroll wheel

" :nmap <ScrollWheelUp> <nop>
" :nmap <S-ScrollWheelUp> <nop>
" :nmap <C-ScrollWheelUp> <nop>
" :nmap <ScrollWheelDown> <nop>
" :nmap <S-ScrollWheelDown> <nop>
" :nmap <C-ScrollWheelDown> <nop>
nmap <ScrollWheelLeft> <nop>
nmap <S-ScrollWheelLeft> <nop>
nmap <C-ScrollWheelLeft> <nop>
nmap <ScrollWheelRight> <nop>
nmap <S-ScrollWheelRight> <nop>
nmap <C-ScrollWheelRight> <nop>

"-------------------------------------------------------------------------------
" Search
"-------------------------------------------------------------------------------
set incsearch           " Show search results as you type
set ignorecase          " Case insensitive search
set smartcase           " Use case sensitive if caps used in search
set hlsearch            " Enable search highlighting

" nohlsearch

" Turn off search highlight
nnoremap <silent><leader>/ :nohlsearch<CR>

" Clear last search
nnoremap <silent><leader>// :let @/ = ""<CR>

"-------------------------------------------------------------------------------
" Whitespace
"-------------------------------------------------------------------------------
set tabstop=4               " Tab width is 4 spaces
set softtabstop=4           " Backspace keeps tab alignment
set shiftwidth=4            " Indent with 4 spaces
set expandtab               " Convert tabs to spaces
set shiftround              " Round indentation to nearest multiple of shiftwidth
" set noexpandtab           " Do not expand tabs to spaces
" set smarttab              " Use tabs for indent and spaces for alignment

set autoindent              " Use indentation of previous line
set smartindent             " Use intelligent indentation for C
set cindent                 " Stricter rules for C programs
set cinoptions+=g0,(0,u0,U0 " Fix cindent style
" set cinoptions+=:0,g0     " Fix cindent style
" set preserveindent        " Preserve indent after <Esc>

" set spell                 " Enable spell checking
" set nospell               " Disable spell checking
set spl=en_gb               " Use real english for spelling

" Highlight problematic whitespace
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

"-------------------------------------------------------------------------------
" Folding
"-------------------------------------------------------------------------------
" set nofoldenable          " Disable folding by default

" set foldenable            " Enable folding
" set foldlevelstart=10     " Open most folds by default
" set foldnestmax=10        " Nested fold max
" set foldmethod=indent     " Fold based on indent level

" Open/closes folds
" nnoremap <leader>za

" Code folding options
" nmap <leader>f0 :set foldlevel=0<CR>
" nmap <leader>f1 :set foldlevel=1<CR>
" nmap <leader>f2 :set foldlevel=2<CR>
" nmap <leader>f3 :set foldlevel=3<CR>
" nmap <leader>f4 :set foldlevel=4<CR>
" nmap <leader>f5 :set foldlevel=5<CR>
" nmap <leader>f6 :set foldlevel=6<CR>
" nmap <leader>f7 :set foldlevel=7<CR>
" nmap <leader>f8 :set foldlevel=8<CR>
" nmap <leader>f9 :set foldlevel=9<CR>

"-------------------------------------------------------------------------------
" Ignored files/directories from autocomplete (and CtrlP)
"-------------------------------------------------------------------------------
set wildignore+=*/tmp/
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*.swp
set wildignore+=*/node_modules/
set wildignore+=*.tpak

"-------------------------------------------------------------------------------
" Reference settings for future use
"-------------------------------------------------------------------------------

" set tabpagemax=50             " Maximum number of tab pages
" set formatoptions+=j          " Delete comment chars when joining lines
" set formatoptions+=r          " Auto close comments
" set textwidth=80              " Wrap lines at 80 chars
" set relativenumber            " Show cursor relative line numbers

" set confirm " Display a confirmation dialog when closing an unsaved file
" set display+=lastline " Always try to show a paragraph’s last line.
" set linebreak " Avoid wrapping a line in the middle of a word.
" set wrap " Enable line wrapping.
" set nomodeline " Ignore file’s mode lines; use vimrc configurations instead.
" set nrformats-=octal " Interpret octal as decimal when incrementing numbers.
set autowrite     " Automatically :write before running commands
set spellfile=$HOME/.vim-spell-en.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell
"
" " Always use vertical diffs
" set diffopt+=vertical
"
" set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
" set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
" set virtualedit=onemore             " Allow for cursor beyond last character
" set iskeyword-=.                    " '.' is an end of word designator
" set iskeyword-=#                    " '#' is an end of word designator
" set iskeyword-=-                    " '-' is an end of word designator
"
" set tabpagemax=15               " Only show 15 tabs
"
" set linespace=0                 " No extra spaces between rows
" set winminheight=0              " Windows can be 0 line high
" set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
" set scrolljump=5                " Lines to scroll when cursor leaves screen
"
" set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
" "set matchpairs+=<:>             " Match, to be used with %
" set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
"
" set whichwrap=b,s
" set nojoinspaces
" set diffopt=filler,vertical
" set foldlevelstart=99
" set grepformat=%f:%l:%c:%m,%f:%l:%m
" set completeopt=menuone,preview
" set nrformats=hex
" silent! set cryptmethod=blowfish2
"
" set formatoptions+=1
" set formatoptions+=j
"
" set modelines=2
"
" " Disable CTRL-A on tmux or on screen
" if $TERM =~ 'screen'
"     nnoremap <C-a> <nop>
"     nnoremap <Leader><C-a> <C-a>
" endif




" intelligent comments
"set comments=sl:/*,mb:\ *,elx:\ */
"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

"let &path.="src/include,/usr/include/AL,"

"-------------------------------------------------------------------------------
" Comment continuation settings
"-------------------------------------------------------------------------------
au FileType c,cpp,cs,java,javascript setlocal comments-=:// comments+=f://
au FileType vim setlocal formatoptions-=cro





"-------------------------------------------------------------------------------
" Airline Theme
"-------------------------------------------------------------------------------
if WINDOWS()
    set guifont=Inconsolata-g\ for\ Powerline
else
    set guifont=Monaco\ for\ Powerline
endif

let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#loclist#enabled = 1
let g:airline_powerline_fonts = 1

"-------------------------------------------------------------------------------
" YouCompleteMe settings
"-------------------------------------------------------------------------------
" OSX clang support
" ./install.py --system-libclang --clang-completer

" debug output
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
"let g:ycm_server_use_vim_stdout = 1
" let g:ycm_show_diagnostics_ui = 1

"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

" let g:ycm_key_list_select_completion = ['<C-Tab>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-Tab>', '<Up>']

"let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
"let g:ycm_key_list_stop_completion = ['<C-y>', '<C-Space>', '<Space>']

" let g:ycm_goto_buffer_command = 'new-tab'

" use ctags files
" let g:ycm_collect_identifiers_from_tags_files = 1

" When set to 1, the OmniSharp server will be automatically started (once per
" Vim session) when you open a C# file.
" let g:ycm_auto_start_csharp_server = 0

" only show popup when hitting (super)tab, this is less intrusive
let g:ycm_auto_trigger = 1

" disable confirmation for loading extra conf
let g:ycm_confirm_extra_conf = 0

" always populate location list
let g:ycm_always_populate_location_list = 1

nnoremap <Leader>ff :YcmCompleter FixIt<CR>
nnoremap <Leader>gt :YcmCompleter GoTo<CR>
" nnoremap <leader>cc :close<CR>

" let g:clang_library_path = "/usr/lib64/"
" let g:clang_complete_copen = 0
" let g:clang_hl_errors = 1
" let g:clang_snippets = 1
" let g:clang_snippets_engine = "ultisnips"
" let g:clang_close_preview = 1
" let g:clang_complete_macros = 1
"
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_use_ultisnips_completer = 1
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]
"
" let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

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
" CTag settings
"-------------------------------------------------------------------------------

" set tags=./tags;/

"-------------------------------------------------------------------------------
" Ctrlp settings
"-------------------------------------------------------------------------------
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'

nnoremap <silent> <leader>p :CtrlPMRU<CR>

if executable("ag")
    let g:ctrlp_use_ag_command = 1
else
    let g:ctrlp_use_ag_command = 0
endif

let g:ctrlp_working_path_mode = 0
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_max_files = 0
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" let g:ctrlp_match_window = 'bottom,order:ttb'
" let g:ctrlp_switch_buffer = 0
"let g:ctrlp_root_markers = ['Makefile', '.git']

if (g:ctrlp_use_ag_command)
    " Use ag over grep
    " set grepprg=ag\ --nogroup\ --nocolor
    set grepprg=ag\ --nogroup\ --nocolor\ --column

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0

    " Allow root ignore plugin to setup ag
    " let g:RootIgnoreAgignore = 1

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s
                \ --files-with-matches
                \ --nocolor
                \ -g ""
                \ --ignore "\.git$\|\.hg$\|\.svn$"
                \ --ignore "\node_modules$"'
else
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$',
                \ 'link': ''
                \ }

    " let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
    let g:ctrlp_user_command = [
                \ '.git',
                \ 'cd %s && git ls-files . --cached --exclude-standard --others'
                \ ]
endif

"-------------------------------------------------------------------------------
" Ctrlp funky settings
"-------------------------------------------------------------------------------
nnoremap <Leader>fu :CtrlPFunky<Cr>
" nnoremap <C-f> :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" nnoremap <C-d> :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" let g:ctrlp_extensions = ['funky']

"-------------------------------------------------------------------------------
" Ack settings
"-------------------------------------------------------------------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" if executable('ag')
"     let &grepprg = 'ag --nogroup --nocolor --column'
" else
"     let &grepprg = 'grep -rn $* *'
" endif
" command! -nargs=1 -bar Grep execute 'silent! grep! <q-args>' | redraw! | copen

cnoreabbrev Ack Ack!
nnoremap <Leader>aa :Ack!<Space>
nnoremap <Leader>a :Ack!<CR>

"-------------------------------------------------------------------------------
" Fzf settings
"-------------------------------------------------------------------------------
" nnoremap <Leader>ss :Ag<CR>

" ----------------------------------------------------------------------------
" matchit.vim
" ----------------------------------------------------------------------------
runtime macros/matchit.vim

" ----------------------------------------------------------------------------
" Splitjoin settings
" ----------------------------------------------------------------------------
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nnoremap gss :SplitjoinSplit<cr>
nnoremap gsj :SplitjoinJoin<cr>

"-------------------------------------------------------------------------------
" EasyAlign settings
"-------------------------------------------------------------------------------

" Start interactive EasyAlign in visual mode
nmap ga <Plug>(EasyAlign)
nmap gaa ga_

" Start interactive EasyAlign with a Vim movement
xmap ga <Plug>(EasyAlign)

xmap <Leader>ga   <Plug>(LiveEasyAlign)

"let g:easy_align_ignore_groups = ['Comment', 'String']
let g:easy_align_ignore_groups = ['String']

" let g:easy_align_delimiters = {
"             \ '>': { 'pattern': '>>\|=>\|>' },
"             \ '\': { 'pattern': '\\' },
"             \ '/': { 'pattern': '//\+\|/\*\|\*/', 'delimiter_align': 'l', 'ignore_groups': ['!Comment'] },
"             \ ']': {
"             \     'pattern':       '\]\zs',
"             \     'left_margin':   0,
"             \     'right_margin':  1,
"             \     'stick_to_left': 0
"             \   },
"             \ ')': {
"             \     'pattern':       ')\zs',
"             \     'left_margin':   0,
"             \     'right_margin':  1,
"             \     'stick_to_left': 0
"             \   },
"             \ 'f': {
"             \     'pattern': ' \(\S\+(\)\@=',
"             \     'left_margin': 0,
"             \     'right_margin': 0
"             \   },
"             \ 'd': {
"             \     'pattern': ' \ze\S\+\s*[;=]',
"             \     'left_margin': 0,
"             \     'right_margin': 0
"             \   }
"             \ }

" nmap <Leader><Leader>a <Plug>(LiveEasyAlign)

" inoremap <silent> => =><Esc>mzvip:EasyAlign/=>/<CR>`z$a<Space>

"-------------------------------------------------------------------------------
" EasyMotion settings
"-------------------------------------------------------------------------------

" Disable default mappings avoid features not used
let g:EasyMotion_do_mapping = 0

" Limit movement to what you can acutally see
let g:EasyMotion_off_screen_search = 0

" Use uppercase target labels and type as a lower case
" let g:EasyMotion_use_upper = 1

 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1

" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

" <Leader>f{char} to move to {char}
map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap <leader>s <Plug>(easymotion-s)
" nmap <leader>s <Plug>(easymotion-overwin-f2)

nmap S <Plug>(easymotion-s)
nmap S <Plug>(easymotion-overwin-f2)

nmap <leader>s <Plug>(easymotion-s)
nmap <leader>s <Plug>(easymotion-overwin-f2)

" Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to begin of word
map  W <Plug>(easymotion-bd-w)
nmap W <Plug>(easymotion-overwin-w)

map  <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)

" Move to end of word
map  E <Plug>(easymotion-bd-w)
nmap E <Plug>(easymotion-overwin-w)

map  <leader>e <Plug>(easymotion-bd-w)
nmap <leader>e <Plug>(easymotion-overwin-w)

" let g:EasyMotion_startofline = 0
" nmap <M-f> <Plug>(easymotion-f)
" nmap <M-F> <Plug>(easymotion-F)
" nmap <M-t> <Plug>(easymotion-t)
" nmap <M-T> <Plug>(easymotion-T)
"
" nmap <M-w> <Plug>(easymotion-w)
" nmap <M-W> <Plug>(easymotion-W)
" nmap <M-b> <Plug>(easymotion-b)
" nmap <M-B> <Plug>(easymotion-B)
" nmap <M-e> <Plug>(easymotion-e)
" nmap <M-E> <Plug>(easymotion-E)
"
" nmap <M-/> <Plug>(easymotion-sn)
" nmap <M-n> <Plug>(easymotion-next)
" nmap <M-N> <Plug>(easymotion-prev)
" JK motions: Line motions
" nmap <M-j> <Plug>(easymotion-j)
" nmap <M-k> <Plug>(easymotion-k)

"-------------------------------------------------------------------------------
" WindowSwap settings
"-------------------------------------------------------------------------------

"prevent default bindings
let g:windowswap_map_keys = 0

nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

"-------------------------------------------------------------------------------
" Tabwins settings
"-------------------------------------------------------------------------------

" Disable 'Tabwins' menu
let g:load_tabwins_menu_is_wanted = 'N'

" Disable command aliases
let  g:tabwins_create_aliases_is_wanted    = 'N'

"-------------------------------------------------------------------------------
" Showmarks settings
"-------------------------------------------------------------------------------
" \mt : Toggles ShowMarks on and off.
" \mh : Hides an individual mark.
" \ma : Hides all marks in the current buffer.
" \mm : Places the next available mark.

"let s:all_marks = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'`^<>[]{}()\""
" let g:showmarks_include="abcdefghijklmnopqrstuvwxyz.[]<>"

"-------------------------------------------------------------------------------
" Autoclose
"-------------------------------------------------------------------------------
" fix issue of autoclose with YCM. See
" https://github.com/Valloric/YouCompleteMe/issues/9
" let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}
" Disable expand space, I don't need it and this would overload <SPACE>
" which conflicts with Vim abbreviation
" let g:AutoCloseExpandSpace = 0

"-------------------------------------------------------------------------------
" Fugitive settings
"-------------------------------------------------------------------------------

" nnoremap <silent> <leader>gs :Gstatus<CR>
" nnoremap <silent> <leader>gd :Gdiff<CR>
" nnoremap <silent> <leader>gc :Gcommit<CR>
" nnoremap <silent> <leader>gb :Gblame<CR>
" nnoremap <silent> <leader>gl :Glog<CR>
" nnoremap <silent> <leader>gp :Git push<CR>
" nnoremap <silent> <leader>gr :Gread<CR>
" nnoremap <silent> <leader>gw :Gwrite<CR>
" nnoremap <silent> <leader>ge :Gedit<CR>
" " Mnemonic _i_nteractive
" nnoremap <silent> <leader>gi :Git add -p %<CR>
" nnoremap <silent> <leader>gg :SignifyToggle<CR>

"-------------------------------------------------------------------------------
" Session settings
"-------------------------------------------------------------------------------
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
if isdirectory(expand("~/.vim/bundle/sessionman.vim/"))
    nmap <leader>sl :SessionList<CR>
    nmap <leader>ss :SessionSave<CR>
    nmap <leader>sc :SessionClose<CR>
endif

"-------------------------------------------------------------------------------
" Tabbar settings
"-------------------------------------------------------------------------------
" nnoremap <silent> <leader>tt :TagbarToggle<CR>
" inoremap <F11> <esc>:TagbarToggle<cr>
" nnoremap <F11> :TagbarToggle<cr>
" let g:tagbar_sort = 0
"
" let g:tagbar_ctags_bin='/usr/bin/ctags'
" let g:tagbar_width=30
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

"-------------------------------------------------------------------------------
" SuperTab settings
"-------------------------------------------------------------------------------
" uncomment the next line to disable superTab
"let loaded_supertab = 1
"set completeopt=menu,longest
"let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
"let g:SuperTabLongestHighlight=1
"let g:SuperTabLongestEnhanced=1

"-------------------------------------------------------------------------------
" TagList settings
"-------------------------------------------------------------------------------
" let Tlist_WinWidth = 40
" let Tlist_Auto_Open = 1
" let Tlist_Exit_OnlyWindow = 1
" let Tlist_Use_Right_Window = 1
" let Tlist_Show_One_File = 1
" let Tlist_Display_Prototype = 0
" let Tlist_Compact_Format = 1

"-------------------------------------------------------------------------------
" Tabularize settings
"-------------------------------------------------------------------------------
" nmap <Leader>a& :Tabularize /&<CR>
" vmap <Leader>a& :Tabularize /&<CR>
" nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
" vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
" nmap <Leader>a=> :Tabularize /=><CR>
" vmap <Leader>a=> :Tabularize /=><CR>
" nmap <Leader>a: :Tabularize /:<CR>
" vmap <Leader>a: :Tabularize /:<CR>
" nmap <Leader>a:: :Tabularize /:\zs<CR>
" vmap <Leader>a:: :Tabularize /:\zs<CR>
" nmap <Leader>a, :Tabularize /,<CR>
" vmap <Leader>a, :Tabularize /,<CR>
" nmap <Leader>a,, :Tabularize /,\zs<CR>
" vmap <Leader>a,, :Tabularize /,\zs<CR>
" nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
"
" nnoremap <leader>a= :Tabularize /=<cr>
" vnoremap <leader>a= :Tabularize /=<cr>
" nnoremap <leader>a: :Tabularize /:\zs<cr>
" vnoremap <leader>a: :Tabularize /:\zs=<cr>
" nnoremap <leader>a& :Tabularize /&<cr>
" vnoremap <leader>a& :Tabularize /&<cr>

"-------------------------------------------------------------------------------
" lldb settings
"-------------------------------------------------------------------------------
" let g:lldb_map_Lbreakpoint = "<f9>"
" let g:lldb_map_Lstep = "<f10>"
" let g:lldb_map_Lnext = "<f11>"
" let g:lldb_map_Lfinish = "<f12>"

"-------------------------------------------------------------------------------
" Clang format settings
"-------------------------------------------------------------------------------
" let g:clang_format#style_options = {}
" let g:clang_format#code_style = 'google'
let g:clang_format#auto_format_on_insert_leave = 1

autocmd FileType c,cpp ClangFormatAutoEnable

"-------------------------------------------------------------------------------
" Doxygen settings
"-------------------------------------------------------------------------------
" let g:DoxygenToolkit_briefTag_pre=""
" let g:DoxygenToolkit_paramTag_pre="@param "
" let g:DoxygenToolkit_returnTag="@return "
" let g:DoxygenToolkit_startCommentTag = "/**"
" let g:DoxygenToolkit_startCommentBlock = "/*"
" "let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
" "let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
" let g:DoxygenToolkit_authorName=""
" "let g:DoxygenToolkit_licenseTag="My own license"
" let g:DoxygenToolkit_interCommentTag = "* "

"-------------------------------------------------------------------------------
" Undo tree settings
"-------------------------------------------------------------------------------
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle=1

noremap <Leader>u :UndotreeToggle<CR>

"-------------------------------------------------------------------------------
" Persistent undo
"-------------------------------------------------------------------------------
if has('persistent_undo')
    set undodir=~/.vim/undo//
    set undofile
    set undolevels=1000
    set undoreload=10000
    set history=1000                 " Increase the undo limit
endif

"-------------------------------------------------------------------------------
" Backup & Swap
"-------------------------------------------------------------------------------
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" set noswapfile                 " Disable swap files
" set nobackup nowritebackup     " Turn off backup files

"-------------------------------------------------------------------------------
" Strip whitespace
"-------------------------------------------------------------------------------
autocmd FileType c,cpp,java,php,javascript,python,xml,perl,sql
            \ autocmd BufWritePre <buffer> call CleanupWhitespace()

function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)

endfunction

function! CleanupWhitespace()
    " convert tab to spaces
    retab
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " strip trailing whitespace
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

"-------------------------------------------------------------------------------
" Hotkey for toggling relative line numbers
"-------------------------------------------------------------------------------
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <leader>r :call NumberToggle()<cr>

"-------------------------------------------------------------------------------
" Helper mappings
"-------------------------------------------------------------------------------

" Force vim navigation
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Windows cut & paste
":inoremap <C-v> <ESC>"+pa
":vnoremap <C-c> "+y
":vnoremap <C-d> "+d

" Insert newline without mode switch
nmap <M-o> o<ESC>
nmap <M-O> O<ESC>

nmap <leader>o o<ESC>
nmap <leader>O O<ESC>

" Close quickfix/location window
nnoremap <leader>c :cclose<bar>lclose<cr>

" Next/Prev location (Error/Warnings list)
" noremap <C-]> :lnext<CR>
" noremap <C-]> :lprev<CR>

noremap <silent> <leader>. :cnext<CR>
noremap <silent> <leader>, :cprev<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

inoremap <C-h> <C-o><C-w>h
inoremap <C-j> <C-o><C-w>j
inoremap <C-k> <C-o><C-w>k
inoremap <C-l> <C-o><C-w>l

" Movement in insert mode
" inoremap <C-h> <C-o>h
" inoremap <C-l> <C-o>a
" inoremap <C-j> <C-o>j
" inoremap <C-k> <C-o>k
" inoremap <C-^> <C-o><C-^>

" Home row ESC
inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>

" Quicker split
nnoremap <silent><C-v> :vsp<CR>
nnoremap <silent><C-s> :sp<CR>
nnoremap <silent><C-c> :hide<CR>

" Opening splits
" nnoremap <leader>v <C-w><C-v><C-w>l
" nnoremap <leader>s <C-w>s

" Adjust viewports to the same size
" map <Leader>= <C-w>=

" Fix visual block mode and vsp conflict
nnoremap <silent><A-v> <C-v>

" Quick blackhole access
noremap <leader>b "_

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Save session
nnoremap <localleader>s :mksession!<CR>

" Edit vimrc/zshrc and load vimrc bindings
nnoremap <localleader>ev :edit $MYVIMRC<CR>
nnoremap <localleader>ez :edit ~/.zshrc<CR>
nnoremap <localleader>sv :source $MYVIMRC<CR>

" Fix ^M file endings
nnoremap <localleader>ff :%s/\r//g<CR>:w<CR>

" Allow repeat on all selected lines
vnoremap . :normal .<CR>

" Convert word to uppercase
inoremap <C-U> <Esc>viwUea

" Todo/Fixme list
command Todo :Ack! TODO\|FIXME
nnoremap <leader>tt :Todo<CR>

" Allow saving of files with sudo
cmap w!! w !sudo tee > /dev/null %
" cmap w!! w !sudo tee % >/dev/null

" Yank from the cursor to the end of the line
nnoremap Y y$

" repeat last command but prefix with !
nnoremap !: q:kI!<esc><cr>

" Swap command and next
" nnoremap ; :
" nnoremap : ;

" Save
" inoremap <C-s>     <C-O>:update<cr>
" nnoremap <C-s>     :update<cr>
" nnoremap <leader>s :update<cr>
" nnoremap <leader>w :update<cr>

" Quit
" inoremap <C-Q>     <esc>:q<cr>
" nnoremap <C-Q>     :q<cr>
" vnoremap <C-Q>     <esc>
" nnoremap <Leader>q :q<cr>
" nnoremap <Leader>Q :qa!<cr>

" Edit
" cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
" map <leader>ew :e %%
" map <leader>es :sp %%
" map <leader>ev :vsp %%
" map <leader>et :tabe %%

" qq to record, Q to replay
" nnoremap Q @q

" Wrapped lines goes down/up to next row, rather than next line in file.
" noremap j gj
" noremap k gk

" Find merge conflict markers
" map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Shortcuts
" Change Working Directory to that of the current file
" cmap cwd lcd %:p:h
" cmap cd. lcd %:p:h

" Visual shifting (does not exit Visual mode)
" vnoremap < <gv
" vnoremap > >gv

" Cleanup whitespace
nnoremap <silent><leader>fw :call CleanupWhitespace()<cr>

"-------------------------------------------------------------------------------
" Ale settings
"-------------------------------------------------------------------------------
" let g:ale_linters = {
" \   'javascript': ['jshint'],
" \   'c++': ['clang'],
" \   'c': ['clang']
" \}

let g:ale_linters = {
            \ 'java': [],
            \ 'c': [],
            \ 'c++': [],
            \ 'javascript': ['jshint']
            \ }

let g:ale_fixers = {
            \ 'java': [],
            \ 'c': [],
            \ 'c++': [],
            \ 'javascript': ['jshint']
            \ }

let g:ale_lint_delay = 1000

" Write this in your vimrc file
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1

" Show errors and warnings in status bar
let g:airline#extensions#ale#enabled = 1

" Move between linting errors
nmap <silent> <leader>, <Plug>(ale_previous_wrap)
nmap <silent> <leader>. <Plug>(ale_next_wrap)

if OSX()
    let g:move_map_keys = 0
    vmap ∆ <Plug>MoveBlockDown
    vmap ˚ <Plug>MoveBlockUp
    nmap ∆ <Plug>MoveLineDown
    nmap ˚ <Plug>MoveLineUp

    " nmap ø o<ESC>
    " nmap Ø O<ESC>

    nnoremap <silent>√ <C-v>
endif

"-------------------------------------------------------------------------------
" Buffer selection
"-------------------------------------------------------------------------------
nnoremap <leader>n :bnext<CR>
nnoremap <leader>b :bprevious<CR>

"nmap <leader>n :bnext<CR>
"nmap <leader>b :bprevious<CR>

nnoremap <leader><leader>n :tabn<CR>
nnoremap <leader><leader>b :tabp<CR>

" ----------------------------------------------------------------------------
" SaveMacro / LoadMacro
" ----------------------------------------------------------------------------
function! s:save_macro(name, file)
    let content = eval('@'.a:name)
    if !empty(content)
        call writefile(split(content, "\n"), a:file)
        echom len(content) . " bytes save to ". a:file
    endif
endfunction
command! -nargs=* SaveMacro call <SID>save_macro(<f-args>)

function! s:load_macro(file, name)
    let data = join(readfile(a:file), "\n")
    call setreg(a:name, data, 'c')
    echom "Macro loaded to @". a:name
endfunction
command! -nargs=* LoadMacro call <SID>load_macro(<f-args>)


"-------------------------------------------------------------------------------
" Setup build shortcuts
"-------------------------------------------------------------------------------

if WINDOWS()
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

"-------------------------------------------------------------------------------
" Nerdtree settings
"-------------------------------------------------------------------------------
map <F3> :NERDTreeToggle<CR>

" map <C-e> <plug>NERDTreeTabsToggle<CR>
" map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
"
" let NERDTreeShowBookmarks=1
" let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
" let NERDTreeChDirMode=0
" let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
" let NERDTreeShowHidden=1
" let NERDTreeKeepTreeInNewTab=1
" let g:nerdtree_tabs_open_on_gui_startup=0

" ----------------------------------------------------------------------------
" vim-commentary settings
" ----------------------------------------------------------------------------
" map  gc  <Plug>Commentary
" nmap gcc <Plug>CommentaryLine

" ----------------------------------------------------------------------------
" Nerdcommenter settings
" ----------------------------------------------------------------------------
" let g:NERDSpaceDelims = 1
" let g:NERDCompactSexyComs = 1
" let g:NERDCustomDelimiters = { 'c++': { 'left': '/**','right': '*/' }, 'c': { 'left': '/**','right': '*/' } }
" let g:NERDCommentEmptyLines = 1
" let g:NERDTrimTrailingWhitespace = 1

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
" Switch between .h and .c
map <F5> :call CurtineIncSw()<CR>

" Goto definition with F12
map <F12> <C-]>
" In diff mode we use the spell check keys for merging
" if &diff
"   ” diff settings
"   map <M-Down> ]c
"   map <M-Up> [c
"   map <M-Left> do
"   map <M-Right> dp
"   map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
" else
"   " Spell settings
"   " Set the spellfile - folders must exist
" "  set spellfile=$HOME/vimfiles/spellfile.add
" "  map <M-Down> ]s
" "  map <M-Up> [s
" endif




" map F3 and SHIFT-F3 to toggle spell checking
" nmap <F3> :setlocal spell spelllang=de,en<CR>:syntax spell toplevel<CR>
" imap <F3> <ESC>:setlocal spell spelllang=en,de<CR>i:syntax spell toplevel<CR>
" nmap <S-F3> :setlocal nospell<CR>
" imap <S-F3> <ESC>:setlocal nospell<CR>i
" " switch between header/source with F4 in C/C++ using a.vim
" nmap <F4> :A<CR>
" imap <F4> <ESC>:A<CR>i
" " currently S-F4 does not work in KDE konsole. Don't know why.
" nmap <S-F4> :AV<CR>
" imap <S-F4> <ESC>:AV<CR>i
" " recreate tags file with F5
" map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" function! Build()
"     if &modified == 1
"         " save current changed buffer
"         normal :w<CR>
"     endif
"     "execute "make clean"
"     execute "make all"
" endfunction
"
" "nnoremap <F7> :silent :wa<cr>:make<cr>
" nnoremap <F7> :call Build()<CR>
" " build using makeprg with <F7>
" "nmap <F7> :w<CR>:make<CR>
" nmap <F7> :call Build()<CR>
" imap <F7> <ESC>:w<CR>:make<CR>
" " clean build using makeprg with <S-F7>
" map <S-F7> :make clean all<CR>
" " Simple hexify/unhexify
" noremap <F8> :call <sid>Hexify()<CR>
" " Apply YCM FixIt
" map <F9> :YcmCompleter FixIt<CR>
" " remove trailing spaces
" map <F10> :%s/\s\+$//<CR>
" " run kdbg
" nmap <leader>d :call ExecuteKDbg()<CR>
" nmap <leader>x :call RunTarget()<CR>
" " goto definition with F12
" map <F12> <C-]>
" " open definition in new split
" "map <S-F12> <C-W> <C-]>
" map <S-F12> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" " prefer vertical diff
" set diffopt+=vertical
" " in diff mode we use the spell check keys for merging
" nnoremap <expr> <M-Down>  &diff ? ']c' : &spell ? ']s' : ':cn<cr>'
" nnoremap <expr> <M-Up>    &diff ? '[c' : &spell ? '[s' : ':cp<cr>'
" nnoremap <expr> <M-Left>  &diff ? 'do' : ':bp<cr>'
" nnoremap <expr> <M-Right> &diff ? 'dp' : ':bn<cr>'
" " spell settings
" "  :setlocal spell spelllang=en
" " set the spellfile - folders must exist
" " global wordlist, press zg to add a word to the list
" set spellfile=~/.vim/spellfile.add
" " project specific ignore list, press 2zg to add a word to this ignore list
" set spellfile+=ignore.utf-8.add





" Misc junk

" function! EscapeText(text)
"
"     let l:escaped_text = a:text
"
"     " Map characters to named C backslash escapes. Normally, single-quoted
"     " strings don't require double-backslashing, but these are necessary
"     " to make the substitute() call below work properly.
"     "
"     let l:charmap = {
"                 \   '"'     : '\\"',
"                 \   "'"     : '\\''',
"                 \   "\n"    : '\\n',
"                 \   "\r"    : '\\r',
"                 \   "\b"    : '\\b',
"                 \   "\t"    : '\\t',
"                 \   "\x07"  : '\\a',
"                 \   "\x0B"  : '\\v',
"                 \   "\f"    : '\\f',
"                 \   }
"
"     " Escape any existing backslashes in the text first, before
"     " generating new ones. (Vim dictionaries iterate in arbitrary order,
"     " so this step can't be combined with the items() loop below.)
"     "
"     let l:escaped_text = substitute(l:escaped_text, "\\", '\\\', 'g')
"
"     " Replace actual returns, newlines, tabs, etc., with their escaped
"     " representations.
"     "
"     for [original, escaped] in items(charmap)
"         let l:escaped_text = substitute(l:escaped_text, original, escaped, 'g')
"     endfor
"
"     " Replace any other character that isn't a letter, number,
"     " punctuation, or space with a 3-digit octal escape sequence. (Octal
"     " is used instead of hex, since octal escapes terminate after 3
"     " digits. C allows hex escapes of any length, so it's possible for
"     " them to run up against subsequent characters that might be valid
"     " hex digits.)
"     "
"     let l:escaped_text = substitute(l:escaped_text,
"                 \   '\([^[:alnum:][:punct:] ]\)',
"                 \   '\="\\o" . printf("%03o",char2nr(submatch(1)))',
"                 \   'g')
"
"     return l:escaped_text
"
" endfunction
"
"
" function! PasteEscapedRegister(where)
"
"     " Remember current register name, contents, and type,
"     " so they can be restored once we're done.
"     "
"     let l:save_reg_name     = v:register
"     let l:save_reg_contents = getreg(l:save_reg_name, 1)
"     let l:save_reg_type     = getregtype(l:save_reg_name)
"
"     echo "register: [" . l:save_reg_name . "] type: [" . l:save_reg_type . "]"
"
"     " Replace the contents of the register with the escaped text, and set the
"     " type to characterwise (so pasting into an existing double-quoted string,
"     " for example, will work as expected).
"     "
"     call setreg(l:save_reg_name, EscapeText(getreg(l:save_reg_name)), "c")
"
"     " Build the appropriate normal-mode paste command.
"     "
"     let l:cmd = 'normal "' . l:save_reg_name . (a:where == "before" ? "P" : "p")
"
"     " Insert the escaped register contents.
"     "
"     exec l:cmd
"
"     " Restore the register to its original value and type.
"     "
"     call setreg(l:save_reg_name, l:save_reg_contents, l:save_reg_type)
"
" endfunction
" " Define keymaps to paste escaped text before or after the cursor.
" "
" nmap <Leader>P :call PasteEscapedRegister("before")<cr>
" nmap <Leader>p :call PasteEscapedRegister("after")<cr>




" NeoBundle 'Shougo/vimproc.vim', {
"             \ 'build' : {
"             \     'windows' : 'tools\\update-dll-mingw',
"             \     'cygwin' : 'make -f make_cygwin.mak',
"             \     'mac' : 'make -f make_mac.mak',
"             \     'linux' : 'make',
"             \     'unix' : 'gmake',
"             \    },
"             \ }
"
"
" Plug 'christoomey/vim-run-interactive'
" Plug 'janko-m/vim-test'
" Plug 'justinmk/vim-gtfo'
" Plug 'mhinz/vim-signify'
"
" Plug 'junegunn/vim-online-thesaurus'
" Plug 'sgur/vim-editorconfig'
"
" Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
" autocmd! User indentLine doautocmd indentLine Syntax



