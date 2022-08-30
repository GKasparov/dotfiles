" Syntax Highlighting
syntax enable
filetype plugin indent on

" LightLine
set laststatus=2
set background=dark

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
call lightline#init()
call lightline#colorscheme()
call lightline#update()
