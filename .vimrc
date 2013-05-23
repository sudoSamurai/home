set nocompatible "fix enexpected stuff in distro
filetype indent plugin on "enable filetype detection, and indents/plugins that go along with that
syntax on "enable syntax highlighting
set autoread "auto reads when file is changed from the outside
set hidden "hide buffers that are not in use
set wildmenu "better command line completion
set showcmd "show partial commands in last line
set hlsearch "highlight searches
set incsearch "search as you type
set ignorecase "ignore case when searching
set smartcase "except when using capital letters
set backspace=indent,eol,start "allow backspacing over autoindent, line breaks and start
set backspace=2
" set ruler "show cursor position
" set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
set confirm "dialogue box asking to save changed files
set magic "regex magic
set visualbell "use visual bell instead of beeping
set t_vb=
" set mouse=a "enable mouse use in all modes
set cmdheight=2 "set command window to 2 lines
set number "show line numbers
set showmatch "show matching brackets/parenthesis
" " Indentation settings for using 2 spaces instead of tabs.
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set ai "auto indent
set si "smart indent
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType puppet           let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
