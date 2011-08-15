syntax on
set ts=2
set sw=2
set expandtab
set nu
set background=dark
colorscheme ir_black
set mouse=a
set modeline

" Remove gvim gui noise
set guioptions-=m
set guioptions-=T
set guioptions-=l
set guioptions-=r
set guioptions-=b

" disable ex mode
map Q <Esc>

" configure navigation.
map <C-n> :tabnext<CR>
map <C-p> :tabprevious<CR>

" Trailing whitespace should be marked as red.
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" Setup filetype for weird extensions.
au! BufRead,BufNewFile *.pill setfiletype ruby
