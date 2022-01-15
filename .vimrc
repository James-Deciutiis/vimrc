" Plugins
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

" Term in Vim settings
nnoremap <C-t> :term <CR>
noremap <Esc>[1;5A <C-w> :h <CR>
set splitbelow
set termwinsize=10*

" Turns off highlighting until next search
nnoremap <C-c> :noh <CR>

" Save on control - s
nnoremap <C-s> :w <CR>

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


" Use K to show documentation in preview window.
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

