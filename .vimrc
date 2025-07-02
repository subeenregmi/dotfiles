set relativenumber
syntax on
set smartindent 
set tabstop=4
set shiftwidth=4
set expandtab 
set background=dark
set termguicolors
set nocompatible
set encoding=UTF-8
set re=0

set regexpengine=0
syntax on
filetype plugin indent on


" hack?

let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 0
let g:tokyonight_transparent_background = 1

let g:airline_powerline_fonts = 1
let g:airline_theme='deus'

colorscheme tokyonight


call plug#begin('~/.vim/plugged')

Plug 'catppuccin/vim', { 'as': 'catppuccin'  }

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'sheerun/vim-polyglot'

Plug 'jiangmiao/auto-pairs'

Plug 'alvan/vim-closetag'

Plug 'https://github.com/wolandark/vim-live-server.git'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ryanoasis/vim-devicons'

Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'dense-analysis/ale'

Plug 'psliwka/vim-smoothie'

Plug 'ianks/vim-tsx'

Plug 'yggdroot/indentline'

Plug 'vim-scripts/loremipsum'

call plug#end()

highlight ALEVirtualTextError guifg=#ff007c


nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_diagnostics_enabled = 0

let b:ale_linters = {'c': ['clangd'], 'asm':[''], 'typescript':['eslint']}


autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact


" Toggle cursor highlighting with hc (in normal mode)
nnoremap hc :call ToggleCursorHighlight()<CR>

function! ToggleCursorHighlight()
    if &cursorline && &cursorcolumn
        set nocursorline
        set nocursorcolumn
        echo "Cursor highlighting OFF"
    else
        set cursorline
        set cursorcolumn

        highlight CursorLine ctermbg=236 guibg=#333322
        highlight CursorColumn ctermbg=236 guibg=#333322
        echo "Cursor highlighting ON"
    endif
endfunction
