"This must be first, because it changes other options as a side effect.
set nocompatible

" Bundle -------------------------------------------------------------------{{{

set runtimepath+=$HOME/.vim/

" }}}

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

" tab between windows
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

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

"  }}}

" Errors -------------------------------------------------------------------{{{

nnoremap <leader>cn :cn<cr>
nnoremap <leader>cp :cp<cr>

"  }}}

" General ------------------------------------------------------------------{{{

nnoremap <silent> <Esc> :noh<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"  }}}

" Marks --------------------------------------------------------------------{{{

nnoremap <silent> <leader>m :marks<CR>

"  }}}

" Clipboard ----------------------------------------------------------------{{{

if has("win32") || has("win64")
  nnoremap <leader>c "+y
  nnoremap <leader>v "+p
  nnoremap <leader>V "+P
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

" HTML -------------------------------------------------------------------- {{{

augroup ft_html
  autocmd!
  autocmd FileType html setlocal tabstop=4 shiftwidth=4
  autocmd BufRead,BufWritePre *.html :normal gg=G
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

" JavaScript -------------------------------------------------------------- {{{

" augroup ft_javascript
"   autocmd!
"   autocmd FileType javascript :iabbrev func function()<esc>i
"   autocmd FileType javascript :iabbrev function "Use iabbrev func instead
" augroup END

" }}}

" VimScript --------------------------------------------------------------- {{{

augroup ft_vimscript
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd Filetype vim setlocal modelines=1
augroup END

" }}}

" QuickFix ---------------------------------------------------------------- {{{

au BufWinEnter quickfix setlocal number& relativenumber&
au Filetype qf wincmd K

" }}}

" Tag --------------------------------------------------------------------- {{{

au BufNewFile,BufRead *.tag setlocal ft=javascript

" }}}

" .*rc -------------------------------------------------------------------- {{{

au BufNewFile,BufRead .babelrc,.jshintrc setlocal ft=json

" }}}

" }}}

" General ------------------------------------------------------------------{{{

" GUI ----------------------------------------------------------------------{{{

if has('win32')
  set guifont=Droid_Sans_Mono:h8
else
  set guifont=Droid_Sans_Mono:h11
endif

set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)

set relativenumber  " show relative liene numbers"
set number          " show line numbers"
set noshowmode      " do not show mode at bottom
set showcmd         " show incomplete cmds down the bottom
set hlsearch        " hilight searches by default
set cursorline      " highlight the line with the cursor
set showbreak=...   " show line breaks as '...'
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
endif

"  }}}

" Misc----------------------------------------------------------------------{{{

syntax on
filetype plugin indent on

set wrap linebreak nolist   " wrap lines, wrap at wodrbreaks,
set autoread                " auto-load buffer when file was edited outside of VIM
set shiftwidth=2
set softtabstop=2
set expandtab               " tabs are spaces"
set autoindent              " looka at it stoopid
set incsearch               " find the next match as we type the search
set ignorecase              " ignore case when searching
set smartcase               " but case sensitve if expression contains capital letters
set gdefault                " substitue globally by default, no need for /g

set wildmode=list:longest,full  "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru match
set wildignore+=*.o
set wildignore+=*.obj
set wildignore+=*.sou
set wildignore+=*.dll
set wildignore+=*.hg
set wildignore+=*.svn
set wildignore+=.git
set wildignore+=.gitignore
set wildignore+=*~
set wildignore+=*.bmp
set wildignore+=*.gif
set wildignore+=*.jpeg
set wildignore+=*.jpg
set wildignore+=*.png
set wildignore+=*.exe

set cpo+=$

"  }}}

"  }}}

" Plugins ------------------------------------------------------------------{{{

" Ag -----------------------------------------------------------------------{{{

let g:ag_lhandler="topleft lopen 20"

"  }}}

" CtrlP --------------------------------------------------------------------{{{

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag -l --nocolor --nogroup -g "" %s'
else
    let g:ctrlp_user_command = has('win32') ? 'dir %s /-n /b /s /a-d' : 'find %s -type f'
endif

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

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
nmap <leader>d :CtrlPDir<CR>

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

nmap <leader>b :Rex<CR>

"  }}}

" YCM ----------------------------------------------------------------------{{{

let g:ycm_register_as_syntastic_checker = 1

" make ycm behave like syntastic, only with clang though....
let g:ycm_error_symbol = 'E:'
let g:ycm_warning_symbol = 'V:'
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_open_loclist_on_ycm_diags = 1

let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'critical'

let g:ycm_goto_buffer_command = 'same-buffer'
let g:ycm_filetype_white_list = { '*': 1 }

" remove tab navigation
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" trigger completion on . for TypeScript
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif

let g:ycm_semantic_triggers['typescript'] = ['.']

let g:ycm_filetype_specific_completion_to_disable = {
  \ 'gitcommit': 1,
  \ 'netrw': 1,
  \ 'html': 1,
  \ 'help': 1
  \}

augroup ycm_typescript
  autocmd!
  autocmd FileType typescript nnoremap <silent> <buffer> <localleader>d :YcmCompleter GoToDefinition<cr>
  autocmd FileType typescript nnoremap <silent> <buffer> <localleader>r :YcmCompleter GoToReferences<cr>
  autocmd FileType typescript nnoremap <silent> <buffer> <localleader>t :YcmCompleter GoToType<cr>
  autocmd FileType typescript nnoremap <silent> <buffer> <localleader>rr :YcmCompleter RefactorRename<space>
augroup END

augroup ycm_javascript
  autocmd!
  autocmd FileType javascript nnoremap <silent> <buffer> <localleader>d :YcmCompleter GoToDefinition<cr>
  autocmd FileType javascript nnoremap <silent> <buffer> <localleader>r :YcmCompleter GoToReferences<cr>
  autocmd FileType javascript nnoremap <silent> <buffer> <localleader>t :YcmCompleter GoTo<cr>
  autocmd FileType javascript nnoremap <silent> <buffer> <localleader>rr :YcmCompleter RefactorRename<space>
augroup END

"  }}}

" OmniSharp ----------------------------------------------------------------{{{

" let g:OmniSharp_selctor_ui = 'ctrlp'
" let g:OmniSharp_server_type = 'roslyn'

" augroup omnisharp_commands
"   autocmd!

"   autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

"   autocmd FileType cs setlocal <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>

"   autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

"   autocmd BufWritePost *.cs call OmniSharp#AddToProject()

"   autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

"   autocmd FileType cs nnoremap <leader>f :OmniSharpGoToDefinition<cr>
"   autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementation<cr>
"   autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
"   autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
"   autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
"   autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>

"   autocmd FileType cs nnoremap <leader>x :OmniSharpFixIssue<cr>
"   autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
"   autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
"   autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>

"   autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>

"   autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

" augroup END

" set updatetime=500

" set cmdheight=2

" nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" nnoremap <leader>nm :OmniSharpRename<cr>

" set hidden
"  }}}

" Scratch ------------------------------------------------------------------{{{

map <leader>ss :Scratch<CR>

"  }}}

" Session ------------------------------------------------------------------{{{

let g:startify_session_dir = "~/.vim/session"

"  }}}

" Syntastic ----------------------------------------------------------------{{{

let g:syntastic_typescript_tsc_fname = ''           " Do not send params to tsc
let g:syntastic_typescript_checkers = ['tsc', 'tslint']
highlight SyntasticErrorSign guifg=#cc6666 guibg=#282a2e
highlight SyntasticWarningSign guifg=#f0c674 guibg=#282a2e

"  }}}

"  }}}

" Commands -----------------------------------------------------------------{{{

function! s:AlternateFile()
  let name = expand('%:r')
  let ext = tolower(expand('%:e'))
  let sources = ['js','ts', 'c', 'cc', 'cpp', 'cxx']
  let headers = ['html','js', 'h', 'hh', 'hpp', 'hxx']
  for pair in [[sources, headers], [headers, sources]]
    let [set1, set2] = pair
    if index(set1, ext) >= 0
      for h in set2
        let aname = name.'.'.h
        for a in [aname, toupper(aname)]
          if filereadable(a)
            execute 'e' a
            return
          end
        endfor
      endfor
    endif
  endfor
endfunction
command! A call s:AlternateFile()

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

" Show line numbers on current buffer only
augroup windows

  au WinEnter * :setlocal number
  au WinEnter * :setlocal relativenumber
  au WinLeave * :setlocal nonumber
  au WinLeave * :setlocal norelativenumber

augroup END

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
  let stat .= Color(active, 4, active ? ' »' : ' «')
  let stat .= ' %<'

  if fname == '__Gundo__'
    let stat .= 'Gundo'
  elseif fname == '__Gundo_Preview__'
    let stat .= 'Gundo Preview'
  else
    let stat .= '%f'
  endif

  let stat .= ' ' . Color(active, 4, active ? '«' : '»')

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
  let stat .= Color(1, 1,' Nº ' . a:winnr)

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

hi User1 ctermfg=04  guifg=#81a2be  ctermbg=19  guibg=#373b41 gui=bold
hi User2 ctermfg=01  guifg=#cc6666  ctermbg=19  guibg=#373b41 gui=bold
hi User3 ctermfg=02  guifg=#b5bd68  ctermbg=19  guibg=#373b41 gui=bold
hi User4 ctermfg=06  guifg=#8abeb7  ctermbg=19  guibg=#373b41 gui=bold
hi User5 ctermfg=03  guifg=#f0c674  ctermbg=19  guibg=#373b41 gui=bold
"  }}}

" Local --------------------------------------------------------------------{{{

if filereadable(glob('$HOME/.vimrc.local'))
  source $HOME/.vimrc.local
endif

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
