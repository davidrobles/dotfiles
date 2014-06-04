execute pathogen#infect()

set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Easy Expansion of the Active File Directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Change directory to the dir of cur file
nnoremap ,cd :cd %:p:h<CR>

autocmd InsertEnter,InsertLeave * set cul!

" Open every buffer in its own tabpage
" au BufAdd,BufNewFile * nested tab sball

" ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Search and highlight but do not jump
" NOTE it adds a jump in the jump list
nnoremap * *``

" Disable the beep
set vb

" Move tabs to left and right
nnoremap <Leader>z :tabmove -1<cr>
nnoremap <Leader>x :tabmove +1<cr>

" Number of pixel lines inserted between characters
set linespace=3

" Show line numbers
set number

" Change leader to an easy to hit comma
let mapleader=","

" Large command history
set history=10000

" Enables a menu at the bottom of the vim/gvim window
set wildmenu
set wildmode=full

" Insert space characters whenever the tab key is pressed
set expandtab

" Number of space characters that will be inserted when the tab key is pressed
set tabstop=4

" Number of space characters inserted for indentation
set shiftwidth=4

" Number of spaces that a <Tab> counts for while performing editing operations
set softtabstop=4

" Copy indent from current line when starting a new line
set autoindent

" Always display the status line
set laststatus=2

" Briefly jump to the matching brace when you insert one
set showmatch

" Move the cursor to the matched string, while typing the search pattern
set incsearch

" Highlight all search matches
set hlsearch

" Show (partial) command in the last line of the screen
set showcmd

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Close buffer but not splitted window
nmap ,d :b#<bar>bd#<CR> 

if has("autocmd")
  filetype on
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4
  autocmd FileType html setlocal ts=4 sts=4 sw=4
  autocmd FileType python setlocal ts=4 sts=4 sw=4
endif

" Clear the search buffer when hitting return
function! MapCR()
    nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" Minimal number of columns to use for the line number
set numberwidth=5

" Highlight current line
set cursorline
set showtabline=2

" Buffer switching
map <Leader>w :bnext<Return>
map <Leader>q :bprev<Return>

" Tab switching
map <Leader>s :tabnext<Return>
map <Leader>a :tabprevious<Return>

" Changes to the directory of the current file and runs it
map <Leader>r :make <Return>

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Status line
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" Macvim
if has('gui_running')
    colorscheme solarized
    set background=dark
    set guioptions-=T " Remove the toolbar in macvim
" Terminal
else
    set background=dark
    colorscheme solarized
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Easy access to edit vimrc 
" nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>

" Run make on the current file
autocmd FileType python set makeprg=python\ %
autocmd FileType ruby set makeprg=/Users/drobles/.rvm/bin/ruby\ %

" Change the cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Automatically Execute ctags Each Time a File is Saved
" :autocmd BufWritePost * call system("/usr/local/bin/ctags -R")

" map ,q magqap`a
" set textwidth=100

" bind K to grep word under cursor
" noremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

