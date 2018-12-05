" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup
" set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
" set showcmd		" display incomplete commands
" set incsearch		" do incremental searching

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
" "vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  " set hlsearch
endif

set tabstop=4
set expandtab
set shiftwidth=4
set autowrite

" Remap c-a in insert mode to go back to the beginning of line
inoremap <C-a> <C-o>0

" Disable ex mode
nnoremap Q <nop>

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " autocmd BufReadPost *
  "   \ if line("'\"") > 0 && line("'\"") <= line("$") |
  "   \   exe "normal g`\"" |
  "   \ endif

  autocmd FileType xml setlocal tabstop=2 shiftwidth=2
  au FileType scala setl sw=2 sts=2
  au FileType ruby setl sw=2 sts=2
  au FileType python setl sw=4 sts=4
  au BufNewFile,BufRead *.gradle setf groovy
  au BufNewFile,BufRead *.jsx setf javascript

  augroup END

else

  " set noautoindent		" always set autoindenting off

endif " has("autocmd")


" set mouse=a


" Plugins
call pathogen#infect()
call pathogen#infect('~/.vim/bundle')

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_check_on_open=1

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*~
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" autocmd BufReadPost *.java,*.groovy,*.scala :inoremap ( ()<Esc>i
" autocmd BufReadPost *.java,*.groovy,*.scala :inoremap { {}<Esc>i
" autocmd BufReadPost *.java,*.groovy,*.scala :inoremap [ []<Esc>i

set tags=./tags,./../tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags,./../../../../../../tags,tags

let java_highlight_all=1
let java_highlight_debug=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
let java_highlight_functions="style"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" let zpython_highlight_all = 1
" set foldmethod=indent

" if jedi#init_python()
"   function! s:jedi_auto_force_py_version() abort
"     let major_version = pyenv#python#get_internal_major_version()
"     call jedi#force_py_version(major_version)
"   endfunction
"   augroup vim-pyenv-custom-augroup
"     autocmd! *
"     autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
"     autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
"   augroup END
" endif
