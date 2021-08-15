" Plugins
call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'ap/vim-css-color' 
    Plug 'vim-airline/vim-airline'
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
