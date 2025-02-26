

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Amir Salihefendic
"       http://amix.dk - [email protected]
"
" Version:
"       5.0 - 29/05/12 15:43:36
"
" Blog_post:
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version:
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible               " be iMproved
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Plugin here:

" plugin to autoconvert gui colorschemes to terminal
Plugin 'vim-scripts/csapprox'
let g:CSApprox_konsole=1
 
" smart pane switching with awareness of tmux
"Plugin 'christoomey/vim-tmux-navigator'

"Plugin 'fholgado/minibufexpl.vim'

Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std=1
autocmd VimEnter * if argc() == 0 && !exists('s:std') | NERDTree | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif


Plugin 'vim-latex/vim-latex'

Plugin 'L9'
"Plugin 'FuzzyFinder'
"Plugin 'vim-scripts/FuzzyFinder'
Plugin 'ctrlpvim/ctrlp.vim'

"Plugin 'vim-scripts/MatlabFilesEdition'

Plugin 'Chiel92/vim-autoformat'
"let g:formatterpath = ['/home/seid_da/packages/black']
"let g:formatterpath = ['/opt/python/$DLRRM_HOST_PLATFORM/python3/default/bin/black']
let g:formatterpath = ['/opt/python/osl155-x86_64/python3/default/bin']
let g:formatters_python = ['black']
"let g:formatdef_black = 'black -l 127'

"let g:formatter_yapf_style = 'google'
"let s:configfile_def   = "'yapf -l '.a:firstline.'-'.a:lastline"
"let s:noconfigfile_def = "'yapf --style=\"{based_on_style:'.g:formatter_yapf_style.',indent_width:'.&shiftwidth.(&textwidth ? ',column_limit:'.&textwidth : '').'}\" -l '.a:firstline.'-'.a:lastline"
"let g:formatdef_yapf   = "g:YAPFFormatConfigFileExists() ? (" . s:configfile_def . ") : (" . s:noconfigfile_def . ")"


Plugin 'bling/vim-airline'

Plugin 'ericcurtin/CurtineIncSw.vim'

" Conque Shell with error fix 
"Plugin 'jewes/Conque-Shell'
"Plugin 'https://github.com/oplatek/Conque-Shell'
"au BufReadPre FILETYPE au! PluginNotes
"au BufReadPre FILETYPE au! PluginXoloxMisc

" needs vim >= 7.3
"Plugin  'klen/python-mode'
Plugin 'tmhedberg/SimpylFold'

"Plugin 'tpope/vim-eunuch'
"Plugin 'vim-scripts/vim-eunuch'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on 
filetype indent on    " required
" To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
"filetype plugin on
"filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
"let mapleader = ","
"let g:mapleader = ","
let mapleader = " "
let g:mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" deleting
imap <C-BS> <C-W>
"imap <C-BS> <C-O>cb
"imap <C-B> <C-O>cb

imap <C-Del> <C-O>dw
"imap <C-W> <C-O>dw


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" disable beep and bell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" autochange dir to current file
set autochdir

" smaller command line
set cmdheight=1

" set path for find
"set path=$PWD/**

" map autoformat
noremap <F3> :Autoformat<CR>

" switch between source/header: https://www.vim.org/scripts/script.php?script_id=5545
map <C-_> :call CurtineIncSw() <CR> 
"map <F5> :call CurtineIncSw() <CR> 

" tab label with tab number
"if has("gui_running")
    "set gtl=[%N]\ %t\ %M
"endif

" Enable folding
set foldmethod=indent
set foldlevel=99


" Spell Checking
set spell
set dictionary="/usr/dict/words"

function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>


" copy also to system clipboard [needs newer vim version]
"set clipboard=unnamed
set clipboard=unnamedplus

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
"vnoremap <C-P> "_dP
vnoremap <leader>p "_dP

" yank/delete without linebreak
noremap <C-Y> 0vg_y
noremap <C-D> 0vg_d

" minibufexplorer MBE
let g:miniBufExplSplitBelow=0
" Turn off slow duplicate buffer name check; see the issue:
"      https://github.com/fholgado/minibufexpl.vim/issues/6
let g:miniBufExplCheckDupeBufs = 0
"" Single-click to select buffers.
let g:miniBufExplUseSingleClick = 1
"" Force syntax highlighting to enabled; works around a bug where syntax
"" highlighting starts out disabled in some buffers.
let g:miniBufExplForceSyntaxEnable = 1
"" Try to ensure that MiniBufExplorer doesn't split a tabname between multiple
"" lines.
let g:miniBufExplTabWrap = 1


" MiniBufExpl Colors
"hi MBENormal               guifg=#808080 guibg=fg
"hi MBEChanged              guifg=#CD5907 guibg=fg
"hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
"hi MBEVisibleChanged       guifg=#F1266F guibg=fg
"hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
"hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

" airline
" :help airline-custimization
let g:airline_section_x = ''
let g:airline_section_z = 'C%c : L%l/%L : %{WordCount()}W : %P'
let g:airline_section_warning = ''

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => vim-latex
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Latex suite
"" IMPORTANT: grep will sometimes skip displaying the file name if you
"" search in a singe file. This will confuse Latex-Suite. Set your grep
"" program to always generate a file-name.
"set grepprg=grep\ -nH\ $*

"" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
"" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
"" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"" settings
let g:Tex_Leader=','
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'okular --unique'
let g:Tex_CompileRule_pdf = 'latexmk -pdf -pdflatex="pdflatex -synctex=-1 -file-line-error -src-specials -interaction=nonstopmode $*" -silent `grep -l "\documentclass" *tex`'

"" Okular editor command
"" gvim --remote-silent +%l %f

" forward search that uses the Tex_GetMainFileName function to use the correct
" main file pdf name for include/input files
function! SyncTexForward()
let s:syncfile = fnamemodify(fnameescape(Tex_GetMainFileName()), ":r").".pdf"
let execstr = "silent !okular --unique ".s:syncfile."\\#src:".line(".").expand("%\:p").' &'
exec execstr
endfunction
nnoremap <Leader>ls :call SyncTexForward()<CR>


" Tex_GetMainFileName requries a <main_tex_file>.latexmain file to be present to find the correct file
" Press \ll to compile in pdf, \lv to open pdf with ocular, \ls to forward search from gvim to okular.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => python-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" already enabled at other place
"filetype plugin indent on
"syntax on
"let g:pymode_rope_complete_on_dot = 0




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Save window size and position
set sessionoptions+=resize,winpos

" Set 7 lines to the cursor - when moving vertically using j/k
set so=10

" Turn on the WiLd menu
set wildmode=list:longest,full
set wildmenu

" full mouse support in console
set mouse=a

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
"set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on

" Enable line numbers
set number

set background=dark
set t_Co=256

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
"set termguicolors
"colorscheme slate
colorscheme bla


" Set extra options when running in GUI mode
"if has("gui_running")
"set guioptions+=T
"set guioptions+=e
"set guioptions+=m
"set t_Co=256
"endif

function! ToggleGUICruft()
    if &guioptions=='ir'
        exec('set guioptions=imTrL')
    else
        exec('set guioptions=ir')
    endif
endfunction

map <F11> <Esc>:call ToggleGUICruft()<cr>

" by default, hide gui menus
set guioptions=ir


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set nocp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set wrap
set linebreak
set nolist  " list disables linebreak
set tw=0
"set tw=115

"set autoindent "Auto indent
set smartindent "Smart indent

if exists('+colorcolumn')
    set colorcolumn=80
    highlight ColorColumn ctermbg=0
    "highlight ColorColumn guibg=Black
    highlight ColorColumn guibg=#202020
    "else
    "au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
    "set colorcolumn=0
endif


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

map <DOWN> gj
map <UP> gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
"map <C-h> <C-W>h
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-l> <C-W>l

" open split panes to the right and to bottom (more naturally)
set splitbelow
set splitright

" Close the current buffer
"map <leader>bd :Bclose<cr>
map <leader>db :Bclose<cr>

" Close all the buffers
"map <leader>ba :1,1000 bd!<cr>

" quick reference for all open buffers
map <F1> :ls<cr>

" quck jump between buffers
map <F2> :ls<CR>:b<Space>
"map <leader>b :ls<CR>:b<Space>
map <leader>B :ls<CR>:b<Space>
"map gb <C-^>

" Fuzzy Finder bindings
"map <leader>f :FufFile **/<CR>
"map <leader>b :FufBuffer<C-M>

" CtrlP bindings
map <leader>f :CtrlP **/<CR>
map <leader>b :CtrlPBuffer<C-M>


" Useful mappings for managing tabs
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
"map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
"map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    "set stal=1
    set showtabline=1
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" Remember info about open buffers on close
"set viminfo^=%
"set viminfo=%,'100,<500,s10,h

function! LucCheckIfBufferIsNew(...)
  " check if the buffer with number a:1 is new.  That is to say, if it as
  " no name and is empty.  If a:1 is not supplied 1 is used.
  " find the buffer nr to check
  let number = a:0 ? a:1 : 1
  " save current and alternative buffer
  let current = bufnr('%')
  let alternative = bufnr('#')
  let value = 0
  " check buffer name
  if bufexists(number) && bufname(number) == ''
    silent! execute 'buffer' number
    let value = line('$') == 1 && getline(1) == '' ? 1 : 0
    silent! execute 'buffer' alternative
    silent! execute 'buffer' current
  endif
  return value
endfunction
"autocmd VimEnter * if LucCheckIfBufferIsNew(1) | bwipeout 1 | endif 
autocmd VimEnter * if LucCheckIfBufferIsNew(1) | bwipeout 1 | 
\ doautocmd BufRead,BufNewFile | endif 


" bufferline settings
"let g:bufferline_modified = '*'
"let g:bufferline_active_highlight = 'StatusLine'
"let g:bufferline_echo = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Here begins my automated wordcount addition.
" This combines several ideas from:
" http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:word_count="<unknown>"

"if !exists("*WordCount")
    function! WordCount()
        return g:word_count
    endfunction
"endif

"if !exists("*UpdateWordCount")
    function! UpdateWordCount()
        let lnum = 1
        let n = 0
        while lnum <= line('$')
            let n = n + len(split(getline(lnum)))
            let lnum = lnum + 1
        endwhile
        let g:word_count = n
    endfunction
"endif

" Update the count when cursor is idle in command or insert mode.
" Update when idle for 1000 msec (default is 4000 msec).
set updatetime=1000
augroup WordCounter
    au! CursorHold,CursorHoldI * call UpdateWordCount()
augroup END

" Set statusline, shown here a piece at a time
"highlight User1 ctermbg=green guibg=green ctermfg=black guifg=black
set statusline=%1*			" Switch to User1 color highlight

"set statusline=%f       "tail of the filename
set statusline+=[%<%F]			" file name, cut if needed at start

"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
"set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
"set statusline+=%y      "filetype
set statusline+=%=  	"separator from left to right justified
set statusline+=\C  	"col text
set statusline+=\ %c,   "cursor column
set statusline+=\ %{WordCount()}\ W, "word count
set statusline+=\ %l/%L\ L,  "cursor line/total lines
set statusline+=\ %P    "percent through file


" Always show the status line
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
"map <leader>cc :botright cope<cr>
"map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>o :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing <leader>ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

set nospell


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => substitute
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://vim.wikia.com/wiki/Search_and_replace_the_word_under_the_cursor
" substitute all occurrences, type bar/g and press Enter
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" automatically insert closing brackets
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
"inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
"inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

"inoremap (<TAB> ()<left>
"inoremap {<TAB> {}<left>
"inoremap [<TAB> []<left>
"inoremap '<TAB> ''<left>
"inoremap "<TAB> ""<left>
"inoremap {<CR> {<CR>}<ESC>O<TAB>
"inoremap {;<CR> {<CR>};<ESC>O<TAB>


"use 2-space yaml indentation
"autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml,yml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction


" remove all trailing whitespaces
" if !exists(":RemoveTrSpace")
command! RemoveTrSpace :%s/\s\+$//
" endif


" function for natural sorting
function! MyCompare(i1, i2)
return (a:i1 + 0) - (a:i2 + 0)
endfunc
"let sortedlist = sort(mylist, "MyCompare")



syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2

