" Vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'
" vim-go plugin (https://github.com/fatih/vim-go)
Plugin 'fatih/vim-go'
" YCM plugin (https://github.com/Valloric/YouCompleteMe)
Plugin 'Valloric/YouCompleteMe'
" tagbar plugin (https://github.com/majutsushi/tagbar)
Plugin 'majutsushi/tagbar'
" ultisnips plugin (https://github.com/SirVer/ultisnips)
Plugin 'SirVer/ultisnips'
" NERDtree plugin (https://github.com/scrooloose/nerdtree)
Plugin 'scrooloose/nerdtree'

" All the plugins must be added before the following line
call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Hides buffers instead of closing them
set hidden

" Set to auto read when a file is changed from the outside
set autoread

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable syntax highlighting
syntax enable

" molokai FTW
colorscheme molokai

" Set utf8 as standard encoding 
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,mac,dos

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Tab and Window navigation
noremap <C-n> :tabnext<CR>
noremap <C-p> :tabprev<CR>
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Toggle relative/actual line numbers.
nnoremap <Leader>n :NumbersToggle<CR>:set number!<CR>

" Powerline
"set rtp+=$HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/
set laststatus=2 " Always display the statusline in all windows
set t_Co=256 " Use 256 colours 
set showcmd " Show me the vi command in the ruler

" Fix terminal timeout when pressing escape
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" Tagbar settings
nnoremap <silent> <Leader>f :TagbarToggle<CR>

" YCM settings
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" vim-go settings
let g:go_play_open_browser = 0
"let g:go_fmt_fail_silently=1
" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info) 
" Open the relevant Godoc for the word under the cursor with <leader>gd or
" open it vertically with <leader>gv
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" Or open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
" Run commands, such as go run with <leader>r for the current file or go build
" and go test for the current package with <leader>b and <leader>t
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
" Replace gd (Goto Declaration) for the word under your cursor (replaces
" current buffer)
au FileType go nmap gd <Plug>(go-def)
" Or open the definition/declaration in a new vertical, horizontal or tab for
" the word under your cursor:
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" UltiSnips settings
" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB key 
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res == 0
        if pumvisible()
            return "\<C-N>"
        else
            return "\<TAB>"
        endif
    endif

    return ""
endfunction
function! g:UltiSnips_Reverse()
    call UltiSnips#JumpBackwards()
    if g:ulti_jump_backwards_res == 0
        return "\<C-P>"
    endif

    return ""
endfunction
if !exists("g:UltiSnipsJumpForwardTrigger")
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif
if !exists("g:UltiSnipsJumpBackwardTrigger")
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

" NERDTree settings
map <Leader>t :NERDTreeToggle<CR>
