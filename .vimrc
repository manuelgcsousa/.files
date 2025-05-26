"" .vimrc

" {{ OPTIONS }}
syntax on             " enables syntax highlighting
set mouse=a           " enables mouse support in all modes
set encoding=utf8     " sets the file encoding to UTF-8
set ffs=unix,dos,mac  " file formats
set hidden            " switch between unsaved buffers
set number            " shows line numbers
set relativenumber    " shows relative line numbers
set backspace=2       " 2 space backspace
set expandtab         " converts tabs to spaces
set tabstop=4         " <Tab> = 4 spaces
set softtabstop=4     " <Tab> (in insert mode) = 4 spaces
set shiftwidth=4      " number of spaces in auto-indents
set scrolloff=10      " keeps 10 lines visible above and below the cursor
set incsearch         " highlights match while searching
set hlsearch          " highlights all matches for previous searches
set splitright        " opens new vertical splits to the right
set splitbelow        " opens new horizontal splits below
set ruler             " displays the cursor position and status at the bottom
set wildmenu          " provides a graphical interface for the command-line
set laststatus=2      " always show status line
set noswapfile        " disable swap file
set noerrorbells      " disable error bells


" {{ FILETYPES }}
autocmd FileType lua         setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType sh          setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType html        setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType javascript  setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType typescript  setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType json        setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType nix         setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType sql         setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType terraform   setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType go          setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType makefile    setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4


" {{ MAPPINGS }}
let mapleader = ","

" quick save // force buffer quit // jump to previous buffer
nnoremap <Leader>w :w<CR><Space><Left>
nnoremap <Leader>Q :bdelete!<CR>
nnoremap <Leader>b :b#<CR>

" clear search highlights
nnoremap <Leader>c :noh<CR>

" shift (left | right) without leaving visual mode
vnoremap < <gv
vnoremap > >gv

" print absolute path of current file
nnoremap <Leader>fp :echo expand('%:p')<CR>

" open netrw
nnoremap <C-e> :Lexplore<CR>
