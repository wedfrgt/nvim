" ===== coc.nvim =====
let g:coc_global_extensions = [
  \ 'coc-json', 
  \ 'coc-pyright',
  \ 'coc-highlight',
  \ 'coc-explorer',
  \ 'coc-snippets',
  \ 'coc-cmake',
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

" 跳转到函数定义
nmap <silent> gd <Plug>(coc-definition)

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

" ===== markdown-preview =====

" SPACE + r 浏览Markdown文件
noremap <LEADER>r :MarkdownPreview<CR> 

" ===== snippets =====

" imap <M-k> <Plug>(coc-snippets-expand)
" vmap <M-l> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<m-l>'
let g:coc_snippet_prev = '<m-j>'
" imap <M-l> <Plug>(coc-snippets-expand-jump)

" ===== vim-bookmarks =====

highlight BookmarkSign ctermbg=NONE ctermfg=169
highlight BookmarkLine ctermbg=NONE ctermfg=169
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

" ===== rnvimr =====

noremap <LEADER><LEADER> :RnvimrToggle<CR>

" ===== coc_explorer =====

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

" ===== Vista =====

let g:vista_fzf_preview = ['right:50%']

noremap \\ :Vista!!<CR>
noremap \f :Vista finder!<CR>

" ===== fzf-lua =====

noremap <C-p> :FzfLua files<CR>
noremap <C-b> :FzfLua buffers<CR>

" ===== leap =====

lua require('leap').add_default_mappings()

" ===== gitgutter =====

let g:gitgutter_map_keys = 0
noremap <LEADER>gp <Plug>(GitGutterPreviewHunk)
noremap <LEADER>gs <Plug>(GitGutterStageHunk)
noremap <LEADER>gu <Plug>(GitGutterUndoHunk)
noremap g[ <Plug>(GitGutterPrevHunk)
noremap g] <Plug>(GitGutterNextHunk)

" ===== floatterm =====

let g:floaterm_height = 0.8
let g:floaterm_width = 0.8
let g:floaterm_keymap_toggle = '<F1>'
noremap tg :FloatermNew --autoclose=0 gcc % -o %< && ./%<
