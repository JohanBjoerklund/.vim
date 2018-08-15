"This must be first, because it changes other options as a side effect.
set nocompatible
language messages en

" Mappings -----------------------------------------------------------------{{{

" Leader -------------------------------------------------------------------{{{

let mapleader = "\<space>"
let maplocalleader = "\<space>"

"  }}}

" Windows ------------------------------------------------------------------{{{

nnoremap <silent> <leader>cc :cclose<CR>
nnoremap <silent> <leader>lc :lclose<CR>

"  }}}

" Navigation ---------------------------------------------------------------{{{

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Center window on next match on search
nnoremap N Nzz
nnoremap n nzz

" map leader<number> to jump to window
let i = 1
while i <= 9
  execute 'nnoremap <silent> <leader>' . i . ' :' . i . 'wincmd w<cr>'
  let i = i + 1
endwhile

nnoremap j gj
nnoremap k gk

" jump to first character on line
nnoremap <s-h> ^
" jump to last character on line
nnoremap <s-l> $
vnoremap <s-l> g_

"jump to last change
nnoremap gI `.

" backspace to previous file
nnoremap <BS> <C-^>

" open buffer list
nnoremap <leader>b :b <C-d>
nnoremap gb :ls<CR>:b<space>
" jump to previously edited buffer
nnoremap <leader>q :b#<C-r>

set path+=**
"  }}}

" Errors -------------------------------------------------------------------{{{

nnoremap <leader>cn :cn<cr>
nnoremap <leader>cp :cp<cr>

"  }}}

" General ------------------------------------------------------------------{{{

inoremap jk <Esc>
nnoremap <silent> <Esc> :noh<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"  }}}

" Marks --------------------------------------------------------------------{{{

nnoremap <silent> <leader>m :marks<CR>

"  }}}

" Clipboard ----------------------------------------------------------------{{{

if has("win32") || has("win64")
  nnoremap <leader>c "*y
  nnoremap <leader>v "*p
  nnoremap <leader>V "*P
  vnoremap <leader>c "*y"
endif

"  }}}

" Insertmode text manipulation ---------------------------------------------{{{

" Uppercas current word
inoremap <C-u> <esc>viw<S-U>i

"  }}}

" Abbreviations ------------------------------------------------------------{{{

iabbrev strign string

"  }}}

" Operator pending ---------------------------------------------------------{{{

onoremap <silent> in( :<c-u>normal! f(vi(<cr>
onoremap <silent> il( :<c-u>normal! F)vi(<cr>
onoremap <silent> in{ :<c-u>normal! f{vi{<cr>
onoremap <silent> il{ :<c-u>normal! F}vi{<cr>

"  }}}

"  }}}

" FileType -----------------------------------------------------------------{{{

" C# ---------------------------------------------------------------------- {{{

augroup ft_cs
  autocmd!
  autocmd FileType cs setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

" }}}

" HTML -------------------------------------------------------------------- {{{

augroup ft_html
  autocmd!
  autocmd FileType html setlocal tabstop=4 shiftwidth=4
augroup END

" }}}

" Razor ------------------------------------------------------------------- {{{

augroup ft_razor
  autocmd!
  autocmd BufRead,BufNewFile *.cshtml setlocal filetype=html tabstop=4 shiftwidth=4
augroup END

" }}}

" TypeScript -------------------------------------------------------------- {{{

augroup ft_typescript
  autocmd!
  autocmd FileType typescript setlocal tabstop=4 shiftwidth=4
  autocmd BufRead,BufNewFile *.ts,*.tsx setlocal filetype=typescript
augroup END

" }}}

" VimScript --------------------------------------------------------------- {{{

augroup ft_vimscript
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd Filetype vim setlocal modelines=1
augroup END

augroup ft_qf
  autocmd!
  autocmd FileType qf nmap <buffer> <cr> <cr>:lcl<cr>
augroup END
" }}}

" QuickFix ---------------------------------------------------------------- {{{

au BufWinEnter quickfix setlocal number& relativenumber&
au Filetype qf wincmd K

" }}}

" Tag --------------------------------------------------------------------- {{{

augroup ft_tag
  autocmd BufRead,BufNewFile *.tag.html setlocal filetype=riot
  autocmd FileType riot call tern#Enable()
augroup END

" }}}

" .*rc -------------------------------------------------------------------- {{{

au BufNewFile,BufRead .babelrc,.jshintrc setlocal ft=json

" }}}

" c# -----------------------------------------------------------------------{{{

augroup ft_cake
  autocmd BufRead,BufNewFile *.cake setlocal filetype=cs
augroup END
"  }}}

" }}}

" General ------------------------------------------------------------------{{{

" GUI ----------------------------------------------------------------------{{{

if has('win32')
  set guifont=hack:h8
else
  set guifont=hack:h11
endif

set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)

set termguicolors
set relativenumber  " show relative liene numbers"
set number          " show line numbers"
set noshowmode      " do not show mode at bottom
set showcmd         " show incomplete cmds down the bottom
set hlsearch        " hilight searches by default
set cursorline      " highlight the line with the cursor
let &showbreak='↳ ' " show line breaks as '↳ '
set ttyfast         " might improve scroll performance
set lazyredraw      " might improve scroll performance
set colorcolumn=80  " show 80 column makr
set background=dark
set hidden
set t_Co=256      " enable 256 color support"

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

colorscheme base16-tomorrow-night

if has('breakindent')
  silent! set breakindent
endif

"don't load csapprox if there is no gui support -
"silences an annoying warning
if !has('gui_running')
    let g:CSApprox_loaded = 1
endif

"  }}}

" Shell --------------------------------------------------------------------{{{

if has("unix")
    set shell=/bin/bash\ --rcfile\ ~/.bash_profile\ -i
endif
set shellslash      "use forwards slashes

"  }}}

" Backup -------------------------------------------------------------------{{{

set history=1000        "store 1000 commandline entries
set dir^=$TMP
set noswapfile          "swap files are annoying

"  }}}

" Folding ------------------------------------------------------------------{{{

set foldmethod=indent   "fold based on indent
set foldnestmax=1       "deepest fold is 1 level
set nofoldenable        "dont fold by default
set foldcolumn=0        "do not show fold

"  }}}

" Mac ----------------------------------------------------------------------{{{

if has("gui_macvim")
  set macmeta
  set macligatures
endif

"  }}}

" Misc----------------------------------------------------------------------{{{

syntax on
filetype plugin indent on

set backspace=indent,eol,start
set wrap linebreak nolist   " wrap lines, wrap at wodrbreaks,
set autoread                " auto-load buffer when file was edited outside of VIM
set shiftwidth=2
set softtabstop=2
set expandtab               " tabs are spaces"
set autoindent              " look at it stoopid
set copyindent              " nice alignment
set incsearch               " find the next match as we type the search
set ignorecase              " ignore case when searching
set smartcase               " but case sensitve if expression contains capital letters

set wildmode=list:longest,full  "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru match
set wildignore+=*.o
set wildignore+=*.obj
set wildignore+=*.sou
set wildignore+=*.dll
set wildignore+=*.hg
set wildignore+=*.svn
set wildignore+=*~
set wildignore+=*.bmp
set wildignore+=*.gif
set wildignore+=*.jpeg
set wildignore+=*.jpg
set wildignore+=*.png
set wildignore+=*.exe
set wildignore+=*/node_modules/*
set wildignore+=*/elm-stuff/*

set cpo+=$

"  }}}

"  }}}

" Plugins ------------------------------------------------------------------{{{

" CtrlP --------------------------------------------------------------------{{{

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag -l --nocolor --nogroup -g "" %s'
else
    let g:ctrlp_user_command = has('win32') ? 'dir %s /-n /b /s /a-d' : 'find %s -type f'
endif

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

let g:ctrlp_root_markers = ['.tern-project']
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_lazy_update = 350
let g:ctrlp_match_window = 'top,order:ttb'
let g:ctrlp_reuse_window = 'netrw\|help'

function! CtrlP_main_status(...)
  let regex = a:3 ? '%2*regex %*' : ''
  let prv = '%#StatusLineNC# '.a:4.' %*'
  let item = ' ' . (a:5 == 'mru files' ? 'mru' : a:5) . ' '
  let nxt = '%#StatusLineNC# '.a:6.' %*'
  let byfname = '%2* '.a:2.' %*'
  let dir = '%#User3# ← %*%#StatusLineNC#' . fnamemodify(getcwd(), ':~') . '%* '

  " only outputs current mode
  retu ' %#User1#»%*' . item . '%#User1#«%* ' . '%=%<' . dir

endfunction

function! CtrlP_progress_status(...)
  let len = '%#Function# '.a:1.' %*'
  let dir = ' %=%<%#LineNr# '.getcwd().' %*'
  retu len.dir
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlP_main_status',
  \ 'prog': 'CtrlP_progress_status'
  \}

nmap <leader>f :CtrlP<CR><C-\>w

"  }}}

" GitGutter ----------------------------------------------------------------{{{

nnoremap <leader>gp <Plug>GitGutterPreviewHunk

"  }}}

" Netrw --------------------------------------------------------------------{{{

let g:netrw_altfile=1
let g:netrw_liststyle=0
let g:netrw_banner=0
let g:netrw_winisze=-28
let g:netrw_bufsettings= 'nomodifiable nomodified readonly nobuflisted norwrap nonumber'

"  }}}

" Scratch ------------------------------------------------------------------{{{

map <leader>ss :Scratch<CR>

"  }}}

" Ale ----------------------------------------------------------------------{{{

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '✖'

hi ALEErrorSign ctermfg=01 guifg=#cc6666 ctermbg=15  guibg=#282a2e
hi ReplaceCursor ctermfg=15 guifg=#f0c674 ctermbg=01  guibg=#373b41

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_rust_rls_toolchain = 'stable'

let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'riot': ['eslint'],
  \ 'rust': ['rls'],
  \ 'cs': ['OmniSharp']
  \}


let g:ale_linter_aliases = { 'riot': ['javascript'] }

" Tern ---------------------------------------------------------------------{{{

nnoremap <localleader>rr :TernRename<CR>
nnoremap <localleader>r :TernRef<CR>
nnoremap <localleader>d :TernDef<CR>

let g:tern_show_signature_in_pum = 1

"  }}}

" UltiSnips -----------------------------------------------------------------{{{


let g:UltiSnipsSnippetsDir = ['UltiSnips']

"  }}}

" Asyncomplete --------------------------------------------------------------{{{

let g:asyncomplete_remove_duplicates = 1

set completeopt+=menuone,noselect ",noinsert ",noselect
set completeopt-=preview,longest,menu
set shortmess+=c " Turn off comletion messages

au User lsp_setup call lsp#register_server({
  \ 'name': 'rls',
  \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
  \ 'whitelist': ['rust'],
  \ 'priority': 99
  \ })

au User asyncomplete_setup
  \ call asyncomplete#register_source(
  \   asyncomplete#sources#buffer#get_source_options({
  \     'name': 'buffer',
  \     'whitelist': ['*'],
  \     'blacklist': ['go', 'cs'],
  \     'priority': 1,
  \     'completor': function('asyncomplete#sources#buffer#completor'),
  \ }))

au User asyncomplete_setup
  \ call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
  \ 'name': 'omni',
  \ 'whitelist': ['*'],
  \ 'blacklist': ['html'],
  \ 'priority': 5,
  \ 'completor': function('asyncomplete#sources#omni#completor')
  \  }))

au User asyncomplete_setup
  \ call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
  \ 'name': 'ultisnips',
  \ 'whitelist': ['*'],
  \ 'priority': 2,
  \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
  \ }))

au User asyncomplete_setup
  \ call asyncomplete#register_source(
  \   asyncomplete#sources#tscompletejob#get_source_options({
  \     'name': 'tscompletejob',
  \     'whitelist': ['typescript'],
  \     'priority': 4,
  \     'completor': function('asyncomplete#sources#tscompletejob#completor'),
  \ }))


"  }}}

" OmniSharp ----------------------------------------------------------------{{{

let g:OmniSharp_server_path = expand('~/.omnisharp/omnisharp-roslyn/') . 'OmniSharp.exe'
let g:OmniSharp_selector_ui = 'ctrlp'


" list of EndPoints (v2)
"https://github.com/OmniSharp/omnisharp-roslyn/blob/master/src/OmniSharp.Abstractions/OmniSharpEndpoints.cs

augroup omnisharp_commands
  autocmd!

  " build async (OmniSharp-roslyn does not support this yet)
  autocmd FileType cs nnoremap <buffer> <leader>b :wa!<CR>:OmniSharpBuildAsync<CR>

  " save new file to nearest project
  autocmd BufWritePost *.cs call OmniSharp#AddToProject()

  " Show type information automatically when the cursor stops moving
  " autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
  autocmd FileType cs nnoremap <buffer> <leader>fi :OmniSharpFindImplementations<CR>
  autocmd FileType cs nnoremap <buffer> <leader>fs :OmniSharpFindSymbol<CR>
  autocmd FileType cs nnoremap <buffer> <leader>fu :OmniSharpFindUsages<CR>

  " Finds members in the current buffer
  autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

  " Cursor can be anywhere on the line containing an issue
  autocmd FileType cs nnoremap <buffer> <Leader>x  :OmniSharpFixIssue<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>

  " Navigate up and down by method/property/field
  autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
  autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>

" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <Leader>rl :OmniSharpReloadSolution<CR>
nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
" Load the current .cs file to the nearest project
" nnoremap <Leader>tp :OmniSharpAddToProject<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Add syntax highlighting for types and interfaces
nnoremap <Leader>th :OmniSharpHighlightTypes<CR>

"  }}}

" Commands -----------------------------------------------------------------{{{


function! s:Functions()
  set guifont=Fira\ Code:h11
endfunction
command! Functions call s:Functions()

function! s:Objects()
  if has('win32')
    set guifont=hack:h8
  else
    set guifont=hack:h11
  endif
endfunction
command! Objects call s:Objects()

nnoremap <silent> <leader>q :call <SID>QuickFixToggle()<cr>
let g:quickfix_is_open = 0

function! s:QuickFixToggle()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen
    let g:quickfix_is_open = 1
endif
endfunction

command! -nargs=+ WGrep execute 'silent lgrep! <args>' fnamemodify(findfile('.tern-project', '.;'), ':h') | lopen

command! -nargs=1 NRun execute '!start cmd /k npm run ' . <q-args>

" }}}

" Events -------------------------------------------------------------------{{{

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Set current directory
au BufEnter * silent! lcd %:p:h

" }}}

" Statusline ---------------------------------------------------------------{{{

set laststatus=2
set encoding=utf-8
set langmenu=en_US.UTF-8

function! Status(winnr)
  let stat = ''
  let active = winnr() == a:winnr
  let buffer = winbufnr(a:winnr)

  let modified = getbufvar(buffer, '&modified')
  let readonly = getbufvar(buffer, '&ro')
  let fname = bufname(buffer)

  function! Color(active, num, content)
    if a:active
      return '%' . a:num . '*' . a:content . '%*'
    else
      return a:content
    endif
  endfunction

  " file
  let stat .= Color(active, 4, active ? ' «' : ' »')
  let stat .= ' %<'

  if fname == '__Gundo__'
    let stat .= 'Gundo'
  elseif fname == '__Gundo_Preview__'
    let stat .= 'Gundo Preview'
  else
    let stat .= '%f'
  endif

  let stat .= ' ' . Color(active, 4, active ? ' »' : ' «')

  " git branch
  if exists('*fugitive#head')
    let head = fugitive#head()

    if empty(head) && exists('*fugitive#detect') && !exists('b:git_dir')
      call fugitive#detect(getcwd())
      let head = fugitive#head()
    endif
  endif

  if !empty(head)
    let stat .=  Color(active, 3, '  λ ') . head
  endif
  " file modified
  let stat .= Color(active, 2, modified ? ' +' : '')

  " read only
  let stat .= Color(active, 2, readonly ? ' ‼' : '')

  " paste
  if active && &paste
    let stat .= ' %2*' . 'P' . '%*'
  endif

  " right side
  let stat .= '%='

  " window
  let stat .= Color(1, 1,' N° ' . a:winnr)

  return stat
endfunction

function! SetStatus()
  for nr in range(1, winnr('$'))
    call setwinvar(nr, '&statusline', '%!Status('.nr.')')
  endfor
endfunction

augroup status
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter,BufUnload * call SetStatus()
augroup END

hi User1 ctermfg=04  guifg=#81a2be  ctermbg=19  guibg=#373b41
hi User2 ctermfg=01  guifg=#cc6666  ctermbg=19  guibg=#373b41
hi User3 ctermfg=02  guifg=#b5bd68  ctermbg=19  guibg=#373b41
hi User4 ctermfg=06  guifg=#8abeb7  ctermbg=19  guibg=#373b41
hi User5 ctermfg=03  guifg=#f0c674  ctermbg=19  guibg=#373b41
"  }}}

" Local --------------------------------------------------------------------{{{

if filereadable(glob('$HOME/.vimrc.local'))
  source $HOME/.vimrc.local
endif

" }}}

" Tabs ---------------------------------------------------------------------{{{

set guioptions-=e
function SetTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    call settabvar(tabpagenr(), 'tablabel', fnamemodify(finddir('.git', '.;'), ':h:t'))
    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{GetTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction

function GetTabLabel(n)
  return gettabvar(a:n, 'tablabel')
endfunction

set tabline=%!SetTabLine()

" }}}

" Cursor -------------------------------------------------------------------{{{

set gcr=a:block

" mode awareness
set gcr+=o:hor50-Cursor
set gcr+=n:Cursor
set gcr+=i-ci-sm:InsertCursor
set gcr+=r-cr:ReplaceCursor-hor20
set gcr+=c:CommandCursor
set gcr+=v-ve:VisualCursor

set gcr+=a:blinkon0

if &term =~ "screen-256color\\|xterm\\|rxvt"
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else

    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif

endif

hi InsertCursor  ctermfg=15 guifg=#c5c8c6 ctermbg=04  guibg=#81a2be
hi VisualCursor  ctermfg=15 guifg=#c5c8c6 ctermbg=16  guibg=#de935f
hi ReplaceCursor ctermfg=15 guifg=#c5c8c6 ctermbg=01  guibg=#cc6666
hi CommandCursor ctermfg=15 guifg=#c5c8c6 ctermbg=02  guibg=#b5bd68

augroup cursorline
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

"  }}}

" vim:foldmethod=marker:foldlevel=0
