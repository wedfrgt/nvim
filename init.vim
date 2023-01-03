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
noremap <LEADER><CR> :nohlsearch<CR>	" 空格 + 回车

noremap <C-v> <C-q>

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
call plug#begin('~/.config/nvim/plugged')

  Plug 'vim-airline/vim-airline'	" vim底部导航栏
  Plug 'dracula/vim',{'as':'dracula'}   	" vim主题配色
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'ggandor/leap.nvim'
  Plug 'dstein64/vim-startuptime', {'on': 'StartupTime'}
  Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'} 		" 文件管理树
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'honza/vim-snippets'
  Plug 'kevinhwang91/rnvimr'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'mhinz/vim-startify'
  Plug 'ibhagwan/fzf-lua'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'liuchengxu/vista.vim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'airblade/vim-gitgutter'

call plug#end()

" colorscheme dracula		" dracula主题
colorscheme cosme

" ff 打开或关闭文件树
nnoremap <LEADER>e :CocCommand explorer<CR>
noremap ff :NERDTreeMirror<CR>
noremap ff :NERDTreeToggle<CR>
" SPACE + r 浏览Markdown文件
noremap <LEADER>r :MarkdownPreview<CR> 

lua require('leap').add_default_mappings()

" ===== coc.nvim |start| =====
let g:coc_global_extensions = [
  \ 'coc-json', 
  \ 'coc-pyright',
  \ 'coc-highlight',
  \ 'coc-explorer',
  \ 'coc-snippets',
  \ 'coc-vimlsp']

set updatetime=100
set shortmess+=c

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 空格+, ==> 向前查找报错信息
" 空格+. ==> 向后查找报错信息
nmap <silent> <LEADER>, <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>. <Plug>(coc-diagnostic-next)

" 跳转到函数在哪被定义等
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <LEADER>h :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" ===== coc.nvim |end| =====

" ===== snippets |start| =====

" noremap <m-,> <nop>
" noremap <m-.> <nop>
imap <M-k> <Plug>(coc-snippets-expand)
vmap <M-l> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<m-l>'
let g:coc_snippet_prev = '<m-j>'
" imap <M-l> <Plug>(coc-snippets-expand-jump)

" ===== snippets |end| =====

" ===== vim-bookmarks |start| =====

highlight BookmarkSign ctermbg=NONE ctermfg=169
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

" ===== vim-bookmarks |end| =====

" ===== rnvimr |start| =====

noremap <LEADER><LEADER> :RnvimrToggle<CR>

" ===== rnvimr |end| =====

" ===== coc_explorer |start| =====

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.config/nvim/',
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\ }

" Use preset argument to open it
nmap <space>v <Cmd>CocCommand explorer --preset .vim<CR>
nmap <space>f <Cmd>CocCommand explorer --preset floating<CR>

" ===== coc_explorer |end| =====

" ===== Vista |start| =====

let g:vista_fzf_preview = ['right:50%']

noremap \\ :Vista!!<CR>
noremap \f :Vista finder<CR>

" ===== Vista |end| =====

" ===== vim-fold |start| =====

set foldmethod=syntax
set foldlevel=99

" ===== vim-fold |end| =====

" ===== fzf-lua |start| =====

noremap <C-p> :FzfLua files<CR>
lua <<EOF
require("fzf-lua").setup({
    winopts = { 
        height = 0.8,
        width = 0.8,
    },
    files = {
        prompt = 'Files❯ ', -- example, not required
    },
})
EOF

" ===== fzf-lua |end| =====

" ===== airline |start| =====

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" ===== airline |start| =====
