" Plugins
call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'ap/vim-css-color' 
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ajmwagar/vim-deus'
    Plug 'sainnhe/everforest'
call plug#end()

" General vim configurations
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshowmode
set encoding=UTF-8

" Term in Vim settings
nnoremap <C-t> :term <CR>
noremap <Esc>[1;5A <C-w> :h <CR>
set splitbelow
set termwinsize=10*208

" Turns off highlighting until next search
nnoremap <C-c> :noh <CR>

" Save on control - s
nnoremap <C-s> :w <CR>

" Color configurations
set background=dark
let g:everforest_background = 'hard'
colorscheme everforest 

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

