" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

set laststatus=2

function! Mode()
    let l:mode = mode()
    if     mode ==# "n" | return ""
    elseif mode ==# "i" | return "[INSERT] "
    elseif mode ==# "R" | return "[RPLACE] "
    elseif mode ==# "v" | return "[VISUAL] "
    elseif mode ==# "V" | return "[V-LINE] "
    elseif mode ==# ""  | return "[V-BLCK] "
    else                | return "[".l:mode."] "
    endif
endfunc

set statusline=
set statusline+=%{Mode()}   " Mode
set statusline+=%f\ %m%r    " filename, modified flag, readonly flag
set statusline+=%y          " filetype
set statusline+=%=          " left-right sep
set statusline+=%c,\        " cursor col
set statusline+=%l/%L       " cursor line/total lines

set showtabline=2
set noshowmode

filetype plugin indent on
set showcmd
set mouse=a

let &titlestring = "Vim [" . expand("%:t") . "]"
if &term == "screen"
  set t_ts=k
  set t_fs=\
endif
if &term == "screen" || &term == "xterm"
  set title
endif

set tabstop=4 shiftwidth=4 expandtab autoindent smarttab
set backspace=indent,eol,start
set si wrap
set so=5
set wildmenu
set wildignore=*.o,*~,*.pyc
set wildmode=list:full
set hid
set ignorecase
set smartcase

set incsearch
set hlsearch

set autoread
set showmatch
syntax enable
set ttyfast
set lazyredraw
set confirm

set number
set relativenumber
