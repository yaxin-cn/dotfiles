set nocompatible
filetype off " required! For Vundle
" ===============
" Vundle插件
" ===============
if has('win32')
    set rtp+=D:/Protable/Editor/Vim/vimfiles/bundle/vundle
else
    set rtp+=~/.vim/bundle/vundle
endif
call vundle#rc()
" let Vundle manage Vu ndle
" required!
Bundle 'gmarik/vundle'
" 相较于Command-T等查找文件的插件，ctrlp.vim最大的好处在于没有依赖，干净利落
Bundle 'ctrlp.vim'
" 在输入()，""等需要配对的符号时，自动帮你补全剩余半个
" Bundle 'AutoClose'
" 神级插件，ZenCoding可以让你以一种神奇而无比爽快的感觉写HTML、CSS
" Bundle 'ZenCoding.vim'
Bundle 'mattn/emmet-vim'
" 在()、""、甚至HTML标签之间快速跳转；
Bundle 'matchit.zip'
" 显示行末的空格；
Bundle 'ShowTrailingWhitespace'
" JS代码格式化插件；
Bundle '_jsbeautify'
" 用全新的方式在文档中高效的移动光标，革命性的突破
Bundle 'EasyMotion'
" 自动识别文件编码
Bundle 'FencView.vim'
" 必不可少，在VIM的编辑窗口树状显示文件目录
Bundle 'The-NERD-tree'
" NERD出品的快速给代码加注释插件，选中，`ctrl+h`即可注释多种语言代码；
Bundle 'The-NERD-Commenter'
" 解放生产力的神器，简单配置，就可以按照自己的风格快速输入大段代码。
" Bundle 'UltiSnips'
" 让代码更加易于纵向排版，以=或,符号对齐
Bundle 'Tabular'
" 自动补全
Bundle 'neocomplcache'
" 迄今位置最好的自动VIM自动补全插件了吧
" Vundle的这个写法，是直接取该插件在Github上的repo
" Bundle 'Valloric/YouCompleteMe'
" vimwiki
Bundle 'vimwiki'
" markdown语法
Bundle 'hallison/vim-markdown'
" vim for wordpress
Bundle 'pkufranky/VimRepress'

Bundle 'fs111/pydoc.vim'
Bundle 'nvie/vim-flake8'
Bundle "msanders/snipmate.vim"
" Bundle 'ervandew/supertab'
Bundle 'sjl/gundo.vim'
Bundle 'TaskList.vim'
" powerline
" Bundle 'Lokaltog/powerline'
" 主题
Bundle 'Color-Scheme-Explorer'
Bundle 'Zenburn'
Bundle 'void'
Bundle 'yaxin-cn/colorscheme-yaxin'
" 语法
Bundle 'nginx.vim'
set diffexpr=MyDiff()

" =============
" 我的配置
" =============
set nocompatible
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
if has('gui_running')
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
else
    set statusline=\ %t%m%r%h%y\ %w[%<%.36(%{getcwd()}%)]\ %=\ [%{&fileformat},%{&fileencoding}]\ %l/%L\ %=\[%P]\ " statusline
endif

" 定义 <Leader> 为逗号
let mapleader = ","
let maplocalleader = ","

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
set pastetoggle=<F11>

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

" ================
" AutoCmd
" ================
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

" =============
" 颜色配置
" =============
if has('syntax')
    " colorscheme molokai-yaxin
    " 默认编辑器配色
    " au BufNewFile,BufRead,BufEnter,WinEnter * colo void
    " 各不同类型的文件配色不同
    au BufNewFile,BufRead,BufEnter,WinEnter *.wiki colo void
    " 保证语法高亮
    syntax on
endif

" ================
" 图形界面
" ================
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
endif


" =====================
" 编码设置，默认为utf-8
" =====================
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

" =====================
" 按键绑定
" =====================
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

" =====================
" 插件配置 plugin setting
" =====================
" emmet
" let g:user_emmet_expandabbr_key = 'jj'
let g:user_emmet_settings = {
\  'php' : {
\    'extends' : 'html',
\    'filters' : 'c',
\  },
\  'xml' : {
\    'extends' : 'html',
\  },
\  'haml' : {
\    'extends' : 'html',
\  },
\}
" vimwiki
let g:vimwiki_use_mouse=1
if !exists("g:vimwiki_list")
    let g:vimwiki_list = [
                \{"path": "~/yaxin/wiki/",
                \"syntax": "markdown",
                \"path_html": "~/yaxin/wiki/html/",
                \'template_path': '~/yaxin/wiki/template',
                \'template_ext': '.html',
                \"html_footer": "~/yaxin/wiki/template/footer.tpl",
                \"html_header": "~/yaxin/wiki/template/header.tpl",
                \'ext': '.wiki',
                \'auto_export': 0},
                \]
    let g:vimwiki_auto_checkbox = 0
    if has('win32')
        " 注意！
        " 1、如果在 Windows 下，盘符必须大写
        " 2、路径末尾最好加上目录分隔符
        let s:vimwiki_root = "F:/yaxin/wiki"
        let g:vimwiki_list = [
                    \{"path": s:vimwiki_root."/",
                    \"syntax": "markdown",
                    \"path_html": s:vimwiki_root."/html/",
                    \"html_footer": s:vimwiki_root."/template/footer.tpl",
                    \"html_header": s:vimwiki_root."/template/header.tpl",
                    \"auto_export": 0},
                    \]
        " let g:vimwiki_w32_dir_enc = 'cp936'
    endif

    au FileType vimwiki set ff=unix fenc=utf8 noswapfile nobackup
    "au FileType vimwiki imap <C-t> <c-r>=TriggerSnippet()<cr>

    nmap <C-i><C-i> :VimwikiTabGoHome<cr>
    nmap <Leader>ii :VimwikiTabGoHome<cr>
endif
let g:vimwiki_ext2syntax = {
            \'.md': 'markdown',
            \'.wiki': 'markdown'
            \}

" vimpress
let VIMPRESS = [{'username': 'yaxin',
                \'password': 'xinmu092921',
                \'blog_url': 'http://xinmu.me/blog',
                \},
                \]

" supertab
au FileType python set omnifunc=pythoncomplete
let g:SuperTabDefaultCompletionType="context"
set completeopt=menuone,longest,preview
" TaskList
map <leader>td <Plug>TaskList
" Gundo
map <leader>g :GundoToggle<CR>
" vim-flake8
let g:pyflakes_use_quickfix = 0
let g:flake8_ignore="E501"
" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_quick_match = 1
" NERD Tree
map <leader>n :NERDTreeToggle<CR>
" nginx
au BufRead,BufNewFile $HOME/nginx_conf/*.conf,/usr/local/nginx/conf/*.conf,/etc/nginx/conf/*.conf,*.com.conf,*.me.conf,*.io.conf  set ft=nginx

" 一些函数
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

" For Bundle
filetype plugin indent on " required!

let blog = "F:/yaxin/blog/"
