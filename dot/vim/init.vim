" '=================================================
" Vim-Plug configuration
" ==================================================

scriptencoding utf8

" Set up vim-plug if missing and install plugins
let shouldInstallBundles = 0

if !filereadable($HOME . "/.config/nvim/autoload/plug.vim")
  echo "~>‚Ä¢ Installing vim-plug \n"
  silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let shouldInstallBundles = 1
endif

call plug#begin('~/.config/nvim/plugged')

" Colorscheme
Plug 'junegunn/seoul256.vim'
" Tmux
Plug 'christoomey/vim-tmux-navigator'
" Nerd Tree explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Git related
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Dev icons
Plug 'ryanoasis/vim-devicons'
" Better scroll
Plug 'terryma/vim-smooth-scroll'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Install CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" eleline
Plug 'liuchengxu/eleline.vim'
" comments
Plug 'scrooloose/nerdcommenter'
" end helper pairs as () [] and {}
Plug 'jiangmiao/auto-pairs'
" Go vim plugin.
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_fmt_command = 'goimports'
" Tab helper
Plug 'ervandew/supertab'
call plug#end()

" ==================================================
" FZF configuration
" ==================================================
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

nnoremap <C-p> :FZF<cr>
" ==================================================

" Set color prefs
" ==================================================
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 235
colorscheme seoul256

" check and install bundles
if shouldInstallBundles == 1
    echo "~> Installing plugs\n"
    :PlugInstall
endif


" ==================================================
" Leader mappings & Key mappings
" ==================================================
let mapleader = "\<Space>"
" Open Neo Vim config
nmap <leader>vi :tabe ~/.config/nvim/init.vim<cr>
" Rename with coc
nmap <leader>rn <Plug>(coc-rename)
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Source .nvimrc and install plugins
noremap <leader>pi :w<cr> :source ~/.config/nvim/init.vim<cr>:PlugInstall<cr>

" Source .nvimrc
noremap <leader>so :w<cr> :source ~/.config/nvim/init.vim<cr>

" Toggle tree navigator (NERDTree plugin)
noremap <Leader>k :NERDTreeToggle<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Navigates through list of errors
nnoremap<leader>ll :ll<cr>

" Toggle search highlight
command! C nohlsearch

" Toggle tagbar
nmap <leader>t :TagbarToggle<cr>

" Resize panes
nmap + <C-W>>
nmap - <C-W><

" Exit terminal mode
tnoremap <Leader>e <C-\><C-n>
tnoremap <A-J> <C-\><C-n><C-W><C-J>
tnoremap <A-K> <C-\><C-n><C-W><C-K>
tnoremap <A-L> <C-\><C-n><C-W><C-L>
tnoremap <A-H> <C-\><C-n><C-W><C-H>

" General config
set fileencoding=utf-8 nobomb
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab shiftround
set number relativenumber
set noswapfile nobackup nowritebackup autowrite
set showmatch showcmd
set splitright
set cursorline
set nofoldenable
set list lcs=tab:»·,precedes:↜,nbsp:◦,extends:۱
set clipboard=unnamed
set pastetoggle=<F2>
set completeopt=longest,menu
set scrolloff=10 sidescrolloff=5
set complete=.,w,b,u,t
set wildmenu wildmode=longest,list:longest
set background=dark
set gdefault incsearch smartcase
" set rule on 100
set colorcolumn=100

inoremap <silent><expr> <c-space> coc#refresh()
