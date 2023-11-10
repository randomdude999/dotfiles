if !exists("g:useCoc")
    let g:useCoc = 1
endif

" load plugins
call plug#begin()
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
if g:useCoc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
else
    Plug 'neovim/nvim-lspconfig'
    Plug 'MunifTanjim/nui.nvim'
    Plug 'ShinKage/idris2-nvim'
endif
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'luochen1990/rainbow'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
call plug#end()

let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:rainbow_active = 1
let g:git_messenger_no_default_mappings = v:true
nmap <leader>b <Plug>(git-messenger)

let g:rainbow_conf = {
\	'guifgs': ['#fb4934', '#b8bb26', '#fabd2f', '#83a598', '#d3869b', '#8ec07c', '#fe8019'],
\	'guis': ['bold'],
\	'cterms': [''],
\	'operators': '',
\	'parentheses': ['start=/(/ end=/)/ fold'],
\	'separately': {
\		'*': 0,
\		'lisp': {},
\		'scheme': {},
\	}
\}

" always keep 5 lines visible from top/bottom
set scrolloff=5

" show line numbers (current line as absolute, others as relative)
set number relativenumber

" enable everything mouse-related
set mouse=a
set mousemodel=extend

" enable smart case-sensitivity
set ignorecase smartcase

" indent with spaces
set expandtab
" tab size 4
set shiftwidth=4
" leaving hard tabs at 8 cols
set tabstop=8
set softtabstop=4
" indent next line as much as previous
set autoindent

au Filetype make,c,cpp set noexpandtab tabstop=4 softtabstop=4

" nicer command autocomplete
set wildmenu wildmode=longest:full,full

" true colors
set termguicolors
" colorscheme
" also manually override some of the highlight groups
autocmd vimenter * ++nested colorscheme gruvbox |
    \ hi! link CocInlayHint GruvboxBg3 |
    \ hi! link CocHintVirtualText GruvboxBg3
" colorscheme configuration
set background=dark
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_invert_selection = 0

" " pressing tab shows completion where appropriate
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     else
"         return "\<c-p>"
"     endif
" endfunction
" inoremap <expr> <tab> InsertTabWrapper()
" inoremap <s-tab> <c-n>

" allow comments in json files
autocmd FileType json syntax match Comment +\/\/.\+$+

" sage file type
autocmd BufNewFile,BufRead *.sage set filetype=python

" always set window title
set title

" faster updates
set updatetime=300
" don't time out leader key sequences
set notimeout ttimeout
" use the right clipboard
set clipboard=unnamedplus

" always show signcolumn
set signcolumn=yes:1

" disable middle click paste
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

" gitsigns shortcuts
nmap ]c :Gitsigns next_hunk<CR>
nmap [c :Gitsigns prev_hunk<CR>
nmap <C-T> :tab split<CR>
map <C-Q> :py3f /usr/share/clang/clang-format.py<CR>
nmap <silent> <leader>i :CocCommand clangd.switchSourceHeader<CR>

" telescope shortcuts (were fzf)
" (back to fzf now because telescope setup is hard)
" switcheroo!
nmap <leader>o :Telescope git_files<CR>
nmap <leader>O :Telescope find_files<CR>
nmap <leader>g :Telescope live_grep<CR>
nmap <leader>l :Telescope resume<CR>
"nmap <leader>o :GFiles<CR>
"nmap <leader>O :Files<CR>
"nmap <leader>g :Rg<CR>


" ----------------
" Keybinds for coc
" ----------------

if g:useCoc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
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

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap <leader>a  <Plug>(coc-codeaction)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>r <Plug>(coc-rename)

endif
" ---
" vimtex options
" ---

let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \    '-shell-escape',
    \    '-verbose',
    \    '-file-line-error',
    \    '-synctex=1',
    \    '-interaction=nonstopmode',
    \ ],
    \ 'build_dir': 'out'
    \}

let g:vimtex_view_method = 'zathura'


" tree-sitter configuration
lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "html", "javascript", "rust", "cpp", "query" },
    highlight = {
        enable = true,
    },
    additional_vim_regex_highlighting = false,
}
require('gitsigns').setup()

if vim.g.useCoc == 0 then
    require'lspconfig'.pyright.setup{}
    require'idris2'.setup{}

    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']g', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })
end

EOF
