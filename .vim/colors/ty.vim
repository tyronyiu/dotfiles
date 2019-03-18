
" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ty Yiu <Tysinstances@gmail.com>
" Last Change:	2019 March 11

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "Ty's Markdown Syntax-scheme"

hi Normal		guifg=grey                                    ctermfg=grey          ctermbg=none
hi NonText		guifg=darkGray                                ctermfg=darkGray      ctermbg=none
hi comment		guifg=gray		                gui=bold      ctermfg=gray          ctermbg=none      
hi constant		guifg=cyan		                              ctermfg=cyan
hi identifier	guifg=gray		                              ctermfg=red
hi statement	guifg=white		                gui=none      ctermfg=white         ctermbg=darkBlue  
hi preproc		guifg=green		                              ctermfg=green
hi type			guifg=orange	                              ctermfg=lightRed      ctermbg=darkBlue
hi special		guifg=magenta	                              ctermfg=lightMagenta  ctermbg=darkBlue
hi Underlined	guifg=cyan		                gui=underline ctermfg=cyan                              cterm=underline
hi label		guifg=yellow	                              ctermfg=yellow
hi operator		guifg=orange                    gui=bold      ctermfg=lightRed	    ctermbg=darkBlue  
hi delimiter    guifg=darkGray                                ctermfg=darkGray      ctermbg=none

hi Italic       guifg=lightGrey                               ctermfg=lightGrey                         cterm=bold
hi Bold         guifg=white                                   ctermfg=white                             cterm=bold

hi ErrorMsg		guifg=orange	 guibg=darkBlue               ctermfg=lightRed
hi WarningMsg	guifg=cyan		 guibg=darkBlue gui=bold      ctermfg=cyan	    
hi ModeMsg		guifg=lightGreen     	        gui=NONE      ctermfg=lightGreen  
hi MoreMsg		guifg=lightGreen     	        gui=NONE      ctermfg=lightGreen  
hi Error		guifg=red		 guibg=darkBlue gui=underline ctermfg=red         

hi Todo			guifg=black		 guibg=orange                 ctermfg=black	        ctermbg=darkYellow
hi Cursor		guifg=black		 guibg=white	              ctermfg=black	        ctermbg=white
hi Search		guifg=black		 guibg=orange                 ctermfg=black         ctermbg=darkYellow
hi IncSearch	guifg=black		 guibg=yellow                 ctermfg=black         ctermbg=darkYellow
hi LineNr		guifg=darkGray                                ctermfg=darkGray      ctermbg=none 
hi CursorLineNr guifg=white                                   ctermfg=white         ctermbg=NONE         cterm=bold
hi Title		guifg=white	                    gui=bold                                     	        cterm=bold   
"guibg=darkGray ctermbg=darkGray

hi StatusLineNC	guifg=black     guibg=blue      gui=NONE	  ctermfg=black         ctermbg=blue
hi StatusLine	guifg=cyan	    guibg=blue      gui=bold	  ctermfg=cyan          ctermbg=blue
hi VertSplit	guifg=blue	    guibg=blue      gui=none	  ctermfg=blue	        ctermbg=blue

hi Visual	    guifg=black		guibg=darkCyan	              ctermfg=black	        ctermbg=darkCyan			            term=reverse

hi DiffChange	guifg=black     guibg=darkGreen			      ctermfg=black         ctermbg=darkGreen	
hi DiffText		guifg=black     guibg=olivedrab			      ctermfg=black         ctermbg=lightGreen	
hi DiffAdd		guifg=black     guibg=slateblue			      ctermfg=black         ctermbg=blue		
hi DiffDelete   guifg=black     guibg=coral				      ctermfg=black         ctermbg=cyan		

hi Folded		guifg=lightGrey guibg=black                   ctermfg=black         ctermbg=none         cterm=bold
hi FoldColumn	guifg=lightGrey guibg=black                   ctermfg=black         ctermbg=none         cterm=bold 
hi Rule         guifg=lightGray                               ctermfg=lightGray     ctermbg=none
hi cIf0			guifg=gray			                          ctermfg=gray
hi Comment      guifg=grey      guibg=NONE                    ctermfg=grey          ctermbg=NONE

hi SpellBad     guifg=red       guibg=NONE                    ctermfg=red           ctermbg=NONE 
