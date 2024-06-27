set number relativenumber
syntax on
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set background=dark
set termguicolors
set nocompatible

" hack?

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 1

colorscheme tokyonight

call plug#begin('~/.vim/plugged')

" https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'sheerun/vim-polyglot'

call plug#end()
" 'python':['pydocstyle', 'bandit', 'mypy', 'flake8'], 
let g:ale_linters = {'*':[],'python':['pydocstyle', 'bandit', 'mypy', 'flake8'], 'cpp':[], 'c':[], 'asm':[]}
let ale_lint_delay=0
let g:ale_fixers  = {'python':['black', 'isort']}
let g:ale_fix_on_save = 1
let g:deoplete#sources#jedi#show_docstring = 1

