"This must be first, because it changes other options as a side effect.
set nocompatible
language messages C
set shortmess+=sI
set updatetime=100 "Fix slow gitgutter updates
set signcolumn=yes

" Mappings -----------------------------------------------------------------{{{

" Leader -------------------------------------------------------------------{{{

let mapleader = "\<space>"
let maplocalleader = "\<space>"

"  }}}

" Windows ------------------------------------------------------------------{{{

nnoremap <silent> <leader>cc :cclose<CR>
nnoremap <silent> <leader>lc :lclose<CR>

nnoremap <silent> zi :tabedit +<C-r>=line(".")<cr> %<cr>zz
nnoremap <silent> Zi :only<cr>
nnoremap <silent> zo :call ZoomOut()<cr>
function! ZoomOut()
    let linenr = line(".")
    exec 'tabclose'
    exec 'normal ' . linenr . 'G'
endfunction
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
nnoremap gb :ls<CR>:b<space>

set path+=**
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

" bicep ------------------------------------------------------------------- {{{
augroup ft_bicep
  autocmd!
  autocmd FileType bicep setlocal omnifunc=ale#completion#OmniFunc
augroup END
" }}}
"
" C# ---------------------------------------------------------------------- {{{

augroup ft_cs
  autocmd!
  autocmd FileType cs setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

" }}}

" GraphQL ----------------------------------------------------------------- {{{

augroup ft_graphql
  autocmd!
  autocmd BufNewFile,BufRead *.prisma setfiletype graphql
augroup END

" }}}

" Markdown ---------------------------------------------------------------- {{{

let g:markdown_fenced_languages = ['javascript', 'sh', 'shell=sh', 'yaml', 'cs', 'json']
let g:markdown_minlines = 100

augroup ft_markdown
  autocmd!
  autocmd FileType markdown setlocal textwidth=100
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
  autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 omnifunc=ale#completion#OmniFunc
  autocmd BufRead,BufNewFile *.ts,*.tsx setlocal filetype=typescript
augroup END

" }}}

" Markdown ---------------------------------------------------------------- {{{

augroup ft_markdown
  autocmd!
  autocmd FileType markdown setlocal spell spelllang=en_us
augroup END

" }}}

" VimScript --------------------------------------------------------------- {{{

augroup ft_vimscript
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd Filetype vim setlocal modelines=1
  autocmd Filetype vim nnoremap <buffer> <leader>s :w | source %
augroup END

" }}}

" QuickFix ---------------------------------------------------------------- {{{

augroup ft_qf
  autocmd!
  autocmd FileType qf nmap <buffer> <cr> <cr>:ccl<cr>
augroup END

au BufWinEnter quickfix setlocal number& relativenumber&
au Filetype qf wincmd K

" }}}

" Tag --------------------------------------------------------------------- {{{

augroup ft_tag
  autocmd!
  autocmd BufRead,BufNewFile *.riot setlocal filetype=riot
  autocmd FileType riot call tern#Enable()
augroup END

" }}}

" .*rc -------------------------------------------------------------------- {{{

au BufNewFile,BufRead .babelrc,.jshintrc setlocal ft=json

" }}}


" }}}

" General ------------------------------------------------------------------{{{

" GUI ----------------------------------------------------------------------{{{

if has('win32')
  set guifont=hack:h9
else
  set guifont=hack:h11
endif

set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)

" set termguicolors
if !has('gui_running')
  set term=screen-256color
endif

set t_Co=256        " enable 256 color support"
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
set nrformats=

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

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

if executable('rg')
    set grepprg=rg\ --no-heading\ --smart-case\ --color=never
endif

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

set completeopt=longest,menuone,popuphidden
set completepopup=highlight:Pmenu,border:off
set shortmess+=c " Turn off comletion messages

set cpo+=$

"  }}}

"  }}}

" Plugins ------------------------------------------------------------------{{{

" Vimspector ---------------------------------------------------------------{{{

packadd! vimspector
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

"  }}}

" fzf ----------------------------------------------------------------------{{{

let g:rg_derive_root='true'

let g:fzf_layout = { 'window' : { 'width': 0.9, 'height': 0.6, 'highlight': 'Normal'  }  }

nnoremap <leader>b :Buffer<CR>
nnoremap <C-p> :GFiles<CR>

"  }}}

" Netrw --------------------------------------------------------------------{{{

let g:netrw_altfile=1
let g:netrw_liststyle=0
let g:netrw_banner=0
let g:netrw_winisze=-28
let g:netrw_bufsettings= 'nomodifiable nomodified readonly nobuflisted norwrap nonumber'

"  }}}

" Scratch ------------------------------------------------------------------{{{

let g:scratch_insert_autohide = 0
let g:scratch_persistence_file = $HOME . "/.scratch_session"

"  }}}

" Ale ----------------------------------------------------------------------{{{
" Start Fix for using eslint with zero install yarn
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'yarn'
let g:ale_javascript_eslint_options = 'run eslint'
" End fix for using eslint with zero install yarn

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '!'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

set omnifunc=ale#completion#OmniFunc

nmap <silent> ]e <Plug>(ale_next_wrap)
nmap <silent> [e <Plug>(ale_previous_wrap)

let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'riot': ['eslint'],
  \ 'rust': ['rls'],
  \ 'cs': ['OmniSharp']
  \}

let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \}
let g:ale_fix_on_save = 1

let g:ale_linter_aliases = { 'riot': ['javascript'] }

if has('unix')
  packloadall
  call ale#linter#Define('bicep', {
  \   'name': 'bicep-ls',
  \   'lsp': 'stdio',
  \   'executable': 'dotnet',
  \   'command': '%e /usr/local/bin/bicep-langserver/Bicep.LangServer.dll',
  \   'project_root': '.'
  \})
endif

if has('win32')
  packloadall
  call ale#linter#Define('bicep', {
  \   'name': 'bicep-ls',
  \   'lsp': 'stdio',
  \   'executable': 'C:\Users/JohanBjorklund/.bicep/bicep-langserver/Bicep.LangServer.exe',
  \   'command': '%e',
  \   'project_root': '.'
  \})
endif
"  }}}

" GitGutter ----------------------------------------------------------------{{{

let g:gitgutter_preview_win_floating = 1

"  }}}
" Tern ---------------------------------------------------------------------{{{

nnoremap <localleader>rr :TernRename<CR>
nnoremap <localleader>r :TernRef<CR>
nnoremap <localleader>d :TernDef<CR>

" let g:tern_show_signature_in_pum = 1

"  }}}

" UltiSnips -----------------------------------------------------------------{{{

let g:UltiSnipsSnippetsDir = ['UltiSnips']

"  }}}

" OmniSharp ----------------------------------------------------------------{{{

let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_selector_findusages = 'fzf'
let g:OmniSharp_timeout = 5
let g:OmniSharp_want_snippet = 1
let g:OmniSharp_translate_cygwin_wsl = 1

augroup omnisharp_commands
  autocmd!
  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>fu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>fi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>pd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>pi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>tt <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>dc <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>fs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>fx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <Leader>fm <Plug>(omnisharp_find_members)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

 " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader><space> <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader><space> <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>nm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)

augroup END

" Add syntax highlighting for types and interfaces
nnoremap <Leader>th :OmniSharpHighlightTypes<CR>

"  }}}

" IndentLines --------------------------------------------------------------{{{

let g:indentLine_fileTypeExclude = ['json']

" }}}

" Commands -----------------------------------------------------------------{{{


function! s:Functions()
  set guifont=FiraCode\ NF:h11
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

function! s:Color(active, num, content)
  if a:active
    return '%' . a:num . '*' . a:content . '%*'
  else
    return a:content
  endif
endfunction

function! Status(winnr)
  let stat = ''
  let active = winnr() == a:winnr
  let buffer = winbufnr(a:winnr)

  let modified = getbufvar(buffer, '&modified')
  let readonly = getbufvar(buffer, '&ro')
  let fname = bufname(buffer)


  " file
  let stat .= s:Color(l:active, 4, l:active ? ' «' : ' »')
  let stat .= ' %<%f'
  let stat .= s:Color(l:active, 4, l:active ? ' »' : ' «')

  " git
  let head = fugitive#head()
  if !empty(head)
    let stat .= s:GitFStat(l:active, l:head)
  endif

  " file modified
  let stat .= s:Color(l:active, 2, l:modified ? ' +' : '')

  " read only
  let stat .= s:Color(l:active, 2, l:readonly ? ' ‼' : '')

  " paste
  if active && &paste
    let stat .= ' %2*' . 'P' . '%*'
  endif

  " right side
  let stat .= '%='

  " window
  let stat .= s:Color(1, 1,' N° ' . a:winnr)
  return stat
endfunction

function! SetStatus()
  for nr in range(1, winnr('$'))
    call setwinvar(nr, '&statusline', '%!Status('.nr.')')
  endfor
endfunction

function! s:GitFStat(active, head)
  return s:Color(a:active, 3, '  ') . a:head
endfunction

augroup status
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter,BufUnload * call SetStatus()
augroup END

hi User1 ctermfg=109 ctermbg=239 guifg=#83a598 guibg=#504945
hi User2 ctermfg=167 ctermbg=239 guifg=#fb4934 guibg=#504945
hi User3 ctermfg=142 ctermbg=239 guifg=#b8bb26 guibg=#504945
hi User4 ctermfg=108 ctermbg=239 guifg=#8ec07c guibg=#504945
hi User5 ctermfg=214 ctermbg=239 guifg=#fabd21 guibg=#504945

"  }}}

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
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q"
  endif
endif

hi InsertCursor  ctermfg=15 ctermbg=04  guibg=#458588  guifg=#ebdbb2
hi VisualCursor  ctermfg=15 ctermbg=16  guibg=#d79921  guibg=#ebdbb2
hi ReplaceCursor ctermfg=15 ctermbg=01  guibg=#cc241d  guibg=#ebdbb2
hi CommandCursor ctermfg=15 ctermbg=02  guibg=#98971a  guibg=#ebdbb2

augroup cursorline
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

"  }}}

command Todo noautocmd vimgrep /TODO/j ** | cw

" vim:foldmethod=marker:foldlevel=0
