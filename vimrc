" General {
    " vim: set foldmarker={,} foldlevel=0 foldmethod=marker :
    "
    " Use Vim settings, rather then Vi settings (much better!).
    " This must be first, because it changes other options as a side effect.
    set nocompatible

    " allow backspacing over everything in insert mode
    set backspace=indent,eol,start
    set hidden

    set nobackup
    set nowritebackup
    set history=50           " keep 50 lines of command line history
    set ruler                " show the cursor position all the time
    set showcmd              " display incomplete commands

    " Don't use Ex mode, use Q for formatting
    map Q gq

    " Switch syntax highlighting on, when the terminal has colors
    " Also switch on highlighting the last used search pattern.
    color railscasts

    " Switch wrap off for everything
    set nowrap

    command! -nargs=* Wrap set wrap linebreak nolist

    " Numbers
    set number
    set numberwidth=5

    " Local config
    if filereadable(".vimrc.local")
        source .vimrc.local
    endif
" }

" Vim UI {
    " Always display the status line
    set laststatus=2
    " Display extra whitespace
    set list listchars=tab:»·,trail:·,extends:#,nbsp:.
    set cursorline
    if has('cmdline_info')
        set ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
        set showcmd
    endif
" }

" Formatting {
    set nowrap                      " wrap long lines
    set autoindent                  " indent at the same level of the previous line
    set shiftwidth=4                " use indents of 4 spaces
    set expandtab                   " tabs are spaces, not tabs
    set tabstop=4                   " an indentation every four columns
    set softtabstop=4               " let backspace delete indent
" }

" Short-cuts {
    let mapleader = ","
    map <Leader>h :set invhls <CR>
    map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
    map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

    imap <Tab> <C-N>
    imap <C-L> <Space>=><Space>
    nmap <F1> <Esc>
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv·

" }

" Auto commands {
    " Only do this part when compiled with support for autocommands.
    if has("autocmd")
        " Enable file type detection.
        " Use the default filetype settings, so that mail gets 'tw' set to 72,
        " 'cindent' is on in C files, etc.
        " Also load indent files, to automatically do language-dependent indenting.
        filetype plugin indent on

        " Set File type to 'text' for files ending in .txt
        autocmd BufNewFile,BufRead *.txt setfiletype text

        " Enable soft-wrapping for text files
        " autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

        " Automatically load .vimrc source when saved
        autocmd BufWritePost .vimrc source $MYVIMRC
    endif " has("autocmd")    
" }

" Plugins {
    " Snippets are activated by Shift+Tab
    let g:snippetsEmu_key = "<S-Tab>"

    let g:fuf_splitPathMatching=1

    " Tags
    let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
    set tags=./tags;
" }

" Completion {
    " Tab completion options
    " (only complete to the longest unambiguous match, and show a menu)
    set completeopt=longest,menu
    set wildmode=list:longest,list:full
    set complete=.,t
" }

" Search {
    set ignorecase
    set smartcase
    set incsearch            " do incremental searching
" }
