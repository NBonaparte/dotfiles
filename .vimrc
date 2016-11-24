set nocompatible               " be iMproved
filetype off                   " required!
syntax on

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-latex/vim-latex'
Plugin 'scrooloose/nerdtree'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
" Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required

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

" --- Timestamps for TeX files -------------------------------------------
function! LastModified()
  if &modified
    let save_cursor = getpos(".")
    let n = min([8, line("$")])
    keepjumps exe '1,' . n . 's#^% Last modified: \zs.*# ' . strftime('%H:%M %A, %-d %B %Y') . '#e'
    call histdel('search', -1)
    keepjumps call setpos('.', save_cursor)
  endif
endfun

autocmd BufWritePre *.tex call LastModified()

au BufWritePost *.tex silent call Tex_RunLaTeX()
" au BufWritePost *.tex silent !pkill -USR1 mupdf

" NERDTree
" autocmd VimEnter * NERDTree
let NERDTreeShowHidden=1

" Minimap
" show: \mm, hide: \mc
let g:minimap_highlight='Visual'

" Syntastic
let g:syntastic_c_compiler = 'make'
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_c_include_dirs = ['../include/', '../includes/']
let g:syntastic_cpp_check_header = 1
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" " Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
