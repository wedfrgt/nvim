let mapleader=" "
syntax on

set tabstop=4
set shiftwidth=4
set expandtab     " 用space替代tab的输入
" set noexpandtab " 不用space替代tab的输入

set number
set relativenumber
set cursorline
set wrap
set wildmenu
set showcmd
set encoding=utf-8

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set scrolloff=10

noremap = nzz
noremap - Nzz
" 空格 + 回车 => 关闭 '/' 搜索的高亮
noremap <LEADER><CR> :nohlsearch<CR>	

" 仅在wsl需要此设置，因为默认wsl的<C-v>是粘贴windows系统的剪切板上的内容
noremap <C-v> <C-q> 

" bn => 下一个buffer    bp => 前一个buffer
" bq => 退出当前buffer  qq => 退出并保存
noremap bn :bn<CR>
noremap bp :bp<CR>
noremap bq :bw<CR>
noremap qq :wq<CR>

" W 保存
noremap W :w<CR>

" 光标移动
"    ^
"    i
" < j l >
"    k
"    v

noremap i k
noremap j h
noremap k j
noremap l l


" 窗口快速选择
" <C-i> 不知道为什么不能用, 所以这里采用了hjkl的移动方式, 而不是jikl,
" 与光标移动不同
"
"        ^
"      <C-k>
" < <C-h> <C-l> >
"      <C-j>
"        v

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Tab management
" tt => 跳转下一个窗口, tT => 跳转前一个窗口, tn => 创建新窗口,
" tmj => 将当前窗口向前移动, tml=> 将当前窗口向后移动
noremap tt gt
noremap tT gT
noremap tn :tabnew<CR>
noremap tmj :-tabmove<CR>
noremap tml :+tabmove<CR>

noremap h i
noremap H I

map r <nop>
" S 保存文件	和leap.nvim有冲突,故注释
" map S :w<CR>
" Q 退出文件
map Q :q<CR>
" R 刷新vimrc
map R :source $MYVIMRC<CR>

" 插件管理器
source ~/.config/nvim/plugins.vim

" 插件配置
source ~/.config/nvim/config.vim

" colorscheme dracula		" dracula主题
colorscheme cosme

" 快速打开lazygit
noremap <C-g> :tabe<CR>:term lazygit<CR>a
