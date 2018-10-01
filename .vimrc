" vimrc file customised by Ty Yiu.
" Performance improvements

  set synmaxcol=200 "Don't bother highlighting anything over 200 chars
  let did_install_default_menus = 1 "No point loading gvim menu stuff
  let loaded_matchparen = 1 "highlighting matching pairs so slow

" defining <Leader> key
  let mapleader = ","

" ------------------------------------------------------------
" PLUG plugin manager
" ------------------------------------------------------------

  call plug#begin('~/.vim/plugged')
  Plug 'https://github.com/junegunn/goyo.vim'
  Plug 'https://github.com/ryanoasis/vim-devicons'
  Plug 'https://github.com/liuchengxu/space-vim-dark'
  " Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
  Plug 'https://github.com/tpope/vim-surround'
  Plug 'https://github.com/kien/ctrlp.vim'
  Plug 'https://github.com/ervandew/supertab'
  Plug 'vimwiki/vimwiki'
  Plug 'https://github.com/jonhiggs/MacDict.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'shmargum/vim-sass-colors'
  call plug#end()


" ------------------------------------------------------------
" Pathogen Plugin manager
" ------------------------------------------------------------

  execute pathogen#infect()

" ------------------------------------------------------------
" Image Previews
" ------------------------------------------------------------
  autocmd BufEnter *.png,*.jpg,*gif exec "! ~/.iterm2/imgcat ".expand("%") | :bw


" ------------------------------------------------------------
"  CTRL-P
" ------------------------------------------------------------
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|^.git$\|_site'


" ------------------------------------------------------------
" NERDTree
"------------------------------------------------------------

" map toggle
  map <C-n> :NERDTreeToggle<CR>
  
" open NERDTree on vim load

  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  
" close vim if NERDTree is only instance

  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  
" Nerdtree minimal UI

  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
  
" ------------------------------------------------------------
" Vimwiki Setup
" ------------------------------------------------------------

"let wiki_1 = {}
"let wiki_1.path = '~/Documents/la_bibliotheque/notes/'
"let wiki_1.path_html = '~/Documents/la_bibliotheque/notes/html/'
"let wiki_1.custom_wiki2html= '~/code/bash/wiki2html.sh'
"let wiki_1.syntax = 'markdown'
"let wiki_1.ext = '.md'
let wiki_2 = {}
let wiki_2.path = '~/Documents/Uni/'
let wiki_2.path_html = '~/Documents/Uni/html/'
"let wiki_2.syntax = 'markdown'
"let wiki_2.ext = '.md'
let g:vimwiki_list = [wiki_2]
" {'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}


" ------------------------------------------------------------
" GENERALS
" ------------------------------------------------------------
" Goyo toggle
  map <C-g> :Goyo<CR>

" hybrid line numbers

  set number relativenumber
  set nocompatible
  filetype plugin on
  syntax enable 
  filetype plugin indent on
  runtime! ftplugin/man.vim

" encoding declaration for vim-devicons
  set encoding=UTF-8
" more natural splitopening for vim split panes

  set splitbelow
  set splitright

" Tabs over spaces

  set shiftwidth=2 
  set softtabstop=2 
  set expandtab

" Folding

  let g:markdown_folding = 1
  set foldcolumn=2
  set foldmethod=indent  
  let g:custom_foldtext_max_width = 80

" vim-markdown-preview

  let vim_markdown_preview_hotkey='<leader>m'
  let vim_markdown_preview_browser='Google Chrome'
  let vim_markdown_preview_github=1
  let vim_markdown_preview_pandoc=0

" LaTeX pdf preview
"  let g:livepreview_previewer = 'open -a Skim'

" ------------------------------------------------------------
" MAPPING
" ------------------------------------------------------------

" remapping vim pane movement

  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>

" remapping +register copy/pasting
  set clipboard=unnamed

" ------------------------------------------------------------
" THEMING
" ------------------------------------------------------------

  " This fixes reloading issues had with exiting GoYo
  " Goyo reloads the colorscheme on exit and custom changes are not applied
  " anymore
  function! s:patch_colors()
    hi Normal guibg=NONE ctermbg=NONE
    hi LineNr ctermbg=NONE
    hi Folded ctermbg=NONE
    hi FoldColumn ctermbg=NONE

  endfunction

  autocmd! ColorScheme space-vim-dark call s:patch_colors()

" Colorscheme
  colorscheme space-vim-dark
  hi LineNr ctermbg=NONE
  hi Folded ctermbg=NONE
  hi FoldColumn ctermbg=NONE
  hi Comment guifg=#5C6370 ctermfg=59
  let g:space_vim_dark_background = 233 
  color space-vim-dark
  hi Normal guibg=NONE ctermbg=NONE
  
" ------------------------------------------------------------
" Snippets
" ------------------------------------------------------------
"nnoremap <F8> :r!date <CR>
" nnoremap <C-I> :r ~/code/snippets 
set spelllang=en
set spellfile=$HOME/Dropbox/vim/spell/en.utf-8.add



" ------------------------------------------------------------
" JEKYLL SETUP
" ------------------------------------------------------------

" YAML highlighting

" ---------------------
function! MathAndLiquid()
    "" Define certain regions
    " Block math. Look for "$$[anything]$$"
    syn region math start=/\$\$/ end=/\$\$/
    " inline math. Look for "$[not $][anything]$"
    syn match math_block '\$[^$].\{-}\$'

    " Liquid single line. Look for "{%[anything]%}"
    syn match liquid '{%.*%}'
    " Liquid multiline. Look for "{%[anything]%}[anything]{%[anything]%}"
    syn region highlight_block start='{% highlight .*%}' end='{%.*%}'
    " Fenced code blocks, used in GitHub Flavored Markdown (GFM)
    syn region highlight_block start='```' end='```'

    "" Actually highlight those regions.
    hi link math Statement
    hi link liquid Statement
    hi link highlight_block Function
    hi link math_block Function
endfunction

" Call everytime we open a Markdown file
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()
