set nocompatible

set noexpandtab

" == PLUGINS ==

" F6 toggles NERDTree
nnoremap <silent> <expr> <F6> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" F5 toggles UndoTree
nnoremap <F5> :UndotreeToggle<CR>

" == CONFIG ==

" set default colorscheme
colorscheme everforest

" Match pairs of parentheses.
    function! VisualTagsWrap()
        if !exists('g:tags_to_wrap')
            let g:tags_to_wrap=[]
        endif
        let g:tags_to_wrap=split(input('space separated tags to wrap block: ', join(g:tags_to_wrap, ' ')), '\s\+')
        if len(g:tags_to_wrap)>0
            execute 'normal! `>a</'.join(reverse(g:tags_to_wrap), '></').'>'
            execute 'normal! `<i<'.join(reverse(g:tags_to_wrap), '><').'>'
        endif
    endfunction
vnoremap <silent>,w <ESC>:call VisualTagsWrap()<CR>
set matchpairs+=<:>

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Turn filetype plugin indent on.

filetype plugin indent on

" Add numbers to each line on the left-hand side.
 set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Make cursor wrap line
set whichwrap+=<,>,h,l,[,]

" Enable mouse input
" set mouse=a
" map <ScrollWheelUp> <C-Y>
" map <ScrollWheelDown> <C-E>

" F12 runs current program python
autocmd FileType python map <buffer> <F12> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F12> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" F12 compiles and executes current program C++

autocmd filetype cpp nnoremap <F12> :w <bar> exec '!clang++ '.shellescape('%').' -o '.shellescape('%:r').'&& ./'.shellescape('%:r')<CR>

autocmd filetype cpp nnoremap <F11> :w <bar> exec '!clang++ '.shellescape('%').' -o '.shellescape('%:r')<CR>

autocmd filetype cpp nnoremap <F10> :w <bar> :make! all<CR>

" F12 compiles and executes current program C

autocmd filetype c nnoremap <F12> :w <bar> exec '!clang '.shellescape('%').' -o '.shellescape('%:r').'&& ./'.shellescape('%:r')<CR>

" x sends to black hole register
nnoremap x "_x
vnoremap x "_x

" use system clipboard
" set clipboard=unnamed

" set scrolloff
set scrolloff=99

" tabsize
set shiftwidth=8

" set noet for python
autocmd FileType python setlocal noexpandtab
