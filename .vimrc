syntax on
filetype plugin indent on
set number
set laststatus=2
set noshowmode
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
" Colorscheme
let g:hybrid_use_Xresources = 1
set background=dark
colorscheme hybrid
" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'air_e7'
let g:airline_section_b = '%{getcwd()}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2
" Vim-LaTeX
" compile: \ll, view: \lv
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
autocmd BufNewFile *.tex :TTemplate
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_Flavor='latex'
let g:Tex_ViewRule_pdf='mupdf'
" NERDTree
" autocmd VimEnter * NERDTree
let NERDTreeShowHidden=1
