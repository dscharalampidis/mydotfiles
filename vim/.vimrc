" ~/.vimrc
"
" This configuration was tested with Vim 8.0 and above.

" vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin()
Plug 'mattn/emmet-vim'
Plug '42Paris/42header'
Plug 'tpope/vim-commentary'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug '907th/vim-auto-save'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'dscharalampidis/vim-default-gentoo'
call plug#end()

" Settings for the 42header plugin
let g:user42 = 'dcharala'
let g:mail42 = 'dcharala@student.42heilbronn.de'

" Settings for the markdown-preview plugin
let g:mkdp_theme = 'dark'

" Settings for the vim-auto-save plugin
let g:auto_save = 0
augroup ft_markdown
	au!
	au FileType markdown let b:auto_save = 1
	au FileType html let b:auto_save = 1
	au FileType css let b:auto_save = 1
augroup END

" Key mapping
let g:user_emmet_leader_key=','

" Impove syntax highlighting for JS frameworks
au BufRead,BufNewFile *.ejs setf javascript.jsx

" Configuration
colo default-gentoo								" Enable the default gentoo  colour scheme
set t_RV=										" Ignore termresponse for 16 colours to work
set t_Co=16										" Replicate the linux console (16 colours)
syntax on										" Enable syntax highlighting
set number										" Show line numbers
set relativenumber								" Show line nubmers relative to the cursor line
set ruler										" Show the line and column number of the cursor
set linebreak									" Break lines at word
set showbreak=↳									" Wrap-broken line prefix
set textwidth=80								" Line wraps at 80 characters
set showmatch									" Highlight matching brace
set noerrorbells visualbell t_vb=				" No audio or visual bell
set hlsearch									" Highlight all search results
set smartcase									" Enable smart-case search
set ignorecase									" Always case-insensitive
set incsearch									" Search for strings incrementally
set shiftwidth=4								" Number of auto-indent spaces
set autoindent									" Auto-indent new lines
set copyindent									" Copy the structure of existing lines' indent
set preserveindent								" Preserve the indent structure
autocmd BufRead *.c setlocal cindent			" Use 'C' style program indenting for C files
autocmd BufRead *.c setlocal formatoptions+=t	" Line wrapping for non-comments in C files
set smarttab									" Enable smart-tabs
set softtabstop=0								" Set to zero for tabstop to work properly
set tabstop=4									" Set the tab to be equal to 4 spaces
set noexpandtab									" Use the right number of spaces to insert a tab
set list listchars=tab:\→\ ,trail:·				" Assign visible characters to non-visible ones
set undolevels=1000								" Number of undo levels
set backspace=indent,eol,start					" Backspace behaviour
