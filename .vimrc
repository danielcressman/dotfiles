" List of plugins to install for vim-plug
" arbitrarily chose "bundle" as my plugin directory
call plug#begin('~/.vim/bundle')

Plug 'dense-analysis/ale'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-eunuch'
Plug 'jxnblk/vim-mdx-js'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'

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

" ale settings
let g:ale_linters = {
  \'python': ['ruff', 'pyright'],
  \'rust': ['analyzer']
\}
let g:ale_fixers = {
  \'python': ['ruff', 'ruff_format'],
  \'javascript': ['prettier'],
  \'javascriptreact': ['prettier'],
  \'typescript': ['prettier'],
  \'typescriptreact': ['prettier'],
  \'markdown': ['prettier'],
  \'json': ['prettier'],
\}
let g:ale_completion_enabled = 1 " autocomplete enabled
let g:ale_set_highlights = 0 " disable highlights, python linters were being weird with autocomplete

" set leader key to space for ease of use
let mapleader=" "

" auto-complete settings
set completeopt=menu,menuone,popup,noinsert " show a menu, show docs in popup, don't auto-insert text when auto-completing
set splitbelow " splits window below the current, makes preview window show up at bottom
" enter and tab close autocomplete when popup menu is visible
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"

" setup shortcuts for various ALE commands
nnoremap <silent> gd <Plug>(ale_go_to_definition)
nmap <Leader>h <Plug>(ale_hover)
nmap <Leader>f <Plug>(ale_fix)
nmap <Leader>d <Plug>(ale_detail)
nmap <Leader>i <Plug>(ale_import)
nmap <Leader>u <Plug>(ale_find_references)
nmap <Leader>r <Plug>(ale_rename)
nmap <Leader>q <Esc>:ALEStopAllLSPs<CR>
nnoremap <Leader>e :ALEInfo<CR>

" setup other vim shortcuts
nnoremap <C-c> <Esc>:pc<CR>
inoremap <C-c> <Esc>:pc<CR>
inoremap <C-f> <Esc>:FZF<CR>
nnoremap <C-f> <Esc>:FZF<CR>
nmap <Leader>s <Esc>:mks! ~/temp/vimsession<CR>
nmap <Leader>l <Esc>:source ~/temp/vimsession<CR>
inoremap jj <Esc>

" disable terminal bell (e.g. for when you press Esc outside of insert mode)
set noerrorbells visualbell t_vb=

" hide buffers instead of closing them when it's not visible
set hidden

" highlight all search results while typing
set is hls

" let vim automatically select the regexp engine, instead of using 'old' one
" this is needed because typescript parsing is too slow without it
" see https://jameschambers.co.uk/vim-typescript-slow
set regexpengine=0
