" PLUGINS {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'                                 " Git Gutter
Plug 'ctrlpvim/ctrlp.vim'                                     " Ctrl+P
Plug 'haya14busa/incsearch.vim'                               " incsearch
Plug 'jpalardy/vim-slime'                                     " Vim Slime
Plug 'junegunn/vim-easy-align'                                " Easy Align
Plug 'majutsushi/tagbar'                                      " Tagbar
Plug 'nathanaelkane/vim-indent-guides'                        " Indent Guides
Plug 'pangloss/vim-javascript'                                " Javascript
Plug 'rking/ag.vim'                                           " Silver Searcher
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }       " Nerd Tree
Plug 'scrooloose/syntastic'                                   " Syntastic
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Deoplete
Plug 'sheerun/vim-polyglot'                                   " Language pack
Plug 'tpope/vim-commentary'                                   " Commentary
Plug 'tpope/vim-fugitive'                                     " Fugitive
Plug 'tpope/vim-surround'                                     " Surround
Plug 'tpope/vim-repeat'                                       " Repeat
Plug 'vim-airline/vim-airline'                                " Airline
Plug 'Xuyuanp/nerdtree-git-plugin'                            " Nerd Tree Git

                                                              " THEMES
Plug 'morhetz/gruvbox'                                        " Gruvbox
Plug 'vim-airline/vim-airline-themes'                         " Airline Themes

" Add plugins to &runtimepath
call plug#end()
" }}}


" COLOR {{{
syntax enable
set background=dark
colorscheme gruvbox
" }}}


" UI {{{
set showmatch                       " Show matching brackets
set number                          " Line Numbers
set numberwidth=3
set wildmenu                        " visual autocomplete in commands
set wildmode=list:longest
set nolazyredraw                    " only redraw when necessary
set ruler                           " show column number, etc. on bottom right
set nowrap                          " dont wrap lines
set showcmd                         " show command in bottom bar
set noshowmode                      " Don't need to show mode since airline is enabled
set cursorline                      " highlight current line
set splitright                      " New vertical splits open to the right of current pane
set timeoutlen=1000 ttimeoutlen=0
set mouse=""
set hidden
set modelines=1
set noshowmatch                     " Disable jumping to matching bracket when typing

set noerrorbells
set novisualbell

set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

set guioptions=acg
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" Fixes deoplete autoinsert problem
if version >= 704
  set completeopt=menu,noinsert,noselect
endif

" Change listchars to something sensible
" set list listchars=tab:»·,trail:·
" set list listchars=tab:»\ ,trail:·,nbsp:.
" }}}


" MOVEMENT {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Move between windows easier
nnoremap <silent> <C-l> <c-w>l
nnoremap <silent> <C-h> <c-w>h
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-j> <c-w>j
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" Move to leftmost or right most pane
nnoremap <silent> <leader>h <C-w>200h
nnoremap <silent> <leader>l <C-w>200l

" Highlight last inserted text
nnoremap gV `[v`]

" Quickly switch buffers
nnoremap <silent> <leader>z :bp<CR>
nnoremap <silent> <leader>x :bn<CR>
nnoremap <leader><leader> <c-^>

" Equal Size Windows
nmap <silent> <leader>w= :wincmd =<CR>

" Window splitting
nmap <silent> <leader>hs :split<CR>
nmap <silent> <leader>vs :vsplit<CR>
nmap <silent> <leader>sc :close<CR>

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
    for key in ['<Up>', '<Down>', '<Left>', '<Right>']
        exe prefix . "noremap " . key . " <Nop>"
    endfor
endfor

" Map jj to escape
inoremap jj <Esc>

" }}}


" TABS {{{
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set bs=2

filetype indent on                  " load filetype-specific indent files
" }}}


" FOLDING {{{
set foldmethod=indent
set foldenable                      " enable folding
set foldlevelstart=10               " open most folds by default
set foldnestmax=10                  " 10 nested fold max

" space open/closes folds
nnoremap <space> za
" }}}


" EDITING {{{
filetype plugin indent on

nnoremap gb :ls<CR>:b

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" leader copy and paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" make Y consistent with C and D. See :help Y.
nnoremap Y y$
" Y in visual mode copies to system clipboard
vmap Y "+y

command! W w
command! Q q
command! WQ wq
command! Wq wq

set iskeyword+=$,@,-     " Add extra characters that are valid parts of variables
" }}}


" SEARCH {{{
set incsearch                       " search as characters are entered
set hlsearch                        " highlight matches
set ignorecase                      " case-insensitive search
set smartcase                       " match uppercase

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:incsearch#auto_nohlsearch = 0
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" map \ + space to unhighlight search matches
nnoremap <leader><space> :nohlsearch<CR>

" open ag.vim
nnoremap <leader>a :Ag

" search for visually selected text
vnoremap // y/<C-R>"<CR>

set wildignore+=.final_builds/*,*/node_modules/*,*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.sass-cache,*.class,*.scssc,*/Godeps/*

" CtrlP Settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0

" keeps ctrlp in a reasonable working dir after opening
" 'r' finds git root, 'a' keeps original cwd if opening a child file
let g:ctrlp_working_path_mode = 'ra'

" Use Silver Searcher When Possible
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" Use deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}

" autocomplete on just about any character
let g:deoplete#omni_patterns.go = '[a-zA-Z_\.]{3,}'

" tab for cycling through options
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" enter closes options if present and inserts linebreak
inoremap <silent> <CR> <C-r>=<SID>close_and_linebreak()<CR>
function! s:close_and_linebreak()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
" }}}


" BACKUPS {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}


" NERDTREE {{{
nnoremap <leader><tab> :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '×'

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('py', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('cpp', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('rb', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('go', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('pl', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('txt', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('less', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')

let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "●",
    \ "Staged"    : "+",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖︎",
    \ "Dirty"     : "✕",
    \ "Clean"     : "",
    \ "Unknown"   : "?"
    \ }

let NERDTreeIgnore = ['\.pyc$']

" }}}


" SYNTASTIC {{{
" let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_javascript_jshint_conf = $HOME . '/.jshintrc'
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_python_checkers = ['flake8']

" syntastic error window toggle
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
    " Nothing was closed, open syntastic error location
        Errors
    endif
endfunction
" bring up syntastic error list
nnoremap <silent> <Leader>e :<C-u>call ToggleErrors()<CR>
" }}}


" GIT GUTTER {{{
set signcolumn=yes

let g:gitgutter_sign_added = '▒'
let g:gitgutter_sign_removed = '▒'
let g:gitgutter_sign_modified = '▒'
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
" }}}


" TAGBAR {{{
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
" }}}


" TMUX {{{
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}


" AIRLINE {{{
let g:airline_powerline_fonts=1
" }}}


" AUTOGROUPS {{{
" Trim whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Return cursor to previous location on load
autocmd BufReadPost * normal `"

" Close vim if the only window left open is NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" set syntax for *.tag files
autocmd BufNewFile,BufNewFile,BufRead *.tag    set syntax=html

" JavaScript (tabs = 4, lines = 79)
"autocmd FileType javascript set sw=2
"autocmd FileType javascript set ts=2
"autocmd FileType javascript set sts=2
" }}}


" LEADER BINDINGS {{{
" Strip trailing whitespace
nnoremap <silent> <leader>] :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Save session
nnoremap <leader>s :mksession<CR>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>n :<C-u>call ToggleNumber()<CR>

map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
" }}}


" CUSTOM FUNCTIONS {{{

" Toggle between number and relativenumber
function! ToggleNumber()
    if(&relativeNumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
" }}}


if has('nvim')
    let s:editor_root=expand("~/.nvim")
    " nvim workaround for binding ctrl h
    " nmap <BS> <C-W>h
else
    let s:editor_root=expand("~/.vim")
endif

let g:python3_host_prog = '/Users/tonychen/.pyenv/versions/neovim3/bin/python'

" vim:foldmethod=marker:foldlevel=0
