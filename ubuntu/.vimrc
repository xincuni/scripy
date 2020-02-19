" 这个是vim的配置文件，同时在这最开始，解释一下后面出现的各种快捷键的意思
" F2打开目录结构  F3更换背景颜色  F4添加版权信息  F5运行代码  
" F6格式化代码,使符合PEP8规范
" 当你看到诸如 <C-p> 这样的键时，意为：按住 Ctrl + p 
" g<C-]>  意为：按 g ，然后同时按 Ctrl + ]
" <C-r>0  意为：同时按 Ctrl + r  然后按 0
" <C-w><C-=>  同时按 Ctrl + w ，然后同时按 Ctrl + =
" <Esc>  表示 Esc键
" <CR>   表示回车键，也写作<Enter>
" <S-Tab> 同时按<Shift>和<Tab>
" <Up>   表示光标上键
" <Down> 表示光标下键
"
let vim_pathogen_just_installed = 0
let vim_pathogen_path = expand('~/.vim/autoload/pathogen.vim')
if !filereadable(vim_pathogen_path)
    echo "Installing Vim-pathogen..."
    echo ""
    silent !mkdir -p ~/.vim/autoload ~/.vim/bundle
    silent !curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let vim_pathogen_just_installed = 1
endif
"python自动补全 https://github.com/davidhalter/jedi-vim
let g:jedi#goto_command = "<leader>d"    "跳转到定义处
let g:jedi#goto_assignments_command = "<leader>g"    "转到任务
let g:jedi#documentation_command = "K"    "显示文档
let g:jedi#usages_command = "<leader>n"    "用法
let g:jedi#completions_command = "<C-Space>"    "完成
let g:jedi#rename_command = "<leader>r"   "重命名
"以上是jedi的必配项
let g:jedi#auto_vim_configuration = 0    "关闭初始化vim的快捷键，不需要
"let g:jedi#auto_initialization = 0 "关闭自启动
let g:jedi#use_splits_not_buffers = "bottom"    "提示的位置，有 left right top bottom winwidth
let g:jedi#popup_select_first = 0
" 打开模块  :Pyimport os 这个是打开os模块
let g:jedi#goto_definitions_command = ""    "设置其他默认操作不启用


"=======================================
"插件管理
"pathogen https://github.com/tpope/vim-pathogen
"启用  在文件首行已经添加
"pathogen是为了解决每一个插件安装后文件分散到多个目录不好管理而存在的
"vundle是为了解决自动搜索及下载插件而存在的
"两个插件可同时使用

" Vundle配置 以下配置来自于官方文档： https://github.com/VundleVim/Vundle.vim
"取消VI兼容，VI键盘模式不易用
set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"配色方案
Plugin 'altercation/vim-colors-solarized'

"利用indentpython.vim插件 符合PEP8标准 缩进
Plugin 'vim-scripts/indentpython.vim'

"PEP8检查 https://github.com/vim-scripts/Flake8-vim
Plugin 'andviro/flake8-vim'

"检查代码语法 https://github.com/vim-syntastic/syntastic
Plugin 'scrooloose/syntastic'

"文件树形结构 NERDTree https://github.com/scrooloose/nerdtree
Bundle 'scrooloose/nerdtree'

" airline是一个状态栏插件 https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"代码折叠
Plugin 'tmhedberg/SimpylFold'

"缩进提示 https://github.com/nathanaelkane/vim-indent-guides
Plugin 'nathanaelkane/vim-indent-guides'

"markdown 支持 https://github.com/plasticboy/vim-markdown 支持但是不能实时预览，只是支持语法等功能
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"https://github.com/tpope/vim-markdown
"Plugin 'tpope/vim-markdown'
"https://github.com/iamcco/markdown-preview.vim 可实时预览，但是需要桌面版的才可以
Plugin 'iamcco/markdown-preview.vim'

"超级搜索  https://github.com/kien/ctrlp.vim
Plugin 'kien/ctrlp.vim'

"supertab  https://github.com/ervandew/supertab
Plugin 'ervandew/supertab'

" 添加注释 https://github.com/tpope/vim-commentary
Plugin 'tpope/vim-commentary'

"python代码补全 https://github.com/SirVer/ultisnips
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

"python的虚拟环境 https://github.com/jmcantrell/vim-virtualenv
"VirtualEnvList 列出所有的虚拟环境
" VirtualEnvActivate 选择虚拟环境
Plugin 'jmcantrell/vim-virtualenv' 

"代码补全 
Plugin 'Valloric/YouCompleteMe'
" All of your Plugins must be added before the following line
call vundle#end()            " required
" 自动下载插件
if vim_pathogen_just_installed
    echo "Installing ..."
    :PluginInstall
    :q
endif
filetype plugin indent on    " required
"插件管理
"=======================================
execute pathogen#infect()
" 定义前缀键 ;  既后面出现的 <Leader> 使用如下命令
let mapleader=";"


"========================================
"界面美化
"以下是主题风格
"打开语法高亮 此配置参考于： http://blog.csdn.net/g_brightboy/article/details/14229139
syntax on
if has('gui_running')
    set background=light
else
    set background=dark
endif
"这里提供了一种配色方案
"Solarized 
let g:solarized_termcolors=256
set t_Co=256
colorscheme solarized  "https://github.com/altercation/vim-colors-solarized
"Solarized自带切换背景函数
call togglebg#map("<F3>")

"vim配置
"打开文件类型检测功能
filetype on
"不同文件类型采用不同缩进
filetype indent on
"允许使用插件
filetype plugin on
filetype plugin indent on
"关闭vi模式
set nocp
"与windows共享剪贴板
set clipboard+=unnamed
"显示行号, 或set number
set nu
"历史命令保存行数 
set history=100 
"当文件被外部改变时自动读取
set autoread 
"取消自动备份及产生swp文件
"set nobackup
"set nowb
"set noswapfile
"允许使用鼠标点击定位
set mouse=a
"允许区域选择
set selection=exclusive
set selectmode=mouse,key
"取消光标闪烁
set novisualbell
"总是显示状态行
set laststatus=2
"状态栏显示当前执行的命令
set showcmd
"标尺功能，显示当前光标所在行列号
set ruler
"设置命令行高度为3
set cmdheight=3
"粘贴时保持格式
set paste
"高亮显示匹配的括号
set showmatch
"在搜索的时候忽略大小写
set ignorecase
"高亮被搜索的句子
set hlsearch
"在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch
"继承前一行的缩进方式，特别适用于多行注释
set autoindent
"为C程序提供自动缩进
set smartindent
"使用C样式的缩进
"set cindent
"制表符为4
set tabstop=4
"用空格替换tab
set expandtab
"统一缩进为4
set softtabstop=4
set shiftwidth=4
"允许使用退格键，或set backspace=2
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
"取消换行
set nowrap
"启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI
"在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
"光标移动到buffer的顶部和底部时保持3行距离, 或set so=3
set scrolloff=3
"设定默认解码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
"设定字体
"set guifont=Courier_New:h11:cANSI
"set guifontwide=新宋体:h11:cGB2312
"设定编码
set enc=utf-8
set fileencodings=ucs-bom,utf-8,chinese
set langmenu=zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键 这些配置在界面版里面才有作用
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
autocmd VimEnter * call ToggleFullscreen()
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 设置状态栏airline主题风格
set lazyredraw
let g:airline_theme='powerlineish'
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" 显示buffer编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = '🔥'
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '💦'
" 关于buffer使用：
"     :ls 查看buffer
"     :bn (buffer next)
"     :bp (buffer previous)
"     :b <num> 打开编号为num的buffer

"缩进提示  随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"markdown支持
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal = 0
let g:markdown_minlines = 100
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_level = 6
"=======================================

"=======================================
"代码补全  jedi必须放在文件开始，所以就不放在这里
" YouCompleteMe 自动补全 参考于: http://www.cnblogs.com/Harley-Quinn/p/6418070.html
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_keep_logfiles=1
let g:ycm_server_log_level='debug'
let g:ycm_confirm_extra_conf=0
let g:ycm_autoclose_preview_window_after_completion=1       "提示结束后不关闭提示窗
let g:ycm_collect_identifiers_from_tags_files=1             "开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings=1   "注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]                    "这里不检查python语法
let g:ycm_seed_identifiers_with_syntax=1                    "语法关键字补全
let g:ycm_complete_in_comments=1
let g:ycm_key_list_select_completion=['<c-n>', '<Down>']    "映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion=['<c-p>', '<Up>']
let g:ycm_complete_in_comments=1                            "在注释输入中也能补全
let g:ycm_complete_in_strings=1                             "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings=1   "注释和字符串中的文字也会被收入补全
let g:ycm_show_diagnostics_ui=1                             "语法检查
"回车即选中当前项
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
let g:ycm_min_num_of_chars_for_completion=2                 "从第2个键入字符就开始罗列匹配项
"按 ;gb 会跳转到定义 silent是指执行键绑定时不在命令行上回显
nnoremap <silent> gb :YcmCompleter GoToDefinitionElseDeclaration<CR> 
let g:ycm_python_binary_path='/usr/bin/python3'
let g:ycm_python_binary_path='python'
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
map <F7> :YcmDiags<CR>


""set UltiSnips
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrgger="<leader><tab>"
let g:UltiSnipsListSnippets="<c-e>"

"=======================================

"=======================================
"代码分析
"python代码的 PEP8 风格
au BufNewFile,BufRead *.py
\set tabstop=4 |
\set softtabstop=4 |
\set shiftwidth=4 |
\set textwidth=79 |
\set expandtab |
\set autoindent |
\set fileformat=unix

"全栈开发
au BufNewFile,BufRead *.js
\set tabstop=2 |
\set softtabstop=2 |
\set shiftwidth=2 

au BufNewFile,BufRead *.html
\set tabstop=2 |
\set softtabstop=2 |
\set shiftwidth=2 

au BufNewFile,BufRead *.css
\set tabstop=2 |
\set softtabstop=2 |
\set shiftwidth=2 

"标示不必要的空白字符 将多余的空白字符标示出来，很可能会将它们变成红色突出
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*pyw,*.c,*.h match BadWhitespace /\s\+$/

"代码折叠
" Enable folding 开启代码折叠 基于缩进或语法进行代码折叠
set foldmethod=indent
set foldmethod=syntax
set foldlevel=99
" Enable folding with the spacebar 空格折叠代码
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

"代码分析
"=======================================

"=======================================
" 项目管理
" NERDTree config http://www.jianshu.com/p/eXMxGx
"autocmd vimenter * NERDTree
"显示增强
let NERDChristmasTree=1
"自动调整焦点
let NERDTreeAutoCenter=1
"鼠标模式:目录单击,文件双击
let NERDTreeMouseMode=2
"打开文件后自动关闭
let NERDTreeQuitOnOpen=0
"显示文件
let NERDTreeShowFiles=1
"显示隐藏文件
let NERDTreeShowHidden=0
"高亮显示当前文件或目录
let NERDTreeHightCursorline=1
"显示行号
let NERDTreeShowLineNumbers=1
"窗口位置
let NERDTreeWinPos='right'
"窗口宽度
let NERDTreeWinSize=31
"不显示'Bookmarks' label 'Press ? for help'
"let NERDTreeMinimalUI=1
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp','__pycache__','\.git$','\.DS_Store']
" NERDTree git 扩展
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
"快捷键
nnoremap <silent> <F2> :NERDTreeToggle<CR>
"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
""只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
"项目管理
"=======================================

"=======================================
"python 代码设置
"给所有新建的python文件加上文件头
function SetTop()
    call append(0,"# -*- coding:utf-8 -*-")
endfunction
au BufNewFile *.py call SetTop()
"pyflakes-vim https://github.com/kevinw/pyflakes-vim
let g:pyflakes_use_quickfix = 1 "这是开关

"flake8 https://github.com/andviro/flake8-vim
"https://github.com/andviro/flake8-vim/tree/master/ftplugin/python
"http://blog.csdn.net/rainysia/article/details/46774163
"Auto-check file for errors on write: 
let g:PyFlakeOnWrite = 1 
"List of checkers used: 
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes' 
"Default maximum complexity for mccabe: 
let g:PyFlakeDefaultComplexity=10 
"List of disabled pep8 warnings and errors: 
let g:PyFlakeDisabledMessages = 'E501' 
"Default height of quickfix window: 
let g:PyFlakeCWindow = 6 
"Whether to place signs or not: 
let g:PyFlakeSigns = 1 
"Maximum line length for PyFlakeAuto command 
let g:PyFlakeMaxLineLength = 100 
"Visual-mode key command for PyFlakeAuto 
let g:PyFlakeRangeCommand = 'Q' 
"直接按F6来修复pep8的错误
map <F6> :PyFlakeAuto<CR>

"语法检查设置 https://github.com/vim-syntastic/syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open=1
"let g:syntastic_check_on_wq = 1
"let g:syntastic_error_symbol='>>'
"let g:syntastic_warning_symbol='>'
"let g:syntastic_aggregate_errors = 1    "将不同的检查器的错误都显示出来
"let g:syntastic_enable_highlighting=1
"let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
" 修改高亮的背景色, 适应主题
highlight SyntasticErrorSign guifg=white guibg=black

" to see error location list
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>
" nnoremap <Leader>sn :lnext<cr>
" nnoremap <Leader>sp :lprevious<cr>

"python 代码设置
"=======================================


""""""""""""""""""""""
"Quickly Run 按F5自动运行
""""""""""""""""""""""
"au BufRead *.py map <buffer> <F5> :w<CR>:!/home/pyvip/.virtualenvs/py3env/bin python % <CR>
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc

" 添加文件头 
" 设置版权信息文件声明等
map <F4> :call TitleSet()<cr>'s
function AddUserInformation()
    call append( 1, "'''")
    call append( 2, "#    COPYRIGHT NOTICE")
    call append( 3, "#    Copyright (c) 2017")
    call append( 4, "#    All rights reserved")
    call append( 5, "#")
    call append( 6, "#    @author            :TanZhouJiaoYu")
    call append( 7, "#    @name              :PythonVIP")
    call append( 8, "#    @file              :".expand("%:p:h")."/".expand("%:t"))
    call append( 9, "#    @creation_date     :".strftime("%Y/%m/%d %H:%M"))
    call append(10, "#    @modification_date :".strftime("%Y/%m/%d %H:%M"))
    call append(11, "'''")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
"更新最近修改时间和文件名
function UpdateUserInformation()
    normal m'
    execute '/#    @modification_date /s@:.*$@\=strftime(":%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/#    @file              /s@:.*$@\=":".expand("%:p:h")."/".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"判断前10行代码里面，是否有COPYRIGHT NOTICE这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleSet()
    let line = getline(3)
    let str = '#    COPYRIGHT NOTICE'
    if line =~ str
        call UpdateUserInformation()
        return
    else 
        call AddUserInformation()
    endif
endfunction


"remember last update or view postion" 记住上次编辑和浏览位置,打开文件时会自动跳转到上次文件浏览的位置
" Only do this part when compiled with support for autocommands 
if has("autocmd")
" In text files, always limit the width of text to 78 characters 
autocmd BufRead *.txt set tw=78
" When editing a file, always jump to the last cursor position 
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif 
endif
