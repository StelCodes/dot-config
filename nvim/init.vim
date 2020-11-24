"set runtaimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

call plug#begin('~/.config/nvim/plugged')
Plug 'stelcodes/hydrangea-vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'scrooloose/syntastic'
Plug '907th/vim-auto-save'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'kovisoft/paredit'
"Plug 'venantius/vim-eastwood', { 'for': 'clojure' }
Plug 'clojure-vim/vim-jack-in'
Plug 'Olical/conjure', {'tag': 'v4.7.0'}
Plug 'dag/vim-fish'
call plug#end()

tnoremap <Esc> <C-\><C-n>
set undofile
let g:auto_save = 1  " enable AutoSave on Vim startup
"========================================================================================
"see https://github.com/ChristianChiarulli/nvim
set iskeyword+=-                      	" treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set whichwrap+=<,>,[,],h,l
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set updatetime=300                      " Faster completion
set timeoutlen=100                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
set incsearch

" " New stuff
set notimeout nottimeout
" set scrolloff=1
" set sidescroll=1
" set sidescrolloff=1
" set display+=lastline
" set backspace=eol,start,indent
" set nostartofline
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set mmp=1300
" set autochdir                           " Your working directory will always be the same as your working directory
" set foldcolumn=2                        " Folding abilities

" au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o 

" Random Useful Functions

" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" Mappings

let mapleader=" "
let maplocalleader=" "
nnoremap <Space> <Nop>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Better window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
" Custom better tab navigation
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

" Better window navigation
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
" Custom better tab navigation
tnoremap <C-h> <C-\><C-n>:tabprevious<CR>
tnoremap <C-l> <C-\><C-n>:tabnext<CR>

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Use alt + hjkl to resize windows
nnoremap <leader>n    :resize -6<CR>
nnoremap <leader>m    :resize +6<CR>

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
" <TAB>: completion.
inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"========================================================================================

set noshowmode "lightline
let g:lightline = {
      \ 'colorscheme': 'hydrangea',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineFugitive'
      \ },
      \ 'separator':    { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }
function! LightlineFugitive()
    if exists('*FugitiveHead')
	let branch = FugitiveHead()
	return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction
map <C-n> :NERDTreeToggle<CR>
colorscheme hydrangea
set splitbelow
nnoremap <C-w> :q<CR>
nnoremap <C-q> :qa<CR>
nnoremap <C-t> :tabnew<CR>:terminal<CR>
nnoremap <C-s> :source %<CR>
set linebreak
nnoremap <CR> G
" this makes it so vim will update a buffer if it has changed
" on the filesystem when a FocusGained or BufEnter event happens
set autoread
au FocusGained,BufEnter * :checktime
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s "change comment style for commentary.vim
nnoremap <leader>/ :let @/=""<CR>
let g:paredit_smartjump=1
