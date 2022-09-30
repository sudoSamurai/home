"
"       ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"       ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"       ██║   ██║██║██╔████╔██║██████╔╝██║
"       ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"     ██╗╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"     ╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

" GENERAL SETTINGS
set nocompatible                " turn off Vi compatibility mode. This setting must be first
syntax on                       " enable syntax highlighting
filetype indent plugin on       " enable filetype detection, indents, and plugins specific to the filetype
set shell=/bin/bash             " set shell to bash
set backspace=indent,eol,start  " allow backspacing over autoindent, line breaks and start
set t_Co=256                    " enable 256-color mode
set autoread                    " auto reads when file is changed from the outside
set hidden                      " hide buffers that are not in use
set wildmenu                    " shows a visual menu for tab completions
set wildmode=longest,list,full  " tap completion behavior
set wildignore=*.o,*~,*.pyc     " ignore compiled files
set showcmd                     " show partial commands in last line
set confirm                     " dialogue box asking to save changed files
set visualbell                  " use visual bell instead of beeping
set t_vb=                       " reset terminal code to work with visualbell
set showmatch                   " show matching brackets/parenthesis
set lazyredraw                  " don't redraw when running macros.  Helps performance
set iskeyword-=_                " Makes the _ character a word separator (for stuff like cw, dw, etc)
set cursorline                  " Highlights the current line
set modelines=1                 " enables modelines which lets the final line of a file pass vim options
set noswapfile                  " turns off swapfiles
set encoding=utf8               " Duh
colorscheme kolor

" BACKUPS
" This chunk will make backups in the /tmp directory instead of the working dir
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" FOLDING
let g:ctrlp_working_path_mode = 0
set foldenable                  " Turns on folding
set foldlevelstart=10           " open most folds by default
set foldnestmax=10              " 10 nested fold max
set foldmethod=indent           " fold based on indent level

" SEARCHING
set hlsearch                    " highlight searches
set incsearch                   " search as you type
set ignorecase                  " ignore case when searching
set smartcase                   " except when using capital letters
:nnoremap <CR> :nohlsearch<cr>  " clear search buffer after hitting return
set magic                       " changes special characters that can be used in regex patterns

" INDENTATION
set shiftwidth=2                " use two spaces for each step of auto-indent
set softtabstop=2               " use two spaces for <tab>
set expandtab                   " use spaces instead of tabs
set smarttab                    " use tabs only at the beginning of line
set autoindent                  " copy indent from current line when starting new line
set smartindent                 " smart indent
nnoremap , mzgg=G`z             " comma to auto-indent the whole file

" APPEARANCE
" set ruler                     " show cursor position
" set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
set background=dark             " dark background
set showtabline=2               " always show the line containing tabs
" set cmdheight=2                 " set command window to 2 lines
set number                      " show line numbers
set laststatus=2                " windows will always have a status line
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
set cmdheight=1                 " Makes command line 1 line high, useful with vim-airline & nosmd
set nosmd                       " turns off showing the mode in the command line - useful with vim-airline

exec "set listchars=tab:\uBB\uBB,nbsp:~,trail:\uB7"
set list
" set termguicolors

" Highlights the 81st column
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
let g:rehash256 = 1

set relativenumber              " use relative line numbers
" Display absolute numbers in insert mode
autocmd InsertEnter * :set norelativenumber
" Display relative numbers when we leave insert mode
autocmd InsertLeave * :set relativenumber

" MISC KEYBINDINGS

" set leader key to spacebar
let mapleader=" "
" kj mapped to escape
inoremap kj <Esc>
" up and down arrows move current line up and down
nnoremap <Down> :m+<CR>==
nnoremap <Up> :m-2<CR>==
" left and right arrows indent/unindent current line
nnoremap <Left> <<_
nnoremap <Right> >>_
vnoremap <Left> <gv
vnoremap <Right> >gv
" leader h and l move back and forth between buffers.
noremap <Leader>h :bp<CR>
noremap <Leader>l :bn<CR>
" leader k opens a new buffer
noremap <Leader>k :enew <BAR> :NERDTreeFocus<CR>
" leader j closes current buffer
noremap <Leader>j :bp <BAR> bd #<CR>
" shift ; is too much work. ; is useless.  mapping ; to : makes commands faster
nnoremap ; :

" window creation
nnoremap <silent> <Leader>- <c-w>s<CR>
nnoremap <silent> <Leader><Bar> <c-w>v<CR>

" window movement - For when not using vim-tmux-navigator
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j

" leader n cycles through line number modes (off, static, relative)
noremap <Leader>n :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
" leader P toggles paste mode
noremap <Leader>P :set paste!<CR>
" Opps, I forgot to use sudo to vim this file
cmap w!! w !sudo tee > /dev/null %

" Remove ^M from Windows formatted files
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" FILETYPE SETTINGS
"au BufRead,BufNewFile */playbooks/*.yml set filetype=ansible
"au BufRead,BufNewFile */roles/*/*.yml set filetype=ansible
"au BufRead,BufNewFile main.yml set filetype=ansible
"au BufRead,BufNewFile */ansible/*.yml set filetype=ansible

" Netrw stuff
" Starts in netrw mode if no file is specified on the command line
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Explore | endif
" Kills if netrw is the last thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:Explore") && b:Explore.isTabTree()) | q | endif
" Sets netrw to wide (detailed) view
let g:netrw_liststyle = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
nnoremap <Leader><CR> :Vexplore<CR>


" AUTOCMDs
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

function! HLNext (blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#\%('.@/.'\)'
  let blinks=3
  highlight WhiteOnGreen ctermfg=white ctermbg=green
  for n in range(1,blinks)
    let green = matchadd('WhiteOnGreen', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime / (2*blinks) * 1000) . 'm'
    call matchdelete(green)
    redraw
    exec 'sleep ' . float2nr(a:blinktime / (2*blinks) * 1000) . 'm'
  endfor
endfunction

nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>

match ErrorMsg '\%>120v.\+'
match ErrorMsg '\s\+$'

" Statusline
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\
