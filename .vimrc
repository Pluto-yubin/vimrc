" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).

" 有几个很坑的地方
"   在wsl里面字体要按CTRL-shift-','在setting.json里面来设置,
"   这样才能让vim-devicons有效
"   vim-gutetags要和ctags一起装才能用
"   ctags不仅要装vim插件, 还要在终端装: sudo apt install ctags
"   装完以后要在文件夹内执行: ctags -R * 才能生产tag文件，之后vim-gutetags和leaderf才有用
"   vim-airline要在安装vim-fugitive后才能显示分支名称
"   git-nerdtree目前没用，已提issue
"   YouCompleteMe要下载以下这些东西
"   sudo apt-get install build-essential cmake python-dev python3-dev
"   之后要去~/.vim/plugged/YouCompleteMe这个目录执行:
"   ./install.py --clang-completer
"   上面的--clang-completer可以改成--all, 这样这个插件就可以在所有语言上补齐了
"   增加python补全工具jedi
"   要先通过sudo pip install jedi 下载
"   jedi已经死了
"   python在vim里面已经死了
"   目前应该主要只会用来写c/cpp/golang了
"   python折磨死我了
"   golang在ycm里编译时要加上--go-completer, 可以和clangd的一起加

" Information from vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'easymotion/vim-easymotion'
Plug 'ludovicchabant/vim-gutentags/'
Plug 'universal-ctags/ctags'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'skywind3000/asyncrun.vim'
Plug 'dense-analysis/ale'
Plug 'liuchengxu/space-vim-dark'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'frazrepo/vim-rainbow'
Plug 'Yggdroot/indentLine'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'cpiger/NeoDebug'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'terryma/vim-multiple-cursors'


call plug#end()

" List ends here. Plugins become visible to Vim after this call.

nnoremap v <c-v>
"自动保存
let autosave=5
"分割线-----------------------------分割线
set tabstop=4
" Effective tab while editing
set softtabstop=4
" Tabs are space
set expandtab

" 关闭高亮
set nohlsearch

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Cursor line highlight
set cursorline

set wildmenu
set wildmode=longest,list,full

set incsearch
set hlsearch
set encoding=UTF-8

" 设置字体
set guifont=Andale\ Mono\ 10

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I


" Set cursor shape and color
if &term =~ "xterm"
    " INSERT mode
    let &t_SI = "\<Esc>[5 q" . "\<Esc>]12;white\x7"
    " REPLACE mode
    let &t_SR = "\<Esc>[3 q" . "\<Esc>]12;white\x7"
    " NORMAL mode
    let &t_EI = "\<Esc>[1 q" . "\<Esc>]12;white\x7"
endif
" 1 -> blinking block  闪烁的方块
" 2 -> solid block  不闪烁的方块
" 3 -> blinking underscore  闪烁的下划线
" 4 -> solid underscore  不闪烁的下划线
" 5 -> blinking vertical bar  闪烁的竖线
" 6 -> solid vertical bar  不闪烁的竖线

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

set splitbelow
set splitright
" set the color of comment
hi comment ctermfg=59

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

let mapleader=" "
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap noh       :noh<CR>
nnoremap ter       :ter<CR>
nnoremap 5ter      :ter ++rows=5<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
" Configuration of NERDTree
nnoremap <C-t>  :NERDTree<CR>
nnoremap <C-f>  :NERDTreeFind<CR>
nnoremap sovim  :so ~/.vimrc<CR>:noh<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" 定义跳出括号函数，用于跳出括号
inoremap <C-a> <C-[>la
" 将tab键绑定为跳出括号
" git-NerdTree
hi Directory guifg=#FF0000 ctermfg=white
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0
"分割线--------------------------------------------

" vim-nerdtree-syntax-highlight setting
" you can add these colors to your .vimrc to help customizing

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule
"分割线-------------------


"ctags setting
set tags=./.tags;,.tags


"airline setting
let g:airline#extensions#tabline#enabled = 1

"vim-gutentags setting
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_enabled = 1
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
if !executable('ctags')
    let g:gutentags_dont_load = 1
endif
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"space-vim-dark setting
colorscheme space-vim-dark
set termguicolors
hi Comment guifg=#5C6370 ctermfg=59
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

"ale setting
let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '✘'                          "错误提示符。
let g:ale_sign_warning = '!'                        "警告提示符。
let g:ale_echo_msg_error_str = 'E'                  "错误提示符。
let g:ale_echo_msg_warning_str = 'W'                "警告提示符。
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_sign_error = "\ue009\ue009"

let g:ale_linters = {
\   'c': ['clangd'],
\   'c++': ['clangd'],
\   'go' : ['gopls'],
\   'py' : ['flake8']
\}

" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

nmap <silent> <C-j> <Plug>(ale_previous_wrap)
nmap <silent> <C-k> <Plug>(ale_next_wrap)


" leaderf setting
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <leader>n :LeaderfMru<cr>
noremap <leader>f :LeaderfFunction!<cr>
noremap <leader>b :LeaderfBuffer<cr>
noremap <leader>t :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

"cpp hightlight setting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1

"youCompleteMe setting
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
               \ "py":1,
               \ "go":1,
			\ }

 let g:ycm_python_interpreter_path = 'usr/bin/python3.8'
 let g:ycm_python_sys_path = ['usr/lib/python3.8','usr/lib/python3.8/lib_dynload','usr/lib/python3/dist-packages']

 let g:ycm_extra_conf_vim_data = [
   \  'g:ycm_python_interpreter_path',
   \  'g:ycm_python_sys_path'
   \]
 let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

" vim-rainbow setting
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.c' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

let g:indentLine_char = '¦'

" python mode setting
filetype plugin indent on
let g:pymode_python = 'python3'
let g:pymode_options_colorcolumn = 1
let g:pymode_indent = 1
let g:pymode_indent = 1
let g:pymode_doc_bind = 'K'
let g:pymode_breakpoint_bind = '<leader>db'
set completeopt=menuone,noinsert
let g:pymode_rope = 0

"Pydiction setting
" let g:pydiction_location = '~/.vim/plugged/pydiction/complete-dict'
" let g:pydiction_menu_height = 3
"
" vim-go setting
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
au filetype go inoremap <buffer> . .<C-x><C-o>
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
      \ 'GODEBUG_OUTPUT':     'rightbelow 10new',
\ }
let g:go_debug_mappings = {
      \ '(go-debug-continue)': {'key': 'c', 'arguments': '<nowait>'},
      \ '(go-debug-next)': {'key': 'n', 'arguments': '<nowait>'},
      \ '(go-debug-step)': {'key': 's'},
      \ '(go-debug-print)': {'key': 'p'},
  \}
nnoremap gds :GoDebugStart<cr>
nnoremap gdt :GoDebugStop<cr>
nnoremap gdb :GoDebugBreakpoint<cr>

"asyncrun setting
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
" 定义 F9 为编译单文件
nnoremap <silent> <F9> :AsyncRun gcc -Wall "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" F5运行
nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']
" F7编译整个项目
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
" F8运行整个项目
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
" F4更新cmake
nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>

"NeoDebug setting
let g:neodbg_openbreaks_default    = 1               " Open breakpoints window, Default: 1
let g:neodbg_openstacks_default    = 0               " Open stackframes window, Default: 0
let g:neodbg_openthreads_default   = 0               " Open threads window, Default: 0
let g:neodbg_openlocals_default    = 1               " Open locals window, Default fault: 1
let g:neodbg_openregisters_default = 0               " Open registers window, Default: 0
let g:neodbg_console_height        = 15
