call plug#begin('~/.config/nvim/plugged')

  Plug 'vim-airline/vim-airline'                                " vim底部导航栏
  Plug 'dracula/vim',{'as':'dracula'}                           " vim主题配色
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'ggandor/leap.nvim'                                      " vim光标快速移动
  Plug 'dstein64/vim-startuptime', {'on': 'StartupTime'}        " 检测vim启动速度
  " Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}         " 文件管理树
  Plug 'neoclide/coc.nvim', {'branch': 'release'}               " coc
  Plug 'honza/vim-snippets'                                     " 代码块
  Plug 'kevinhwang91/rnvimr'                                    " ranger in vim
  Plug 'MattesGroeger/vim-bookmarks'                            " 书签增强
  Plug 'mhinz/vim-startify'                                     " vim初始页美化
  Plug 'ibhagwan/fzf-lua'                                       " fzf-lua, 比fzf.vim性能更好
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }           " fzf
  Plug 'junegunn/fzf.vim'                                       " fzf.vim
  Plug 'liuchengxu/vista.vim'                                   " 右侧函数列表
  Plug 'kyazdani42/nvim-web-devicons'                           " 图标增强
  Plug 'airblade/vim-gitgutter'                                 " 左侧显示git记录

call plug#end()
