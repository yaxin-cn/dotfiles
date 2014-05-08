set nocompatible
filetype off " required! For Vundle
" ==================================
" Vundle插件
" Install: git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" ==================================
if has('win32')
    set rtp+=D:/Protable/Editor/Vim74/Vim/vimfiles/bundle/vundle
else
    set rtp+=~/.vim/bundle/vundle
endif
call vundle#begin()
" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
" start add bundle repo
" 显示行末的空格；
Bundle 'ShowTrailingWhitespace'
" 自动识别文件编码
Bundle 'FencView.vim'
" 类似sublime中的ctrl+p搜索功能
Bundle 'kien/ctrlp.vim'
" 类似sublime中Ctrl+D多选功能 docs:https://github.com/terryma/vim-multiple-cursors/blob/master/README.md
Bundle 'terryma/vim-multiple-cursors'
" 自动补全
Bundle 'neocomplcache'
" Bundle 'ervandew/supertab'

" Python 插件
Bundle 'Pydiction'
Bundle 'fs111/pydoc.vim'
Bundle 'nvie/vim-flake8'
Bundle "msanders/snipmate.vim"

" 主题
Bundle 'Color-Scheme-Explorer'
Bundle 'Zenburn'
Bundle 'void'
Bundle 'yaxin-cn/colorscheme-yaxin'
Bundle 'tomasr/molokai'
Bundle 'chriskempson/vim-tomorrow-theme'

" just for fun
Bundle 'uguu-org/vim-matrix-screensaver'
Bundle 'vim-scripts/TeTrIs.vim'
" end add Bundle repo
call vundle#end()
filetype plugin indent on

" ==================================
" 插件配置
" ==================================
" supertab
let g:SuperTabDefaultCompletionType="context"
set completeopt=menuone,longest,preview
" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_quick_match = 1
" Pydiction
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
" vim-flake8
let g:pyflakes_use_quickfix = 0
let g:flake8_ignore="E501"

set diffexpr=MyDiff()

" ==================================
" 我的配置
" ==================================
set nocompatible
" 定义 <Leader> 为逗号
let mapleader = ","
let maplocalleader = ","
" 保留的历史记录
set history=500

" 行控制
" set linebreak
" set textwidth=80
" set wrap

" 标签页
set tabpagemax=9
" set showtabline=2

" 控制台响铃
set noerrorbells
set novisualbell
set t_vb= "close visual bell

" 行号和标尺
set number
set ruler
set rulerformat=%15(%c%V\ %p%%%)

" 命令行于状态行
set ch=1 "cmdheight
" 始终显示状态行laststatus
set ls=2
"命令行补全以增强模式运行
set wildmenu
set statusline=\ %t%m%r%h%y\ %w[%<%.36(%{getcwd()}%)]\ %=\ [%{&fileformat},%{&fileencoding}]\ %l/%L\ %=\[%P]\ " statusline

" Search Option
set hlsearch  " Highlight search things
set magic     " Set magic on, for regular expressions
set showmatch " Show matching bracets when text indicator is over them
set mat=2     " How many tenths of a second to blink
set noincsearch

" 制表符
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

" 状态栏显示目前所执行的指令
set showcmd

" 缩进
set autoindent
set smartindent

" 命令行粘贴
" set pastetoggle=<F11>

" 自动重新读入
set autoread

" 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set backspace=indent,eol,start

" 设定在任何模式下鼠标都可用
" set mouse=a

" 自动改变当前目录
if has('netbeans_intg')
    set autochdir
endif

" 备份和缓存
set nobackup
set noswapfile

" 自动完成
set complete=.,w,b,k,t,i
set completeopt=longest,menu

" 代码折叠
set foldmethod=marker

" ==================================
" AutoCmd
" ==================================
if has("autocmd")
    " 将指定文件的换行符转换成 UNIX 格式
    " au FileType php,javascript,html,css,python,vim,vimwiki set ff=unix
    " 括号自动补全
    func! AutoClose()
        :inoremap ( ()<ESC>i
        :inoremap " ""<ESC>i
        :inoremap ' ''<ESC>i
        :inoremap { {}<ESC>i
        :inoremap [ []<ESC>i
        :inoremap ) <c-r>=ClosePair(')')<CR>
        :inoremap } <c-r>=ClosePair('}')<CR>
        :inoremap ] <c-r>=ClosePair(']')<CR>
    endf
    func! ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
            return "\<Right>"
        else
            return a:char
        endif
    endf
    " Auto close quotation marks for PHP, Javascript, etc, file
    " au FileType php,javascript,css,html exe AutoClose()
    if has('win32')
        autocmd! bufwritepost $VIM/_vimrc source %
    else
        autocmd! bufwritepost ~/.vimrc source %
    endif
endif

" ==================================
" 颜色配置
" ==================================
if has('syntax')
    if has('gui_running')
        colorscheme molokai
    endif
    " 默认编辑器配色
    " au BufNewFile,BufRead,BufEnter,WinEnter * colo void
    " 各不同类型的文件配色不同
    au BufNewFile,BufRead,BufEnter,WinEnter *.wiki colo void
    " 保证语法高亮
    syntax on
endif

" ==================================
" 图形界面
" ==================================
if has("gui_running")
    " 配置字体，使用前请先安装字体
    set guifont=Inconsolata:h16
    " 高亮光标所在的行
    set cursorline
    " 启动窗口大小
    set lines=36 columns=122
    " 启动位置
	winpos 140 0
	if has("unix")
        " 启动窗口大小
		set lines=30 columns=99
        " 启动位置
		winpos 125 0
        " 修正unix下鼠标和选择的行为
		set selectmode=key
		set mousemodel=popup
		set keymodel=startsel,stopsel
		set selection=exclusive
		" 修正鼠标右键菜单行为
		noremap <RightMouse> <Nop>
		noremap <RightRelease> <RightMouse>
		noremap! <RightMouse> <Nop>
		noremap! <RightRelease> <RightMouse>
	endif
    if has("win32")
        " Windows 兼容配置
        source $VIMRUNTIME/mswin.vim
        behave mswin
        " f11 最大化
        nmap <f11> :call libcallnr('fullscreen.dll', 'ToggleFullScreen', 0)<cr>
        nmap <Leader>ff :call libcallnr('fullscreen.dll', 'ToggleFullScreen', 0)<cr>
    endif
    " 关闭菜单栏和工具栏
	set guioptions-=T "set guioptions-=m 隐藏菜单栏--set guioptions-=T 隐藏工具栏--set guioptions-=L 隐藏左侧滚动条--set guioptions-=r 隐藏右侧滚动条--set guioptions-=b 隐藏底部滚动条--set showtabline=0 隐藏Tab栏
	map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
    " 图形界面的状态栏
    set statusline=
    set statusline+=%1*
    set statusline+=\ %t%m%r%h%y
    set statusline+=\ %2*
    set statusline+=\ %w[%<%.36(%{getcwd()}%)]
    set statusline+=\ %3*
    set statusline+=%=
    set statusline+=%6*
    set statusline+=\ [%{&fileformat},%{&fileencoding}]
    set statusline+=\ %l/%L
    set statusline+=\ %=\[%P]
    set statusline+=\ " 添加一个空格
endif

" ==================================
" 编码设置，默认为utf-8
" ==================================
if has("multi_byte")
    " Vim内部使用的字符编码方式
	set encoding=utf-8
    " Vim对文件存档时候使用的编码方式
    set fileencoding=utf-8
    " Vim编码的自动识别，注意编码类型的顺序
	set fileencodings=ucs-bom,utf-8,gb2312,cp936,gb18030,big5,euc-jp,euc-kr,latin1
    " 不使用 Unicode 签名
    set nobomb
	" menu language
    if has("gui_running")
	    language message zh_CN.UTF-8
    	set langmenu=zh_CN.UTF-8
    	source $VIMRUNTIME/delmenu.vim
    	source $VIMRUNTIME/menu.vim
    endif
endif

" ==================================
" 按键绑定
" ==================================
" 保存
map <leader>w :w<CR>
" 退出
map <leader>q :q<CR
" 快捷编辑vimrcc
if has("unix")
	map <leader>e :e ~/.vimrc<CR>
else
	map <leader>e :e $VIM\_vimrc<CR>
endif
" <ESC>键的映射
" "imap jj <ESC>
" 插入模式按 F4 插入当前时间
imap <f4> <C-r>=GetDateStamp()<CR>
" 标签管理
nmap <C-t>   :tabnew<cr>
nmap <C-p>   :tabprevious<cr>
nmap <C-n>   :tabnext<cr>
nmap <C-k>   :tabclose<cr>
nmap <C-Tab> :tabnext<cr>

" ==================================
" 一些函数
" ==================================
function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            let cmd = '""' . $VIMRUNTIME . '\diff"'
            let eq = '"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" 获取当前目录
func! PWD()
    return substitute(getcwd(), "", "", "g")
endf

" 返回当前时期
func! GetDateStamp()
    return strftime('%Y-%m-%d')
endfunction

" 自定义用户颜色
hi User1 ctermfg=15 ctermbg=37 guifg=#ffffff guibg=#03acb1
hi User2 ctermfg=15 ctermbg=30 guifg=#ffffff guibg=#028785
hi User3 ctermfg=15 ctermbg=35 guifg=#ffffff guibg=#04b15e
hi User4 ctermfg=15 ctermbg=70 guifg=#ffffff guibg=#83b901
hi User5 ctermfg=15 ctermbg=214 guifg=#ffffff guibg=#fd8300
hi User6 ctermfg=15 ctermbg=214 guifg=#ffffff guibg=#16528e
