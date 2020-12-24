" List of plugins to install for vim-plug
" arbitrarily chose "bundle" as my plugin directory
call plug#begin('~/.vim/bundle')

Plug 'dense-analysis/ale'
Plug 'jlanzarotta/bufexplorer'

call plug#end()

" tab settings
set shiftwidth=2    " two spaces per indent
set tabstop=2       " number of spaces per tab in display
set softtabstop=2   " number of spaces per tab when inserting
set expandtab       " substitute spaces for tabs

" status line settings
set laststatus=2 " always enable
set statusline=%f " show the current filename

" numbering settings
set number " enable line numbers
set relativenumber " show offsets relative to current line
