" GENERALS{{{
" ------------------------------------------------------------
    "hybrid line numbers
     set number relativenumber
     set nocompatible
     filetype plugin on
     syntax enable 
     filetype plugin indent on
     runtime! ftplugin/man.vim
    "au BufRead,BufNewFile *.md setlocal textwidth=80
     set spelllang=en
     set spell
    "encoding declaration for vim-devicons
     set encoding=UTF-8
    "more natural splitopening for vim split panes
     set splitbelow
     set splitright
    "remapping +register copy/pasting
     set clipboard=unnamed
    "Aggregating swap files
    set backup
    set backupdir=$HOME/.vim/backup
    set dir=$HOME/.vim/backup

"{{{ Tabs over spaces
" ------------------------------------------------------------
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set autoindent
    set textwidth=80
" ------------------------------------------------------------
"}}}
"{{{ Performance improvements
" ------------------------------------------------------------
  set synmaxcol=200 "Don't bother highlighting anything over 200 chars
  let did_install_default_menus = 1 "No point loading gvim menu stuff
  let loaded_matchparen = 1 "highlighting matching pairs so slow
" ------------------------------------------------------------
  "}}}
"{{{ Defining <Leader> key
" ------------------------------------------------------------
  let mapleader = ","
" ------------------------------------------------------------
"}}}
" ------------------------------------------------------------
"}}}

"{{{ MAPPING
" ------------------------------------------------------------
   "remapping vim pane movement
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
   "turn off search highlights
    nnoremap <Leader>h :nohlsearch <CR>
   "Toggle Fold
    nnoremap <Leader>m za
   "Autocorrect
    nnoremap <Leader>c z=1 <CR> <CR>

" ------------------------------------------------------------
"}}}
  
"{{{ IndentLine
" ------------------------------------------------------------
    let g:indentLine_char = '┆'
    let g:indentLine_first_char = '┆'
    let g:indentLine_showFirstIndentLevel = 1
    let g:indentLine_setColors = 0
" ------------------------------------------------------------
" }}}

"{{{ SEARCHING 
" ------------------------------------------------------------
    set ignorecase          " ignore case when searching
    set incsearch           " search as characters are entered
    set hlsearch            " highlight all matches
" ------------------------------------------------------------
" }}}

"{{{ PLUGINS
" ------------------------------------------------------------
    "{{{ PLUGIN MANAGERS
    " ------------------------------------------------------------
        "{{{ PLUG plugin manager
        " ------------------------------------------------------------
          call plug#begin('~/.vim/plugged')
            Plug 'https://github.com/junegunn/goyo.vim'
            Plug 'https://github.com/ryanoasis/vim-devicons'
            Plug 'https://github.com/tpope/vim-surround'
            Plug 'christoomey/vim-tmux-navigator'
            Plug 'junegunn/vim-easy-align'
            Plug '/usr/local/opt/fzf'
            Plug 'junegunn/fzf.vim'
            Plug 'dylanaraps/wal.vim'
            "Plug 'mhinz/vim-startify'
            Plug 'sedm0784/vim-you-autocorrect'
        "   Plug 'https://github.com/liuchengxu/space-vim-dark'
        "   Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
        "   Plug 'https://github.com/kien/ctrlp.vim'
        "   Plug 'https://github.com/ervandew/supertab'
        "   Plug 'vimwiki/vimwiki'
        "   Plug 'https://github.com/jonhiggs/MacDict.vim'
        "   Plug 'shmargum/vim-sass-colors'
        "   Plug 'ayu-theme/ayu-vim'
        "   Plug 'Yggdroot/indentLine'
        "   Plug 'whatyouhide/vim-gotham'
        "   Plug 'mcchrish/nnn.vim'
          call plug#end()
        " ------------------------------------------------------------
        "}}}
        "{{{ Pathogen Plugin manager
        " ------------------------------------------------------------
            execute pathogen#infect()
        " ------------------------------------------------------------
        "}}}
    " ------------------------------------------------------------
    "}}}

    " GOYO-Plugin{{{
    " ------------------------------------------------------------
        map <C-g> :Goyo<CR>
        let g:goyo_linenr = 1
        let g:goyo_width = 80
        let g:goyo_height = 85
        autocmd! User GoyoEnter nested call <SID>goyo_enter()
        autocmd! User GoyoLeave nested call <SID>goyo_leave()

     "{{{ GOYO ENTER FUNCTION
     " ------------------------------------------------------------
         function! s:goyo_enter()
             "silent !tmux set status off
             silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
             set noshowmode
             set noshowcmd
             let b:quitting = 0
             let b:quitting_bang = 0
             autocmd QuitPre <buffer> let b:quitting = 1
             cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q! set scrolloff=999
             call Patch_colors()
         endfunction
     " ------------------------------------------------------------
     "}}}
    "{{{ GOYO LEAVE FUNCTION
    " ------------------------------------------------------------
        function! s:goyo_leave()
          silent !tmux set status on
          silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
          set showmode
          set showcmd
          " Quit Vim if this is the only remaining buffer
          if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
            if b:quitting_bang
              qa!
            else
              qa
            endif
          endif
          set scrolloff=5
          call Patch_colors()
        endfunction
    " ------------------------------------------------------------
    "}}}
    "}}}
    
    " Easy Align-Plugin{{{
    " ------------------------------------------------------------
    "Start interactive EasyAlign in visual mode (e.g. vipga)
        xmap ga <Plug>(EasyAlign)
    "Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign)
    " ------------------------------------------------------------
    "}}}
    "}}}
    
"{{{ Image Previews
" ------------------------------------------------------------
"   Usually used for Ranger image previews
"   autocmd BufEnter *.png,*.jpg,*gif exec "! ~/.iterm2/imgcat ".expand("%") | :bw
" ------------------------------------------------------------
"}}}

"{{{ Auto Commands
" ------------------------------------------------------------
"   autocmd BufWritePost *Users/tyyiu/Uni/* silent! ! ~/bin/syncer
" ------------------------------------------------------------
"}}}

"{{{ THEMING
" ------------------------------------------------------------
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
    set t_Co=256
    set background=dark
    "set termguicolors
    
    colorscheme wal
    autocmd! colorscheme wal call Patch_colors()

    "hi Folded guibg=NONE guifg=grey
    "hi LineNr guifg=white
    "hi CursorLineNr guifg=white

" ------------------------------------------------------------

    "{{{ PATCH COLOR FUNCTION
    " ------------------------------------------------------------
        function! Patch_colors()
"            hi User1 ctermbg=NONE guifg=#87ff5f guibg=NONE ctermfg=lightgreen
            hi User2 ctermbg=NONE guifg=white guibg=NONE 
            set laststatus=2
            set statusline=
            set statusline+=%1*\ \ Buffer:\ 
            set statusline+=%2*[%n%H%M%R%W]                         " flags and buf no
            set statusline+=%1*\ \ \ file:\ 
            set statusline+=%2*%f%*
            set statusline+=%1*\ \ \ path:\ 
            set statusline+=%2*%f%*         
            set statusline+=%1*\ \ \ type:\ 
            set statusline+=%2*%Y%*
            set statusline+=%2*\ %=
            set statusline+=%2*%10((%1*line:%2*%l,\ %1*col:%2*%c)%)\ " line and column
        endfunction
    " ------------------------------------------------------------
    "}}}
    
    "{{{ STATUSLINE
    " ------------------------------------------------------------
"        hi User1 ctermbg=NONE guifg=#87ff5f guibg=NONE ctermfg=lightgreen
        hi User2 ctermbg=NONE guifg=white guibg=NONE 
        set laststatus=2
        set statusline=
        set statusline+=%1*\ \ Buffer:\ 
        set statusline+=%2*[%n%H%M%R%W]                         " flags and buf no
        set statusline+=%1*\ \ \ file:\ 
        set statusline+=%2*%f%*
        set statusline+=%1*\ \ \ path:\ 
        set statusline+=%2*%f%*         
        set statusline+=%1*\ \ \ type:\ 
        set statusline+=%2*%Y%*
        set statusline+=%2*\ %= 
        set statusline+=%2*%10((%1*line:%2*%l,\ %1*col:%2*%c)%)\ " line and column
    " ------------------------------------------------------------
    "}}}
    
    "{{{ FOLDING
    " ------------------------------------------------------------
        set foldlevel=0
        set foldmethod=marker
        set modelines=1

        "{{{ MARKDOWN FOLDING
        " ------------------------------------------------------------
            function! MarkdownLevel()
                if getline(v:lnum) =~ '^# .*$'
                    return ">1"
                endif
                if getline(v:lnum) =~ '^## .*$'
                    return ">2"
                endif
                if getline(v:lnum) =~ '^### .*$'
                    return ">3"
                endif
                if getline(v:lnum) =~ '^#### .*$'
                    return ">4"
                endif
                if getline(v:lnum) =~ '^##### .*$'
                    return ">5"
                endif
                if getline(v:lnum) =~ '^###### .*$'
                    return ">6"
                endif
                return "=" 
            endfunction
            au BufEnter *.md setlocal foldexpr=MarkdownLevel()  
            au BufEnter *.md setlocal foldmethod=expr
        " ------------------------------------------------------------
        "}}}
    "}}}
"}}}
"export FZF_BASE=/usr/local/bin/fzf


"nnoremap <silent> <Leader>C :call fzf#run({
"\   'source':
"\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
"\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
"\   'sink':    'colo',
"\   'options': '+m',
"\   'left':    30
"\ })<CR>

" Open files in horizontal split
nnoremap <silent> <Leader>s :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>

" Open files in vertical horizontal split
nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>

" function! s:buflist()
"   redir => ls
"   silent ls
"   redir END
"   return split(ls, '\n')
" endfunction
" 
" function! s:bufopen(e)
"   execute 'buffer' matchstr(a:e, '^[ 0-9]*')
" endfunction
" 
" nnoremap <silent> <Leader><Enter> :call fzf#run({
" \   'source':  reverse(<sid>buflist()),
" \   'sink':    function('<sid>bufopen'),
" \   'options': '+m',
" \   'down':    len(<sid>buflist()) + 2
" \ })<CR>


