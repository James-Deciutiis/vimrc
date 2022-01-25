"  _______________________________________
" |\ ___________________________________ /|
" | | _                               _ | |
" | |(+)        _           _        (+)| |
" | | ~      _--/           \--_      ~ | |
" | |       /  /             \  \       | |
" | |      /  |               |  \      | |
" | |     /   |               |   \     | |
" | |     |   |    _______    |   |     | |
" | |     |   |    \     /    |   |     | |
" | |     \    \_   |   |   _/    /     | |
" | |      \     -__|   |__-     /      | |
" | |       \_                 _/       | |
" | |         --__         __--         | |
" | |             --|   |--             | |
" | |               |   |               | |
" | |                | |                | |
" | |                 |                 | |
" | |               V I M               | |
" | |   I S   G O O D   F O R   Y O U   | |
" | | _                               _ | |
" | |(+)                             (+)| |
" | | ~                               ~ | |
" |/ ----------------------------------- \|
"  ---------------------------------------
"          James-Deciutiis/vimrc

" Plugins "
call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'ap/vim-css-color' 
    Plug 'ryanoasis/vim-devicons'
    Plug 'liuchengxu/space-vim-theme'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ajmwagar/vim-deus'
    Plug 'sainnhe/everforest'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'
    Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html', 'lua'] }
call plug#end()

" General vim configurations
set number
set laststatus=2
set tabstop=2
set shiftwidth=2
set cursorline
set softtabstop=2
set expandtab
set noshowmode
set encoding=UTF-8

" Splits settings
set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resizing splits
nnoremap <silent> <C-Left> :vertical resize +5 <CR>
nnoremap <silent> <C-Right> :vertical resize -5 <CR>
nnoremap <silent> <C-Up>  :resize +5 <CR>
nnoremap <silent> <C-Down>  :resize -5 <CR>

" Term in Vim settings
nnoremap <C-t> :term <CR>
noremap <Esc>[1;5A <C-w> :h <CR>
set splitbelow
set termwinsize=10*

" Remove all current highlighting
nnoremap <C-c> :noh <CR>

" Save on control - s
nnoremap <C-s> :w :Prettier <CR>
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Color configurations

" forest-bridge theme
" set background=dark
" let g:everforest_background = 'hard'
" colorscheme everforest 

set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme space_vim_theme

" Coc linter configurations
let g:coc_global_extensions = [
\   'coc-snippets',
\   'coc-pairs',
\   'coc-tsserver',
\   'coc-eslint',
\   'coc-prettier',
\   'coc-json',
\]

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" NerdTree Configurations
nnoremap <C-n> :NERDTreeToggle <CR>

" Automatically open NERDTree when vim opens
autocmd VimEnter * NERDTree | wincmd p

" close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Airline settings
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline_branch = ''

let g:airline_theme = 'solarized'
"`let g:airline_symbols.readonly = ''
"`let g:airline_symbols.linenr = ''

packloadall

