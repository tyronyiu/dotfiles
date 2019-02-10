" GENERALS{{{
" ------------------------------------------------------------
" hybrid line numbers
  set number relativenumber
  set nocompatible
  filetype plugin on
  syntax enable 
  filetype plugin indent on
  runtime! ftplugin/man.vim
  au BufRead,BufNewFile *.md setlocal textwidth=80

" encoding declaration for vim-devicons
  set encoding=UTF-8
" more natural splitopening for vim split panes
  set splitbelow
  set splitright

" Tabs over spaces{{{
" ------------------------------------------------------------
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set autoindent
    set textwidth=80
"}}}

" Performance improvements{{{
" ------------------------------------------------------------
  set synmaxcol=200 "Don't bother highlighting anything over 200 chars
  let did_install_default_menus = 1 "No point loading gvim menu stuff
  let loaded_matchparen = 1 "highlighting matching pairs so slow
  "}}}

" Defining <Leader> key{{{
" ------------------------------------------------------------
  let mapleader = ","
"}}}
"
"}}}

" MAPPING{{{
" ------------------------------------------------------------
" remapping vim pane movement
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

" remapping +register copy/pasting
    set clipboard=unnamed

" ------------------------------------------------------------

" qmacro: "0"ayt $B"syt|A=a*sjA| "

    inoremap <Space><Space> <Esc>/<Enter>"_c4l
    autocmd FileType html inoremap ;div <div></div><++><Esc>FdT>i
    autocmd FileType html inoremap ;header <header></header><++><Esc>FhT>i
    autocmd FileType html inoremap ;h1 <h1></h1><++><Esc>FhT>i
    autocmd FileType html inoremap ;h2 <h2></h2><++><Esc>FhT>i
    autocmd FileType html inoremap ;h3 <h3></h3><++><Esc>FhT>i
    autocmd FileType html inoremap ;a <a href="#"></a>><++><Esc>FaT>i
    autocmd FileType html inoremap ;sec <section></section><++><Esc>FsT>i
"}}}
  
" Snippets{{{
" ------------------------------------------------------------
    "nnoremap <F8> :r!date <CR>
    " nnoremap <C-I> :r ~/code/snippets 
    set spelllang=en
    set spellfile=$HOME/Dropbox/vim/spell/en.utf-8.add
"}}}

" YAML highlighting{{{
" ------------------------------------------------------------

"function! MathAndLiquid()
    "" Define certain regions
    " Block math. Look for "$$[anything]$$"
"    syn region math start=/\$\$/ end=/\$\$/
    " inline math. Look for "$[not $][anything]$"
"    syn match math_block '\$[^$].\{-}\$'

    " Liquid single line. Look for "{%[anything]%}"
"    syn match liquid '{%.*%}'
    " Liquid multiline. Look for "{%[anything]%}[anything]{%[anything]%}"
"    syn region highlight_block start='{% highlight .*%}' end='{%.*%}'
    " Fenced code blocks, used in GitHub Flavored Markdown (GFM)
"    syn region highlight_block start='```' end='```'

    "" Actually highlight those regions.
"    hi link math Statement
"    hi link liquid Statement
"    hi link highlight_block Function
"    hi link math_block Function
"endfunction

" Call everytime we open a Markdown file
"autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()
"}}}

" IndentLine {{{
" ------------------------------------------------------------
let g:indentLine_char = '┆'
let g:indentLine_first_char = '┆'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}}

" Searching {{{
" ------------------------------------------------------------
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}

" Folding {{{
" ------------------------------------------------------------
 set foldlevel=0
 set foldmethod=marker
 set modelines=1
" }}}

" PLUG plugin manager{{{
" ------------------------------------------------------------

  call plug#begin('~/.vim/plugged')
  Plug 'https://github.com/junegunn/goyo.vim'
  Plug 'https://github.com/ryanoasis/vim-devicons'
  " Plug 'https://github.com/liuchengxu/space-vim-dark'
  " Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
  Plug 'https://github.com/tpope/vim-surround'
  " Plug 'https://github.com/kien/ctrlp.vim'
  Plug 'https://github.com/ervandew/supertab'
  " Plug 'vimwiki/vimwiki'
  " Plug 'https://github.com/jonhiggs/MacDict.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'shmargum/vim-sass-colors'
  " Plug 'ayu-theme/ayu-vim'
  " Plug 'Yggdroot/indentLine'
  Plug 'junegunn/vim-easy-align'
  Plug 'whatyouhide/vim-gotham'
  " Plug 'mcchrish/nnn.vim'
  "Plug 'https://github.com/junegunn/limelight.vim.git'
  call plug#end()

"}}}

" Easy Align-Plugin{{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}

"  CTRL-P{{{
" ------------------------------------------------------------
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|^.git$\|_site'
"}}}

" NERDTree{{{
"------------------------------------------------------------
" map toggle
    map <C-n> :NERDTreeToggle<CR>
" open NERDTree on vim load
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if NERDTree is only instance
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Nerdtree minimal UI
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1
  "}}}
  
" GOYO-Plugin{{{
" ------------------------------------------------------------
    map <C-g> :Goyo<CR>
    let g:goyo_linenr = 1
    let g:limelight_conceal_ctermfg = 'gray'
    function! s:goyo_enter()
     " silent !tmux set status off
      silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
      set noshowmode
      set noshowcmd
      let b:quitting = 0
      let b:quitting_bang = 0
      autocmd QuitPre <buffer> let b:quitting = 1
      cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q! set scrolloff=999
      call Patch_colors()
      " ...
    endfunction

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
      " ...
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()

"}}}
  
" Vimwiki Setup{{{
" ------------------------------------------------------------
    "let wiki_1 = {}
    "let wiki_1.path = '~/Documents/la_bibliotheque/notes/'
    "let wiki_1.path_html = '~/Documents/la_bibliotheque/notes/html/'
    "let wiki_1.custom_wiki2html= '~/code/bash/wiki2html.sh'
    "let wiki_1.syntax = 'markdown'
    "let wiki_1.ext = '.md'
    "let wiki_2 = {}
    "let wiki_2.path = '~/repos/jekyll/Cognitiones/_posts'
    "let wiki_2.path_html = '~/repos/jekyll/Cognitiones/_html/'
    "let wiki_2.syntax = 'markdown'
    "let wiki_2.ext = '.md'
    "let g:vimwiki_list = [wiki_2]
    " {'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}
"}}}
  
" Pathogen Plugin manager{{{
" ------------------------------------------------------------
    execute pathogen#infect()
"}}}

" Image Previews{{{
" ------------------------------------------------------------
    autocmd BufEnter *.png,*.jpg,*gif exec "! ~/.iterm2/imgcat ".expand("%") | :bw
"}}}

"Auto Commands{{{
" ------------------------------------------------------------
    autocmd BufWritePost *Users/tyyiu/Uni/* silent! ! ~/bin/syncer.sh 
"    autocmd BufWritePost * ! ~/bin/syncer.sh 
"}}}

" THEMING{{{
" ------------------------------------------------------------
    set termguicolors
    "colorscheme gotham

  hi Normal guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE guifg=lightgreen ctermfg=lightgreen
  hi Folded guibg=NONE ctermbg=NONE ctermfg=grey
  hi FoldColumn guibg=NONE ctermbg=NONE ctermfg=grey
  hi CursorLineNr ctermfg=white ctermbg=NONE
  hi Comment guibg=NONE guifg=grey ctermbg=NONE ctermfg=grey
  

  function! Patch_colors()
    hi Normal guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE guifg=lightgreen ctermfg=lightgreen
    hi Folded guibg=NONE ctermbg=NONE ctermfg=grey
    hi FoldColumn guibg=NONE ctermbg=NONE ctermfg=grey
    hi CursorLineNr ctermfg=white ctermbg=NONE
    hi Comment guibg=NONE guifg=grey ctermbg=NONE ctermfg=grey
    hi StatusLine guibg=NONE ctermbg=NONE
    hi User1 ctermbg=NONE guifg=#87ff5f guibg=NONE ctermfg=lightgreen
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

    "autocmd! colorscheme gotham call Patch_colors()

" STATUSLINE{{{
" ------------------------------------------------------------
hi StatusLine guibg=NONE ctermbg=NONE
hi User1 ctermbg=NONE guifg=#87ff5f guibg=NONE ctermfg=lightgreen
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

"}}}

"}}}

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

