	" Plugins_Included:
	" 	>bash_ide http://www.vim.org/scripts/script.php?script_id=365
	" 	 Version: 3.1.1
	" 	 :help bashsupport
	"
	" 	>c_ide 	http://www.vim.org/scripts/script.php?script_id=213
	" 	 Version: 5.10
	" 	 :help csupport
	"
	" 	>perl_ide http://www.vim.org/scripts/script.php?script_id=556
	" 	Version: 4.8
	" 	:help perlsupport
	"
	"	alternative yu machtit
	"	https://github.com/andymass/vim-matchup	
	" 	>matchit   http://www.vim.org/scripts/script.php?script_id=39
	" 	 Version: 1.13.2
	" 	 :help matchit
	"
	" 	>mru   http://www.vim.org/scripts/script.php?script_id=521 	
	" 	 Version: 3.3
	"    :help mru
	"
	" 	>NERD_Tree 
	" 	 http://www.vim.org/scripts/script.php?script_id=1658
	" 	 Version: 4.1.0
	" 	 :help nerdtree
	"
	"
	" 	>snipMate 
	" 	 http://www.vim.org/scripts/script.php?script_id=2540
	" 	 Version: 0.83
	"    :help	sniptmate
	"
	" 	>surround  
	" 	 http://www.vim.org/scripts/script.php?script_id=1697
	" 	 Version: 1.90
	" 	 :help surround
	"
	"
	" 	>tComment  
	" 	 http://www.vim.org/scripts/script.php?script_id=1173 
	"	 Version: 1.10
	"	 Hilfe unter Link oben
	"
	"	>vim-fuzzyfinder    
	"	 http://www.vim.org/scripts/script.php?script_id=1984
	"	 Version: 3.5
	"	 :help fuzzyfinder
	"
	"
	" 	>latex-suite
	"	http://vim-latex.sourceforge.net/index.php?subject=download&title=Download
	" 	Version: 1.8.23
	" 	:help latex-suite.txt
	"
	" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
	" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
	" you can find below.  If you wish to change any of those settings, you should
		" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
	" everytime an upgrade of the vim packages is performed.  It is recommended to
	" make changes after sourcing debian.vim since it alters the value of the
	" 'compatible' option.

	" This line should not be removed as it ensures that various options are
	" properly set to work with the Vim-related packages available in Debian.
	runtime! debian.vim


	" Uncomment the next line to make Vim more Vi-compatible
	" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
	" options, so any other options should be set AFTER setting 'compatible'.
	"set compatible

	" Vim5 and later versions support syntax highlighting. Uncommenting the next
	" line enables syntax highlighting by default.
	syntax on

	" So we don't have to reach for escape to leave insert mode. mai'20:
	inoremap jf <esc>
	inoremap fj <esc>

	" Uncomment the following to have Vim jump to the last position when
	" reopening a file
	if has("autocmd")
	  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
		\| exe "normal! g'\"" | endif
	endif

	" Uncomment the following to have Vim load indentation rules according to the
	" detected filetype. Per default Debian Vim only load filetype specific
	" plugins.
	if has("autocmd")
	  filetype indent on

	  " tj 25.08.2009 bis vor endif
	 
	  " Enable file type detection.
	  " Use the default filetype settings, so that mail gets 'tw' set to 72,
	  " 'cindent' is on in C files, etc.
	  " Also load indent files, to automatically do language-dependent indenting.
	  filetype plugin indent on

	  " Put these in an autocmd group, so that we can delete them easily.
	  augroup vimrcEx
	  au!

	  " For all text files set 'textwidth' to 78 characters.
	  " TJ 30.08.09 auskommentiert, da kein Zeilenumbruch gewuescht
	  autocmd FileType text setlocal textwidth=64

	  " When editing a file, always jump to the last known cursor position.
	  " Don't do it when the position is invalid or when inside an event handler
	  " (happens when dropping a file on gvim).
	  autocmd BufReadPost *
				  \ if line("'\"") > 0 && line("'\"") <= line("$") |
				  \   exe "normal! g`\"" |
				  \ endif

	  " TJ 27.08.2009 Ergaenzungen zu einem Wiki

	  autocmd BufWritePost /home/tjard/share/wiki/* :helptags /home/tjard/share/wiki
	  autocmd BufWritePost /home/tjard/share/studium/perl/dok/* :helptags /home/tjard/share/studium/perl/dok

	  autocmd FileType text syn match TextTag "\*[a-zA-Z0-9_]*\*"
	  autocmd FileType text syn match TextJump "|[a-zA-Z0-9_]*|"
	 
		" Tj 29.09.2009
		autocmd filetype plugin on

	  augroup END

	else

	  set autoindent		" always set autoindenting on

	endif

	" The following are commented out as they cause vim to behave a lot
	" differently from regular Vi. They are highly recommended though.
	set showcmd		" Show (partial) command in status line.
	set showmatch		" Show matching brackets.
	set ignorecase		" Do case insensitive matching
	set smartcase		" Do smart case matching
	set incsearch		" Incremental search
	set autowrite		" Automatically save before commands like :next and :make
	set hidden             " Hide buffers when they are abandoned
	set mouse=a		" Enable mouse usage (all modes) in terminals

	"setzt die Farben im Terminal auf 256
	set t_Co=256

	" turn on this option as well
	set background=dark
	"
	" Source a global configuration file if available
	" XXX Deprecated, please move your changes here in /etc/vim/vimrc
	"if filereadable("/etc/vim/vimrc.local")
	" xsource /etc/vim/vimrc.local
	"xendif
	" xOptionen eingefuegt von tj am 11.12.2008
	" nach tuturial
	" colorscheme peachpuff
	" colorscheme mayansmoke
	" colorscheme sand 
	" colorscheme proton
	" pyte ist leicht grau-blau. Nicht so toll
	" colorscheme pyte
	" colorscheme ir_black
	"
	" zenburn: schön, dunkel, warm, graphit 
	" colorscheme zenburn

	" gruvbox ganz wunderbar
	" https://github.com/morhetz/gruvbox
	" colorscheme gruvbox
	let g:gruvbox_contrast_dark='soft'
	let g:gruvbox_contrast_light='hard'
	autocmd vimenter * colorscheme gruvbox
	
" TJ 25.08.2009 Ergaenzungen von tJ
set number
set smartindent
set shiftwidth=4	" Wieviel Buchstaben einruecken
set ts=4		" Sprungweite der Tabs

" TJ 27.08.2009 Ergaenzungen zu einem Wiki
" set tags=/home/tjard/share/wiki/tags;./tags;tags;/.
" set tags=/home/tjard/share/wiki/tags;/home/tjard/share/studium/perl/dok/tags;./tags;tags;/.

" TJ 27.08.2009 
" von http://ifacethoughts.net/2008/05/02/vim-as-a-personal-wiki/

au BufRead,BufNewFile *.txt set filetype=text
hi def link TextTag String
hi def link TextJump Comment

" Tj 29.08.2009
set hlsearch

" font
"
" set guifont=Bitstream\ Vera\ Sans\ Mono:h15
set guioptions-=T

set guifont=FreeMono:h18
set gfn=FreeMono\ 12
" set gfn=MONACO\ 12
"
" tj 02.07.2010
" Pixel zwischen den Zeilen
set linespace=4


" tj 29.06.2010
" Zeilen, oben & unten, die Settings modifizieren
set modelines=2

" tj 20.02.2011
" xdvi mit latex-suite: inverse searches
" dazu gvim mit --servername xdvi starten
" let g:Tex_ViewRule_dvi = 'xdvi -editor 
" gvim --servername xdvi --remote +\%l \%f" $* &'
" let g:Tex_ViewRuleComplete_dvi = 'xdvi -editor 
set nowrap

" gvim --servername xdvi --remote +\%l \%f" $* &'
