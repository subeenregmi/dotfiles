set number relativenumber
syntax on
colorscheme gruvbox
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

call plug#begin('~/.vim/plugged')

" https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'

call plug#end()
" 'python':['pydocstyle', 'bandit', 'mypy', 'flake8'], 
"let g:ale_linters = {'*':[],'python':['pylint'], 'cpp':['clang-tidy', 'cpplint', 'cc'], 'c':['cc']}
"let ale_lint_delay=0
"let g:ale_python_pylint_options = '--rcfile ~/Downloads/pylintrc'
"let g:ale_fixers  = {'python':['black', 'isort']}
"let g:ale_fix_on_save = 1

