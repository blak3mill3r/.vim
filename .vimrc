""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""       BUNDLES       """""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('vim_starting')
   set nocompatible               " Be iMproved
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Generally awesome stuff
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'ervandew/supertab'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'godlygeek/tabular'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-projectionist'


""""""""" Git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/Gist.vim'

""""""""" Colors!
NeoBundle 'altercation/vim-colors-solarized'

""""""""" Front-end web software junk
NeoBundle 'tmhedberg/matchit'
NeoBundle 'groenewege/vim-less'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-markdown'

""""""""" C++
"NeoBundle 'vim-scripts/Cpp11-Syntax-Support'
"NeoBundle 'Rip-Rip/clang_complete'
"NeoBundle 'blak3mill3r/c.vim'     " my mirror in order to have c.vim 6.0 vundle'd
"NeoBundle 'vim-scripts/a.vim'
"NeoBundle 'majutsushi/tagbar'     " display tags of current file ordered by scope

""""""""" Ruby, Rails
NeoBundle 'tpope/vim-rails'

""""""""" Sysadmin
NeoBundle 'rodjek/vim-puppet'

""""""""" Clojure
NeoBundle 'vim-scripts/paredit.vim'
NeoBundle 'tpope/vim-leiningen'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-classpath'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'dgrnbrg/vim-redl'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""" that's it for BUNDLES! """""""""""""""""" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"  ---------------------------------------------------------------------------
"  General 
"  ---------------------------------------------------------------------------

" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %

let mapleader = ","
let g:mapleader = ","
set modelines=0
set history=1000
set undolevels=1000
set nobackup
set nowritebackup
set noswapfile
syntax enable
set autoread
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set grepprg=ack

" this is for omnicomplete pop-up, use j/k instead of (egads) arrow keys
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" fuck chords, use ; for vim commands instead of :
nnoremap ; : 

hi StatusLine ctermfg=Black ctermbg=White

" Change colour of statusline in insert mode
au InsertEnter * hi StatusLine ctermbg=DarkBlue
au InsertLeave * hi StatusLine ctermfg=Black ctermbg=White

" Tabularize
if exists(":Tab")
  nmap <leader>a\| :Tab /\|<CR>
  vmap <leader>a\| :Tab /\|<CR>
  nmap <leader>a= :Tab /=<CR>
  vmap <leader>a= :Tab /=<CR>
  nmap <leader>a: :Tab /:\zs<CR>
  vmap <leader>a: :Tab /:\zs<CR>
end

" completion
let g:SuperTabContextDefaultCompletionType = "<C-X><C-O>"
imap jkl <C-X><C-O>

" Syntastic
let g:syntastic_warning_symbol="ww"


"  ---------------------------------------------------------------------------
"  UI
"  ---------------------------------------------------------------------------

set title
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set relativenumber
set undofile
colorscheme solarized
set background=dark " or light
set t_Co=256
set splitbelow splitright

if has("gui_running")
  set guioptions-=T " no toolbar set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions=aiA 
  set mouse=a
  set guifont=ProggyCleanTT\ 20  "<- Maybe a good idea when using mac
endif


"  ---------------------------------------------------------------------------
"  C / C++
"  ---------------------------------------------------------------------------

" TagList
set tags=./tags;
map <leader>l :TlistToggle <cr>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 60

" use , as leader for c-support .. 
" docs say that just the first should work but it does not
" just the 2nd works ... whatever...
let g:C_MapLeader = ','
let g:maplocalleader = ','

" binding c-support 'styles' to file extensions
let g:C_Styles = { '*.c,*.h' : 'default', '*.cc,*.cpp,*.hh,*.hpp' : 'CPP' }

autocmd BufNewFile,BufRead *.hpp set syntax=cpp11
autocmd BufNewFile,BufRead *.cpp set syntax=cpp11
autocmd BufNewFile,BufRead *.cc set syntax=cpp11

autocmd BufNewFile,BufRead *.hpp set filetype=cpp11
autocmd BufNewFile,BufRead *.cpp set filetype=cpp11
autocmd BufNewFile,BufRead *.cc set filetype=cpp11

autocmd BufNewFile,BufRead *.java set filetype=
autocmd BufNewFile,BufRead *.java set syntax=java



"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set nowrap
set textwidth=79
set formatoptions=n

if exists("+colorcolumn")
  set colorcolumn=80
endif




"  ---------------------------------------------------------------------------
"  Clojure specific
"  ---------------------------------------------------------------------------

"au FileType clojure nnoremap \e :Eval<cr>
"au FileType clojure vnoremap \e :Eval<cr>



"  ---------------------------------------------------------------------------
"  Mappings
"  ---------------------------------------------------------------------------

" Searching / moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" turn search highlight off
nnoremap <leader>/ :noh<cr>

" ack
nnoremap <leader>a :Ack 

" search
nmap <space> /
map <c-space> ?

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

" beginning and end of line
imap <C-h> <ESC>^
imap <C-l> <ESC>$

" Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Switch between buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>

" close buffer
nmap <leader>d :bd<CR>

" close all buffers
nmap <leader>D :bufdo bd<CR>

" Edit/View files relative to current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Ignore some binary, versioning and backup files when auto-completing
set wildignore=.svn,CVS,.git,*.swp,*.jpg,*.png,*.gif,*.pdf,*.bak
" Set a lower priority for .old files
set suffixes+=.old


"  ---------------------------------------------------------------------------
"  
"  ---------------------------------------------------------------------------




"  ---------------------------------------------------------------------------
"  
"  ---------------------------------------------------------------------------




"  ---------------------------------------------------------------------------
"  
"  ---------------------------------------------------------------------------




"  ---------------------------------------------------------------------------
"  
"  ---------------------------------------------------------------------------
