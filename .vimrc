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
set ruler
set clipboard=unnamed
set showtabline=2
set nowrap
set laststatus=2

" Configure the colorcolumn
set colorcolumn=80
highlight ColorColumn guibg=#3C111A

" Configure the font to terminus
set guifont=Terminus\ Medium:h12
set noantialias

" Remove gvim gui noise
set guioptions-=m
set guioptions-=T
set guioptions-=l
set guioptions-=r
set guioptions-=b

" disable ex mode
map Q <Esc>

" enable 256 colors
set t_Co=256

" make invisible characters grey.
highlight NonText ctermfg=12 guifg=#3C3C3C

" make Y behave like other capitals
map Y y$

"" Trailing whitespace should be marked as red.
"autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
"autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
"highlight EOLWS ctermbg=red guibg=red

" This may delete whitespace at end of file before saving. Need to test still.
"autocmd BufWritePre * :%s/\s\+$//e

" Highlight the todo lines.
syntax match TODO /[#"\/;]\ TODO.*/
highlight TODO ctermfg=red guifg=red cterm=bold gui=bold

" Setup filetype for weird extensions.
au! BufRead,BufNewFile *.pill setfiletype ruby

" configure ctrlp
let g:ctrlp_map = '<c-t>'
let g:ctrlp_prompt_mappings = {
\ 'AcceptSelection("e")': [],
\ 'AcceptSelection("t")': ['<ct>', '<c-m>'],
\ }

autocmd FileType ruby   setlocal ai ts=2 sts=2 et sw=2
autocmd FileType eruby  setlocal ai ts=2 sts=2 et sw=2
autocmd FileType python setlocal ai ts=4 sts=4 et sw=4
autocmd FileType sh     setlocal ai ts=2 sts=2 et sw=2

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc
