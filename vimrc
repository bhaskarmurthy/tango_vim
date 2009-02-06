syntax on
set visualbell
set autoindent
set smartindent
set shiftwidth=2
set expandtab
set sts=2
let mapleader = ","
" two 'leaders'
map \ ,

" binds \ t to textmate-style fuzzy finder
map <leader>t :FuzzyFinderTextMate<CR>

" my grep (ack) shortcuts
set grepprg=ack
set grepformat=%f:%l:%m
map <leader>n :cnext<CR>
map <leader>N :cprev<CR>
map <leader>/ :grep 

let g:fuzzy_matching_limit=30 " this seems to help performance
let g:fuzzy_ceiling=200000     " I have some projects with a lot of files...

set pastetoggle=<F2>

" bind control-l to hashrocket
imap <C-l> <Space>=><Space>
" bind command-] to shift right
nmap <D-]> >>
vmap <D-]> >>
imap <D-]> <C-O>>>

" bind command-[ to shift left
nmap <D-[> <<
vmap <D-[> <<
imap <D-[> <C-O><<

" bind \d to toggle file browser
" requires NERDTree
nmap <leader>d :NERDTreeToggle<CR>

" bind option-space to ctrl-P (statement completion)
imap <M-Space> <C-P>

map <C-n> :tabnew<CR>
map <D-M-Left> :tabp<CR>
map <D-M-Right> :tabn<CR>
" those last two dont work in command line vim so :
map <leader>u :tabp<CR>
map <leader>i :tabn<CR>
" going to try commenting w/these keys for now
"map <D-[> :maca _cycleWindowsBackwards:<CR>
"map <D-]> :maca _cycleWindows:<CR>

" open tabs with command-<tab number>
map <D-1> :tabn 1<CR>
map <D-2> :tabn 2<CR>
map <D-3> :tabn 3<CR>
map <D-4> :tabn 4<CR>
map <D-5> :tabn 5<CR>
map <D-6> :tabn 6<CR>
map <D-7> :tabn 7<CR>
map <D-8> :tabn 8<CR>
map <D-9> :tabn 9<CR>

" window splitting mappings
" split vertically with <leader> v
" split horizontally with <leader> s
nmap <leader>v :vsplit<CR> <C-w><C-w>
nmap <leader>s :split<CR> <C-w><C-w>

" Make it way easier to switch windows (<leader>w)
nmap <leader>w <C-w><C-w>_

set cursorline
set showmatch

" If a file is larger than 10MB, do not: highlight, swap, buffer in memory, write, or support undo
" Makes it possible to rapidly examine large files
let g:LargeFile = 1024 * 1024 * 10
augroup LargeFile
autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
augroup END

" bind command-/ to toggle comment
" requires NERD Commenter to be installed: http://www.vim.org/scripts/script.php?script_id=1218
nmap <D-/> ,c<space>
vmap <D-/> ,c<space>
imap <D-/> <C-O>,c<space>

" above, see http://technicalpickles.com/posts/vimpocalypse

scriptencoding utf-8

"---------------------------------------------
" Based off of settings file for Steven Oliver
" Last Updated - 12/04/2008
"---------------------------------------------

"---------------------------------------------
" General Settings
"---------------------------------------------

" Don't be compatible with vi
set nocompatible

" Set spelling language
setlocal spell spelllang=en_us

" Enable a nice big viminfo file
set viminfo='500,f1,:500,/500
set history=200

" Make backspace delete lots of things
set backspace=indent,eol,start

" Create backups
set backup
set backupdir=$HOME/.backup/
if has('gui_win32')
    set directory=$HOME\backup\
endif

" Search options: incremental search, highlight search
set hlsearch
set incsearch

" Show full tags when doing search completion
set showfulltag

" Speed up macros
set lazyredraw

" No error noises
set noerrorbells

" Try to show at least three lines and two columns of
" context when scrolling
set scrolloff=3
set sidescrolloff=2

" Wrap and match
set whichwrap+=<,>,[,]
set matchpairs+=<:>

" Tab complete menu
set wildmenu
set wildignore+=*.o,*~,.lo
set suffixes+=.in,.a
set completeopt=longest,menuone

" Print with syntax highlighting and line numbers
set popt+=syntax:y,number:y

" Allow edit buffers to be hidden
set hidden

" 1 height windows
set winminheight=1

" By default, go for an indent of 2
set shiftwidth=2

" Do clever indent things. Don't make a #
" force column zero.
set autoindent
set smartindent

" Enable filetype settings
if has("eval")
    filetype on
    filetype plugin on
    filetype indent on
endif

" Use secure modelines
set nomodeline
let g:secure_modelines_verbose=0
let g:secure_modelines_modelines=15

" Turn off highlighting
set nohls!

" Enable folds
"if has("folding")
"set foldenable
"set foldmethod=indent
"endif

" Show us the command we're typing
set showcmd

" Highlight matching parens
set showmatch


"----------------------------------------------
" Visual Settings
"----------------------------------------------

" Set a dark background
set background=dark

" Load colorscheme
if has("eval") && has('gui_macvim')
    fun! LoadColorScheme(schemes)
        let l:schemes = a:schemes . ":"
        while l:schemes != ""
            let l:scheme = strpart(l:schemes, 0, stridx(l:schemes, ":"))
            let l:schemes = strpart(l:schemes, stridx(l:schemes, ":") + 1)
            try
                exec "colorscheme" l:scheme
                break
            catch
            endtry
        endwhile
    endfun

    if has('gui_gtk') || has('gui_win32') || has('gui_macvim')
        call LoadColorScheme("peaksea:moria:ir_black:inkpot:darkblue")
    else
        call LoadColorScheme("blue:pablo:darkblue")
    endif
endif  

" Enable syntax
if has("syntax")
    syntax on
endif

" Enable line numbers
set number

" If possible, try to use a narrow number column.
if v:version >= 700
    try
        setlocal numberwidth=3
    catch
    endtry
endif

" Nice statusbar
set laststatus=2
set statusline=
set statusline+=%2*%-3.3n%0*                    " buffer number
set statusline+=%f                              " file name
set statusline+=%h%1*%m%r%w%0*                  " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},     " filetype
set statusline+=%{&encoding},                   " encoding
set statusline+=%{&fileformat}]                 " file format
set statusline+=%=                              " right align
set statusline+=%2*0x%-8B                       " current char
set statusline+=%-14.(%l,%c%V%)                 " offset


"-----------------------------------------------------------------------
" autocmds
"-----------------------------------------------------------------------

" Always do a full syntax refresh
autocmd BufEnter * syntax sync fromstart

"---------------------------------------------
" mappings
"---------------------------------------------

" Make Space go down half a page
noremap <space> <C-d>

" Make Control+Space go up half a page
noremap <C-space> <C-u>

" Make Control+Left Arrow goto previous tab
noremap <C-Left> <Esc>:tabp<CR>

" Make Control+Right Arrow goto next tab
noremap<C-Right> <Esc>:tabn<CR>

" q: sucks
nmap :Q :q
nmap q: :q

" In normal mode, jj escapes
inoremap jj <Esc>

" Reformat everything
noremap <Leader>gq gggqG

" Make F3 compile
map <F3> : call CompileGcc()<CR>
func! CompileGcc()
    exec "w"
    exec "!gcc % -o %<"
endfunc

" Make F4 compile and run
map <F4> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    exec "!gcc % -o %<"
    if has('gui_win32')
        exec "! %<.exe"
    else
        exec "! ./%<"
    endif
endfunc


"---------------------------------------------
" abbreviations
"---------------------------------------------

if has("eval") && has("autocmd")
    fun! <SID>abbrev_cpp()
        iabbrev <buffer> jci const_iterator
        iabbrev <buffer> jcl class
        iabbrev <buffer> jco constant
        iabbrev <buffer> jit iterator
        iabbrev <buffer> jns namespace
        iabbrev <buffer> jpr protected
        iabbrev <buffer> jpu public
        iabbrev <buffer> jpv private
        iabbrev <buffer> jss std::string
        iabbrev <buffer> jsv std::vector
        iabbrev <buffer> jty typedef
        iabbrev <buffer> jun using namespace
    endfun

    augroup abbreviations
        autocmd!
        autocmd FileType cpp :call <SID>abbrev_cpp()
    augroup END

    " Work out include guard text
    fun! IncludeGuardText()
        let l:p = substitute(substitute(getcwd(), "/trunk", "", ""), '^.*/', "", "")
        let l:t = substitute(expand("%"), "[./]", "_", "g")
        return toupper(l:p . "_GUARD_" . l:t)
    endfun
endif


"---------------------------------------------
" final commands
"---------------------------------------------

" turn off any existing search
if has("autocmd")
    au VimEnter * nohls
endif

"---------------------------------------------
" vim: set sw=4 sts=4 et tw=80 :
"


