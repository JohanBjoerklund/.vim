"This must be first, because it changes other options as a side effect.
set nocompatible

" Bundle -------------------------------------------------------------------{{{

set runtimepath+=$HOME/.vim/
execute pathogen#infect()

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

" map leader<number> to jump to window
let i = 1
while i <= 9
  execute 'nnoremap <leader>' . i . ' :' . i . 'wincmd w<cr>'
  let i = i + 1
endwhile

nnoremap j gj
nnoremap k gk

nnoremap <s-h> ^
nnoremap <s-l> $
vnoremap <s-l> g_

vnoremap <s-l> g_

"jump to last change
nnoremap gI `.

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

inoremap <c-u> <esc>viw<S-U>i

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

set relativenumber
set number
set noshowmode      "do not show mode at bottom
set showcmd         "show incomplete cmds down the bottom
set hlsearch        "hilight searches by default
set cursorline      "highlight the line with the cursor
set showbreak=...   "show line breaks as '...'
set ttyfast         "might improve scroll performance
set lazyredraw      "might improve scroll performance
set colorcolumn=80  "show 80 column makr
set background=dark
set hidden
colorscheme base16-tomorrow

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
set dir^=$HOME/.vimswap//

"  }}}

" Folding ------------------------------------------------------------------{{{

set foldmethod=indent   "fold based on indent
set foldnestmax=1       "deepest fold is 1 level
set nofoldenable        "dont fold by default
set foldcolumn=0        "do not show fold

"  }}}

" Misc----------------------------------------------------------------------{{{

syntax on
filetype on
filetype plugin indent on
filetype indent on

set wrap linebreak nolist   "wrap lines, wrap at wodrbreaks,
set autoread                "automatically load buffer when file has been edited outside of VIM
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set incsearch      "find the next match as we type the search
set ignorecase     "ignore case when searching
set smartcase      "but case sensitve if expression contains capital letters
set gdefault       "substitue globally by default, no need for /g
set backspace=indent,eol,start  "allow backspacing over everything in insert mode

set wildmode=list:longest,full  "make cmdline tab completion similar to bash
set wildmenu                    "enable ctrl-n and ctrl-p to scroll thru match
"stuff to ignore when tab completing
set wildignore=*.o,*.obj,*.sou,*.dll,*.hg,*.svn,.git,.gitignore,*~,*.bmp,*.gif,*.jpeg,*.jpg,*.png,*.exe

set cpo+=$

"  }}}

"  }}}

" Plugins ------------------------------------------------------------------{{{

" Ag -----------------------------------------------------------------------{{{

let g:ag_lhandler="topleft lopen 20"

" nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cword>")) . " ."<cr>:copen<cr>
" nnoremap <leader>gg :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

"  }}}

" CtrlP --------------------------------------------------------------------{{{

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag -l --nocolor --nogroup -g "" %s'
else
    let g:ctrlp_user_command = has('win32') ? 'dir %s /-n /b /s /a-d' : 'find %s -type f'
endif

if has('python')
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_lazy_update = 350
let g:ctrlp_match_window = 'top,order:ttb'
let g:ctrlp_reuse_window = 'netrw\|help'

nmap <leader>f :CtrlP<CR><C-\>w
nmap <leader>d :CtrlPDir<CR>

"  }}}

" GitGutter ----------------------------------------------------------------{{{

nnoremap <leader>gp <Plug>GitGutterPreviewHunk

"  }}}

" Netrw --------------------------------------------------------------------{{{

let g:netrw_liststyle=0
let g:netrw_altfile=1
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
  autocmd FileType typescript nnoremap <silent> <buffer> <leader>gt :YcmCompleter GoToDefinition<cr>
  autocmd FileType typescript nnoremap <silent> <buffer> <leader>gr :YcmCompleter GoToReferences<cr>
  autocmd FileType typescript nnoremap <silent> <buffer> <leader>st :YcmCompleter GetType<cr>
  autocmd FileType typescript nnoremap <silent> <buffer> <leader>rr :YcmCompleter RefactorRename<space>
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

let g:currentmode={
	\ 'n'  : 'N',
	\ 'no' : 'N',
	\ 'v'  : 'V',
	\ 'V'  : 'V',
	\ '' : 'V',
	\ 's'  : 'S',
	\ 'S'  : 'S',
	\ '' : 'S',
	\ 'i'  : 'I',
	\ 'R'  : 'R',
	\ 'Rv' : 'R',
	\ 'c'  : 'C',
	\ 'cv' : 'E',
	\ 'ce' : 'E',
	\ 'r'  : 'P',
	\ 'rm' : 'M',
	\ 'r?' : 'C',
        \ '!'  : 'Sh',
	\}

function! DoHightlight(mode)
  if (a:mode =~# '\v(n|no)')
      highlight Mode ctermbg=02 ctermfg=04 guibg=#373b41 guifg=#b5bd68 gui=none
  elseif (a:mode =~# '\v(v|V)' || g:currentmode[a:mode] ==# 'V')
      highlight Mode ctermbg=02 ctermfg=04 guibg=#373b41 guifg=#de935f gui=none
  elseif (a:mode ==# 'i')
      highlight Mode ctermbg=02 ctermfg=04 guibg=#373b41 guifg=#81a2be gui=none
  else
      highlight Mode ctermbg=02 ctermfg=04 guibg=#373b41 guifg=#b5bd68 gui=none
  endif

  return ''
endfunction

function! StatusGit()
    let l:symbols = ['+', '~', '-']
    let l:hunks = GitGutterGetHunkSummary()
    let l:ret = []

    for i in [0, 1, 2]
        if hunks[i] > 0
            call add(l:ret, l:symbols[i] . l:hunks[i])
        endif
    endfor

    let git = join(l:ret, ' ') . 'git:' . fugitive#head()

    return fugitive#head() != '' && winwidth('.') > 70 ? git : ''
endfunction

function! WindowNumber()
  return tabpagewinnr(tabpagenr())
endfunction

function! IsModified()
  return &modified == 1 ? ' + ' : ''
endfunction

function! Left(show)
  return a:show ?  '«' : ''
endfunction
function! Right(show)

  return a:show ?  '»' : ''
endfunction

set statusline=%{DoHightlight(mode())}\ %*                      " hl arrows
set statusline+=%{toupper(g:currentmode[mode()])}\ %*           " show mode
set statusline+=%#Mode#%{Right(1)}%#Statusline#\ %*             " divider
set statusline+=%{StatusGit()}\ %*                              " Show got status
set statusline+=%#Mode#%{Right(1)}%#Statusline#\ %*             " divider
set statusline+=%-1f                                            " show file

set statusline+=%=                                              " swith to RHS

set statusline+=%#Mode#%{Left(&modified)}%#Statusline#\ %*      " divider
set statusline+=%{IsModified()}\ %*                             " buf status
set statusline+=%#Mode#%{Left(1)}%#Statusline#\ %*              " divider
set statusline+=%2c\ %*                                         " col nr
set statusline+=%#Mode#%{Left(1)}%#Statusline#\ %*              " divider
set statusline+=%*w:%{WindowNumber()}\ %*                       " win nr

"  }}}

" Local --------------------------------------------------------------------{{{

if filereadable(glob('$HOME/.vimrc.local'))
  source $HOME/.vimrc.local
endif

" }}}

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
