source ~/.config/nvim/lua_config.lua

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

" <LEADER>e 打开或关闭文件树
nnoremap <LEADER>e :CocCommand explorer<CR>

" ===== coc.nvim |end| =====

" ===== markdown-preview |start| =====

" SPACE + r 浏览Markdown文件
noremap <LEADER>r :MarkdownPreview<CR> 

" ===== markdown-preview |end| =====

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
highlight BookmarkLine ctermbg=NONE ctermfg=169
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

" ===== fzf-lua |start| =====

noremap <C-p> :FzfLua files<CR>
noremap <C-b> :FzfLua buffers<CR>

" ===== fzf-lua |end| =====

" ===== airline |start| =====

let g:airline#extensions#tabline#enabled = 0
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

" ===== airline |end| =====

" ===== leap |start| =====
lua require('leap').add_default_mappings()
" ===== leap |end| =====

" ===== Lualine |start| =====
noremap <silent><LEADER>1 :LualineBuffersJump 1<CR>
noremap <silent><LEADER>2 :LualineBuffersJump 2<CR>
noremap <silent><LEADER>3 :LualineBuffersJump 3<CR>
noremap <silent><LEADER>4 :LualineBuffersJump 4<CR>
noremap <silent><LEADER>5 :LualineBuffersJump 5<CR>
noremap <silent><LEADER>6 :LualineBuffersJump 6<CR>
noremap <silent><LEADER>7 :LualineBuffersJump 7<CR>
noremap <silent><LEADER>8 :LualineBuffersJump 8<CR>
noremap <silent><LEADER>9 :LualineBuffersJump 9<CR>
" ===== Lualine |end| =====
