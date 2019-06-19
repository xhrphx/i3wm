syntax enable
syntax on
set nu 
set t_Co=256
" set background=dark
colorscheme solarized

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za


set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set textwidth=79
set textwidth=999
set expandtab
set autoindent
set fileformat=unix

set nocompatible              " required
filetype off                  " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Quickly Run
" Quickly Run
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'gmarik/Vundle.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'w0rp/ale'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_javascript_eslint_use_global = 1
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_theme="luna"
"这个是安装字体后 必须设置此项"
"let g:airline_theme="kolor"
let g:airline_powerline_fonts = 1 
set laststatus=2  "永远显示状态栏
set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩
"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tabline#buffer_nr_show = 1 

"设置切换Buffer快捷键"
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" 关闭状态显示空白符号计数,这个对我用处不大"
let g:airline#extensions#whitespace#enabled = 0 
let g:airline#extensions#whitespace#symbol = '!'
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly Run
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w" 
    if &filetype == 'c' 
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!time python %'
    elseif &filetype == 'sh'
        :!time bash %
    endif                                                                              
endfunc

"set the transparency
"hi Normal ctermfg=252 ctermbg=none
