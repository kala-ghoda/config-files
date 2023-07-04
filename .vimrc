filetype on
filetype plugin on
filetype indent on
syntax on

" Set vim configurations
set cursorline
set cursorcolumn
set laststatus=2
set backspace=eol,indent,start
set ruler
set number
set relativenumber
set shiftwidth=4
set tabstop=4
set noexpandtab
set smarttab
set noswapfile
set nobackup
set smartindent
set smartcase
set incsearch
set showcmd
set showmode
set showmatch
set hlsearch
set t_Co=256
set background=dark
set mat=2
set autoindent
set smartindent
set updatetime=100
colorscheme eldar

hi LineNr ctermbg=16 guibg=#000000
hi Normal ctermbg=16 guibg=#000000

set history=1000
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.o

augroup NrHighlight
  autocmd!
  autocmd WinEnter * hi LineNr ctermfg=247 guifg=#9e9e9e ctermbg=233 guibg=#121212
  autocmd WinLeave * hi LineNr ctermfg=274 guifg=#e9e9e9 ctermbg=133 guibg=#212121
augroup END

call plug#begin('~/.vim/plugged')

 Plug 'tpope/vim-surround'
 Plug 'airblade/vim-gitgutter'
" Plug 'preservim/nerdtree'
" Plug 'dense-analysis/ale'
" Plug 'tpope/vim-fugitive'
 Plug 'Valloric/YouCompleteMe'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
" Plug 'airblade/vim-rooter'
" Plug 'vim-scripts/AutoComplPop'

call plug#end()


" Mappings code goes here.

nnoremap <C-p> :Files<CR>
nnoremap - <C-W>-
nnoremap + <C-W>+
nnoremap <F7> <C-W><
nnoremap <F9> <C-W>>
" Mapping for moving between windows
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-j> <C-W>j
map <C-k> <C-W>k


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

"au VimEnter * NERDTree

" More Vimscripts code goes here.

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.
function! GitBranch()
	  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	  let l:branchname = GitBranch()
	    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#Pmenusel#
set statusline+=%{StatuslineGit()}
set statusline+=%#TabLine#
set statusline+=\ %f
set statusline+=\%M
set statusline+=%=
set statusline+=\%#Constant#
set statusline+=\ %y\ 
set statusline+=\%#Spellbad#
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}\ 
set statusline+=\%#Identifier#
set statusline+=\ [%{&fileformat}\]\ 
set statusline+=\%#StatusLineTerm#
set statusline+=\ %p%%\ \|
set statusline+=\ %l:%c\ 
set statusline+=\%#vimCommentString#
set statusline+=\ Buffer:\ %n\ 
set statusline+=\%#Search#
set statusline+=%{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" }}}
