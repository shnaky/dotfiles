"----Plugin Settings----

" ale
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\}


let g:ale_fix_on_save=1
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '⚠️'
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" arguments to the commandline for the flake8 linter. Here ignore error E501 (line too long error)
let g:ale_python_flake8_options = '--ignore=E501'

" youcompleteme
" python semantic completion
" let g:ycm_python_interpreter_path = '/bin/python'
" let g:ycm_python_sys_path = []
" let g:ycm_extra_conf_vim_data = [
"   \  'g:ycm_python_interpreter_path',
"   \  'g:ycm_python_sys_path'
"   \]
" " ycm global config file (hidden file)
" let g:ycm_global_ycm_extra_conf = '~/.global_extra_conf.py'
" set completeopt-=preview

" coc
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-@> coc#refresh()


" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'
let g:airline_stl_path_style = 'short'
let g:airline_section_c_only_filename = 1

" nerdtree
" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']


" fzf
let g:fzf_preview_window = ['right:40%:hidden', 'ctrl-/']


" goyo
let g:goyo_width = 120

"----Plugin Manager (vim-plug)----


call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
" Plug 'ycm-core/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-signify'
Plug 'Yggdroot/indentLine'

" fzf (need to be installed)
Plug '/bin/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()


" ----General Options----

set nocompatible			    " disable compatibility with vi
set encoding=utf-8              " set encoding to utf-8 (default was 'latin1')
set fileformat=unix             " end-of-line format: "dos", "unix" or "mac"
set t_Co=256                    " color palette
set clipboard=unnamedplus 	    " sets default clipboard to the system clipboard (needs gvim)
syntax on					    " set syntax on
filetype plugin indent on	    " enable type file detection
set updatetime=300              " quicker updatetime for better experience

set hidden			            " don't unload a buffer when no longer shown in a window
set wildmenu		            " better command-line completion
set wildmode=list:longest       " specifies how command line completion works
set showcmd			            " show partial commands in the last line of the screen
set laststatus=2                " always show status bar
set lazyredraw	                " don't redraw while executing macros
set autoread                    " autoread a file when it was modified outside of Vim
set cmdheight=2                 " number of lines used for the command-line
set history=200                 " how many command lines are remembered
set backspace=indent,eol,start  " make backspaces more powerfull
set ttyfast                     " fast terminal connection for smoothness

" ----Appearance----

" setting up dark gruvbox colorscheme
set background=dark
colorscheme gruvbox

" take the opacity of the terminal
hi Normal guibg=NONE ctermbg=NONE

" make Vertical line in the middle transparent
hi clear VertSplit

" make the SignColumn to the left trasnparenth
hi clear SignColumn

hi clear SpellBad

" ----Usability Options----


set number			" display number of line
set relativenumber	" show the relative line number for each line
set ruler			" display cursor position
set wrap			" wrap lines so everthing fits on terminal
set linebreak		" words won't get cut in the middle (softwraps)
set mouse=a			" enable mouse support
set scrolloff=8     " number of screen lines to show around the cursor
set cursorline      " highlight the screen line of the cursor
set signcolumn=auto " whether to show the signcolumn (set to 'auto' or 'yes)
" set colorcolumn=80  " column 80 highlighted (for python PEP8)

" ----Search Options----


set incsearch		" show search result while typing
set nohlsearch		" remove highlight after search
set ignorecase		" ignore capital letters during search
set smartcase		" override ignorecase if searching for capital letters


" ----Tab and indent settings----
" useful for python formatting


set tabstop=4		" number of spaces a <Tab> in the text stands for
set shiftwidth=4	" number of spaces used for each step of (auto)indent
set expandtab		" convert <Tab> key-presses to spaces
set softtabstop=4	" backspace after pressing <Tab> will remove <x> spaces

set autoindent		" copy indent from current line when starting new line
set smartindent		" even better autoindent (e.g. add indent after '{')

" ----Back up settings----


set nobackup        "keep a backup after overwriting a file
set nowb            "don't write a backup file before overwriting a file
set noswapfile      "don't use a swap file for this buffer


" ----Split screen options----


set splitright      " split to the right when using :vsplit
set splitbelow      " split to the bottom when using :split


" ----Key Mappings----


let mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" easy exit to normal mode
inoremap jk <esc>
inoremap JK <esc>

" move over soft-wrapped lines
noremap j gj
noremap k gk

" don't go into insert mode after adding a line
nnoremap o o<Esc>
nnoremap O O<Esc>

" put d (delete) in black hole register (delete instead of cut)
nnoremap d "_d
vnoremap d "_d

" search files with fzf
noremap <leader>f :Files<cr>

" buffer settings and navigation
nnoremap <Tab> :bnext<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>ba :bufdo bd<cr>
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>

" TODO: fix refactoring
" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>


" navigate split windows easier
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" Quickly edit/reload the .vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>rv :so $MYVIMRC<CR>

" Disable Ex mode
map Q <NOP>

" TODO: set spelling
" Toggle spelling
nmap <silent> <leader>s :set spell!<CR>

" curser to next error by pressing Ctrl-e (using Ale)
nmap <silent> <C-e> <Plug>(ale_next_wrap)

" Toggle nerdtree
nnoremap <F3> :NERDTreeToggle<cr>


" ----Functions----

" Caps Lock settings
" requires <xdotool> for terminal
" disable Caps Lock when you leave Insert Mode

function! Cap_Status()
    let St = systemlist('xset -q | grep "Caps Lock" | awk ''{print $4}''')[0]
    return St
endfunction

function! Capsoff()
    if Cap_Status() == "on"
    call system("xdotool key Caps_Lock")
    redraw
    highlight Cursor guifg=white guibg=black
    endif
endfunction

" TODO: make Cap Status show up correctly in status line
set laststatus=2
set statusline=
set statusline+=\ %f
set statusline+=%=%{\"CL\ \"\.Cap_Status()}


" ----Auto Commands----

" turn caps lock off after leaving Insert mode
autocmd InsertLeave * call Capsoff()

" Display cursorline (NOT cursorcolumn) ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
augroup END

" different <TAB> settings depenting on th file type
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
