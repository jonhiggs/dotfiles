syntax on
set ts=2
set sw=2
set expandtab
set nu
set background=dark
colorscheme ir_black
set mouse=a
set modeline
set visualbell

" Remove gvim gui noise
set guioptions-=m
set guioptions-=T
set guioptions-=l
set guioptions-=r
set guioptions-=b

" disable ex mode
map Q <Esc>

" configure navigation.
if has("gui_gtk2")
  map <C-n> :tabnext<CR>
  map <C-p> :tabprevious<CR>
else
  map <M-n> :tabnext<CR>
  map <M-p> :tabprevious<CR>
endif

" Trailing whitespace should be marked as red.
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" Highlight the todo lines.
syntax match TODO /[#"\/;]\ TODO.*/
highlight TODO ctermfg=red guifg=red cterm=bold gui=bold

" Setup filetype for weird extensions.
au! BufRead,BufNewFile *.pill setfiletype ruby
