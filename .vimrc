set nocompatible              " be iMproved, required
"packadd! dracula
packadd! fzf
packadd! fzf.vim
packadd! foxdot.vim

let g:sclang_executable_path = "/usr/bin/sclang"
let g:python_executable_path = "/usr/bin/python"

filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
syntax enable
"colorscheme dracula
"colorscheme molokai
colorscheme monokai256
"colorscheme sourcerer
let g:rehash256 = 1

set expandtab
set shiftwidth=2
set tabstop=2
set hidden
"set number
set termguicolors
set undofile
"set spell
set title
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set confirm
set exrc

set showmatch " Highlight matching brace
"set visualbell " Use visual bell (no beeping)
set hlsearch " Highlight all search results
set smartcase " Enable smart-case search
set ignorecase " Always case-insensitive
set autoindent " Auto-indent new lines
set incsearch " Searches for strings incrementally
set smartindent " Enable smart-indent
set smarttab " Enable smart-tabs
set softtabstop=2 " Number of spaces per Tab
set showtabline=2 " Show tab bar
set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start " Backspace behaviour
set ruler " Show row and column ruler information
set linebreak " Break lines at word (requires Wrap lines)
set showbreak=+++ " Wrap-broken line prefix
set textwidth=100 " Line wrap (number of cols)

let g:javascript_plugin_flow = 1

" No ExMode
map Q <Nop>

" Allow gf to open non-existent files
map gf :tabe <cfile><cr>

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv

" Append sudo
cmap w!! %!sudo tee > /dev/null %

" FZF / CTRL-P
let g:fzf_layout = { 'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5 } }
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

" Customise the Files command to use rg which respects .gitignore files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'tabe', 'source': 'rg --files --hidden --glob=!.git/' }), <bang>0))

" Add an AllFiles variation that ignores .gitignore files
command! -bang -nargs=? -complete=dir AllFiles
    \ call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'tabe', 'source': 'rg --files --hidden --glob=!.git/ --no-ignore' }), <bang>0))

map gb :FoxDotEval<cr>
nmap <C-P> :Files<cr>
"nmap <C-O> :AllFiles<cr>
