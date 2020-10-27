"" general setting
let mapleader=" "
syntax on
set number  relativenumber
"" set norelativenumber
set cursorline
set cursorcolumn
set wrap
set showcmd
set wildmenu
exec "highlight Normal guibg=Black"

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

""  general setting
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"" fold codes
set fdm=indent

"" shotcut function
noremap <LEADER><CR> :nohlsearch<CR>
map s <nop>
map Q :q<CR>
map S :w<CR>

map R :source ~/.config/nvim/init.vim<CR>

map ; :
exec 'cd ' . fnameescape('~/WorkSpace/')
set autochdir

"" for C/Cpp environment
let g:syntastic_cpp_check_header = 1

"" key noremap
noremap h i
noremap i k
noremap k j
noremap j h
noremap I 5k
noremap K 5j
noremap J 7h
noremap L 7l

"" split setting
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map sl :set splitright<CR>:vsplit<CR>
"" split screen moving
map vl <C-w>l
map vi <C-w>k
map vj <C-w>h
map vk <C-w>j
"" split sreen resize
map <up>    :res +5<CR>
map <down>  :res -5<CR>
map <left>  :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
"" split screen layout
map sv  <C-w>t<C-w>H
map sh  <C-w>t<C-w>K
"" tabe setiing
map tu  :tabe<CR>
map tl  :+tabnext<CR>
map tj  :-tabnext<CR>


"complie function
noremap r :call CompileCurrentFile()<CR>
func! CompileCurrentFile()
       exec "w"
       "" exec "MarkdownPreview"
       if &filetype == 'vimwiki'
         exec "MarkdownPreview"
       elseif &filetype == 'python'
         set splitbelow
         :split
         :term python %
       endif
endfunc


"" vim-plug
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
"" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"" MarkDown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle'}
"" Vim Wiki
Plug 'vimwiki/vimwiki'

Plug 'mhinz/vim-startify'

Plug 'Yggdroot/indentLine'

Plug 'junegunn/vim-easy-align'

call plug#end()

"" ===
"" === morhetz/gruvbox
"" ===
colorscheme gruvbox
set background=dark
set guioptions=      " 去掉两边的scrollbar
set guifont=Monaco:h12

"" ===
"" === nerdtree
"" ===
"" let NERDTreeWinPos="right"
"" noremap nd :NERDTreeToggle<CR>
"" let g:NERDTreeDirArrowExpandable = '▸'
"" let g:NERDTreeDirArrowCollapsible = '▾'

"" ===
"" === auto complete (coc.nvim)
"" ===
"" coc-pyright
let g:coc_global_extensions = [
  \ 'coc-ccls',
  \ 'coc-vimlsp',
  \ 'coc-python', 
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-snippets',
  \ 'coc-yank',
  \ 'coc-gitignore',
  \ 'coc-vimlsp',
  \ 'coc-stylelint',
  \ 'coc-tslint',
  \ 'coc-lists',
  \ 'coc-git',
  \ 'coc-explorer',
  \ 'coc-sourcekit',
  \ 'coc-translator',
  \ 'coc-flutter',
  \ 'coc-todolist',
  \ 'coc-yaml',
  \ 'coc-tasks',
  \ 'coc-diagnostic',
  \ 'coc-prettier',
  \ 'coc-syntax',
  \ 'coc-eslint',
  \ 'coc-explorer']
"==
"=== coc-explorer
"==
nmap <LEADER>e :CocCommand explorer<CR>
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()

" Open up coc-commands
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" coctodolist
nnoremap <leader>tn :CocCommand todolist.create<CR>
nnoremap <leader>tl :CocList todolist<CR>
nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> <leader>ts :CocList tasks<CR>
" coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-e> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-e>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-n>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-e> <Plug>(coc-snippets-expand-jump)

" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"


" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"" if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
""   set signcolumn=number
"" else
""   set signcolumn=yes
"" endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use D to show documentation in preview window.
nnoremap <silent> D :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example <leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions. This for coc-explorer
"" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" ===
" === python shortcut
" ===
source  ~/.config/nvim/py-snippets.vim


" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

"" ===
"" === markdown-preview
"" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
map <LEADER>tm :TableModeToggle<CR>
source  ~/.config/nvim/md-snippets.vim

"" ===
"" === Yggdroot/indentLine
"" ===
let g:indentLine_color_gui = '#C0C0C0'
let g:indentLine_bgcolor_gui = '#696969'
"" let g:indentLine_char = 'c'
let g:indentLine_char_list = ['||', '|', '¦', ':']


"" ===
"" ===  vim-startify
"" ===
let g:startify_custom_header = [
\                                     '+----------------------------------------------------------+',
\                                     '|                                                          |',
\                                     '|     I have a rendezvous beyond my beloved horizon...     |',
\                                     '|                                                          |',
\                                     '+----------------------------------------------------------+',
\]
"" let g:startify_custom_footer = [
""             \ '+----------------------------------------------------------+',
""             \ '|                                                          |',
""             \ '|  ----------------------Footer-------------------------   |',
""             \ '|                                                          |',
""             \ '+----------------------------------------------------------+',
""             \]
let g:startify_change_to_dir = 1
let g:startify_files_number = 20
let g:startify_session_autoload = 1
map <LEADER>1  :Startify<CR>
"" ===
"" ===  vim-easy-align
"" ===
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
