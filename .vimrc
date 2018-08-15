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
  Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
  Plug 'https://github.com/tpope/vim-surround'
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
  let g:livepreview_previewer = 'open -a Skim'

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
nnoremap <F8> :r!date <CR>
