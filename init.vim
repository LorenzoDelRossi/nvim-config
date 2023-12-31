" Plug related config

call plug#begin()

"" Status bar
Plug 'bling/vim-airline'

" Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ALterantive to FzF
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

" Themes :3
Plug 'morhetz/gruvbox'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'srcery-colors/srcery-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'jacoborus/tender.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
Plug 'nikolvs/vim-sunbather'
Plug 'mildewchan/takodachi.vim' 
Plug 'navarasu/onedark.nvim'

Plug 'famiu/nvim-reload'

" Tree/directory explorer
" Plug 'preservim/nerdtree'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons' 

" Tags in the current file
" Plug 'preservim/tagbar'

" Autopairs
Plug 'jiangmiao/auto-pairs'

" Coc
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile', 'branch': 'master'}

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Track coding time
Plug 'wakatime/vim-wakatime'

" Markdown live preview via browser
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Editorconfig auto detect
" Plug 'editorconfig/editorconfig-vim'

" Comment stuff
Plug 'tpope/vim-commentary' 

" Distraction free editing
Plug 'junegunn/goyo.vim'

" Auto configure indentation
Plug 'tpope/vim-sleuth'

" LaTeX
Plug 'lervag/vimtex'

" Multicursor
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Notes related
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-notes'

" Debugging
Plug 'puremourning/vimspector'

" Neovim built in LSP
Plug 'neovim/nvim-lspconfig'
Plug 'tjdevries/lsp_extensions.nvim'
 " Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

 " Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}

" Custom language related plugins
Plug 'tjdevries/nlua.nvim'          " Lua development
Plug 'nvim-lua/lsp-status.nvim'     " Lua statusline
Plug 'euclidianAce/BetterLua.vim'   " Better lua
" Plug 'nvim-lua/completion-nvim'     " Better LSP completition

Plug 'ziglang/zig.vim'              " Zig language support

" Go lang
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" C lang based formatting
" By default it uses the Google style, if not .clang-format
" file was given
Plug 'rhysd/vim-clang-format'

" Language check
Plug 'dpelle/vim-LanguageTool'

" Because why not
Plug 'ThePrimeagen/vim-apm'

" Wiki :3
Plug 'vimwiki/vimwiki'

" SageMath
Plug 'petRUShka/vim-sage'

" Js
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'eslint/eslint'

" Ts
Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'

" Python
Plug 'fisadev/vim-isort'
Plug 'HallerPatrick/py_lsp.nvim'

" GitHub Actions
Plug 'yasuhiroki/github-actions-yaml.vim'

" Terraform
Plug 'hashivim/vim-terraform'

" Handlebars
Plug 'mustache/vim-mustache-handlebars'

" Dataform
Plug 'andres-lowrie/vim-sqlx'

" Elixir
Plug 'elixir-lang/vim-elixir'

" Prisma
Plug 'pantharshit00/vim-prisma'

" SQLx
Plug 'andres-lowrie/vim-sqlx'

" Code reviews
Plug 'pwntester/octo.nvim'

" Misc
Plug 'kyazdani42/nvim-web-devicons'

" Go to Github line
Plug 'ruanyl/vim-gh-line'

" Git Blame in-line
Plug 'APZelos/blamer.nvim'

" Lisp
Plug 'vlime/vlime', {'rtp': 'vim/'}
Plug 'bhurlow/vim-parinfer'

" Lsp diagnostics
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

" Better Vim terminal integration
Plug 'wincent/terminus'

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

" Folding
Plug 'pedrohdz/vim-yaml-folds'

" Show fancy indentation
Plug 'Yggdroot/indentLine'

" nvim v0.7.2
Plug 'kdheepak/lazygit.nvim'

" Tabnine
Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }

" Color pair brackets
Plug 'bounceme/poppy.vim'

" Highlight occurrences for text under cursor
Plug 'itchyny/vim-cursorword'

"Copilot
Plug 'github/copilot.vim'

" Fold code
Plug 'pseewald/vim-anyfold'

call plug#end()

" LSP related
 lua require('init')

 let g:use_nvim_lsp = 1

if g:use_nvim_lsp
    setlocal omnifunc=v:lua.vim.lsp.omnifunc

    nnoremap <silent> gd            <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> gD            <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <silent> gdd           <cmd>lua vim.lsp.buf.declaration()<CR>
    nnoremap <silent> K             <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <silent> <c-k>         <cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap <silent> 1gD           <cmd>lua vim.lsp.buf.type_definition()<CR>
    nnoremap <silent> gr            <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <silent> gR            <cmd>lua vim.lsp.buf.rename()<CR>
    nnoremap <silent> g0            <cmd>lua vim.lsp.buf.document_symbol()<CR>
    nnoremap <silent> gW            <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
    nnoremap <silent> <Leader>[     <cmd>lua vim.lsp.strutures.Diagnostics.buf_move_next_diagnostic()<CR>
    nnoremap <silent> <Leader>]     <cmd>lua vim.lsp.strutures.Diagnostics.buf_move_prev_diagnostic()<CR>

    augroup NvimLSP
        autocmd!
        " autocmd BufWritePre *.py,*.rs,*.ex,*.js,*.ts lua vim.lsp.buf.format(nil, 2000)
        autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
        " autocmd BufEnter,BufWritePost *.rs lua require('lsp_extensions.inlay_hints').request { aligned = true, prefix = " » " }
    augroup END

    " Custom LSP diagnostics signs
    " sign define LspDiagnosticsErrorSign text=E linehl=ErrorMsg texthl=LspDiagnosticsError numhl=
    " sign define LspDiagnosticsWarningSign text=W linehl=MoreMsg texthl=LspDiagnosticsWarningSign numhl=
end

" Golang related
" Autoformat
" autocmd BufWritePre *.go lua goimports(2000)
" Jump to Test files
autocmd FileType go nnoremap <silent> gts <cmd>lua go_switch()<CR>

" When we move the cursor we activate the bracket colorizing
au! cursormoved * call PoppyInit()

" Ziglang related
" Autoformatting
let g:zig_fmt_autosave = 1

" Git blame config
let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = ' '
let g:blamer_template = '<author> <committer-time> • <summary>'
let g:blamer_date_format = '%d/%m/%y'
let g:blamer_relative_time = 1


" Python related
" Windows shit
if has("win32")
    let g:python3_host_prog = 'C:\Users\2pac\scoop\apps\python\current\python.EXE'
endif

" Activate folding for all filetypes
autocmd Filetype * AnyFoldActivate 
set foldlevel=99

" C/C++ related
" Enable Clang auto fromatting on C based languages
autocmd FileType c,cpp,objc ClangFormatAutoEnable

" YAML
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'
" Start with unfolded yamls
set foldlevelstart=20

" Make JSON foldable
autocmd FileType json set foldmethod=syntax

" Javascript formatting
" autocmd BufWritePre *.js :normal mpgg=G`p

" General configuration
" ---------------------

" Map Leader to Space
let mapleader=" "

set nocompatible
syntax on

set t_Co=256

if (has("termguicolors"))
    set termguicolors
endif

" Theme :3
set background=dark
colorscheme tender
let g:airline_theme = 'tender'
" set background=dark
" colorscheme nord
" let g:airline_theme = 'nord'

" set background=light
" colorscheme sunbather
" let g:airline_theme = 'sunbather'

" colorscheme srcery
" colorscheme vim-monokai-tasty

" Onehalf
" set background=light
" colorscheme onehalflight
" set background=dark
" colorscheme gruvbox
" let g:airline_theme = 'gruvbox'
" colorscheme onehalfdark
" let g:airline_theme = 'onehalfdark'

" Solarized config
" let g:solarized_termtrans = 1
" let g:solarized_termcolors = 256
" colorscheme solarized

" Onedark
" custom theme config
" let g:onedark_config = {
"     \ 'style': 'deep',
"     \ 'toggle_style_key': '<leader>ts',
" \}
" colorscheme onedark

" set background=dark
" colorscheme PaperColor
" let g:airline_theme='papercolor'

" Airline theme

" Disable startup message
set shortmess+=I

" Number configurations
set relativenumber
set number	

" Line break config
set textwidth=0

" Status line config
set laststatus=2

" Search config
set showmatch	
set hlsearch	
set smartcase	
set ignorecase	
set incsearch	

set cursorline
set ruler	
set undolevels=1000
set backspace=indent,eol,start
set noerrorbells visualbell t_vb=
set belloff=all

" mouse support
set mouse+=a

set noshowmode

set cmdheight=1
set showmatch  
set hidden     

set completeopt-=preview

set noequalalways
set splitright
set splitbelow
set updatetime=1000

set hlsearch

" Make it so there are always ten lines below my cursor
set scrolloff=10 

" Tabs
" Want auto indents automatically
set autoindent
set cindent
set wrap

" Set the width of the tab to 4 wide
" This gets overridden by vim-sleuth, so that's nice
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Make it so that long lines wrap smartly
set breakindent
let &showbreak=repeat(' ', 3)
set linebreak

" Always use spaces instead of tab characters
set expandtab

" Folding
set foldmethod=marker
set foldlevel=0
set modelines=1

" Set the gutter padding
" so it doesnt blink when errors
" or git gutters
set signcolumn=yes


" Clipboard
" Always have the clipboard be the same as my regular clipboard
" set clipboard+=unnamedplus

set inccommand=split
set list

syntax enable

set noswapfile

" Help remap
nnoremap <F1> <esc>
inoremap <F1> <esc>
vnoremap <F1> <esc>

" 0 should be ^
nnoremap 0 ^

" Move lines
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==

" Disable the search highlig.
nnoremap <esc> :noh<return><esc>

" NERD Tree
" map <Leader>a :NERDTreeFind<CR>
" nmap <Leader>t :TagbarToggle<CR>

" Nvim Tree
map <Leader>a :NvimTreeFindFile<CR>
map <Leader>c :NvimTreeToggle<CR>

" Fuzzy related
map <Leader>o :GFiles<CR>
map <Leader>O :tabnew<CR>:GFiles<CR>
map <Leader>S :vsplit<CR>:GFiles<CR>
map <Leader>p :Files<CR>
map <Leader>rg :Rg<SPACE>

" Telescope config
if has("win32")
    " Now this plugin is slower than Fzf...
    " so I'm only using it on the Windows machine
    " as speed is not affected here
    let g:use_telescope = 1
else
    let g:use_telescope = 0
end

let g:use_telescope = 0

if g:use_telescope
lua <<EOF
    require('telescope').setup{
        defaults = {}
    }
EOF

    map <Leader>o :lua require'telescope.builtin'.git_files{}<CR>
    map <Leader>O :tabnew<CR>:lua require'telescope.builtin'.git_files{}<CR>
    map <Leader>p :lua require'telescope.builtin'.find_files{}<CR>
end

" au VimEnter *  NERDTree

" Copy/Paste remaps
" Do not work under WSL
if has("win32")
    noremap <A-c> "*y
    noremap <A-v> "*p
endif

" Remap changing tab to Ctrl+n(ext)/p(revious)
" noremap <C-n> gt
" noremap <C-p> gT
noremap à gt
noremap ò gT

" Vimtex
let g:tex_flavor = 'latex'
let g:vimtex_mappings_enabled = 0

" Run affected test via Captools (Capchase specific)
nnoremap <Leader>ta :!/Users/lorenzodelrossi/Documents/GitHub/captools/target/release/captools test -a<CR>
nnoremap <Leader>nf :e %:h/

" for Windows
if has("win32")
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
endif

lua require("toggleterm").setup()

" set
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>


" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

nnoremap <silent><c-g> <Cmd>lua _lazygit_toggle()<CR>


" LaTeX bindings
nnoremap <Leader>vc :VimtexCompile<CR>
nnoremap <Leader>vi :VimtexTocToggle<CR>
nnoremap <Leader>vp :VimtexView<CR> 

" Github link jump
let g:gh_line_map = '<leader>gh'
let g:gh_line_blame_map = '<leader>gb'

" Markdown preview related
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_browser = 'brave'
let g:mkdp_echo_preview_url = 1

if empty(v:servername) && exists('*remote_startserver')
    call remote_startserver('VIM')
endif

" Completion plugin config
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <c-p> completion#trigger_completion()

set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience
set shortmess+=c " Avoid showing message extra message when using completion

" GUI options
" set guifont=MesloLGLDZ_Nerd_Font_Mono:h15
set guifont=Consolas:h16

" LanguageTool settings
if has("win32")
    let g:languagetool_jar = "S:/Programs/LanguageTool-5.1/languagetool-commandline.jar"
    let g:languagetool_lang = "ca"
end

" Lisp Vlime config
let g:vlime_enable_autodoc = v:true
let g:vlime_window_settings = {'sldb': {'pos': 'belowright', 'vertical': v:true}, 'inspector': {'pos': 'belowright', 'vertical': v:true}, 'preview': {'pos': 'belowright', 'size': v:null, 'vertical': v:true}}

" Lsp Disagnostics
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>


" Copilot
imap <silent><script><expr> ù copilot#Accept("\<CR>")
imap <C-=> <Plug>(copilot-next)
imap <C--> <Plug>(copilot-previous)
imap <C-\> <Plug>(copilot-suggest)

let g:copilot_no_tab_map = v:true

highlight CopilotSuggestion guifg=#555555 ctermfg=8
