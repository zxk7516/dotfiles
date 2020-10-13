call plug#begin('~/.vim/plugged')
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'dev', 'do': 'bash install.sh'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

set hidden
set nu
set relativenumber
set signcolumn=yes
set mouse=n

let g:LanguageClient_serverCommands = { 'rust': ['/root/.cargo/bin/rust-analyzer'] }
let g:deoplete#enable_at_startup = 1



" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
