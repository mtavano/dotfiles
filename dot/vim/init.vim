" '=================================================
" Vim-Plug configuration
" ==================================================

scriptencoding utf8

" Set up vim-plug if missing and install plugins

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" ==================================================
" Syntax highlight and language specific
" ==================================================
" YouCompleteMe
 Plug 'Valloric/YouCompleteMe', {
      \ 'do': './install.py --clang-completer --gocode-completer --system-libclang'
      \ }
" YCM config generator
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" Tmux
Plug 'keith/tmux.vim'
" Markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
" TOML
Plug 'cespare/vim-toml', { 'for': 'toml' }
" Javascript
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libd = 'chai'
" Python
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
" Ruby!
"Plug 'tpope/vim-vinegar' // TODO: REVIEW THIS PLUGIN
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'ngmy/vim-rubocop', { 'for': 'ruby' }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' } | Plug 'kana/vim-textobj-user'
Plug 'janko-m/vim-test', { 'for': ['ruby', 'javascript'] }
" Typescript
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']



" ==================================================
" UI and utilities
" ==================================================
" Typescript plugin
Plug 'leafgarland/typescript-vim'
" Surround plugin
Plug 'tpope/vim-surround'
" Vim script for text filtering and alignment
Plug 'godlygeek/tabular'
" Notice Git File changes
Plug 'airblade/vim-gitgutter'
" Dev icons
Plug 'ryanoasis/vim-devicons'
" Git wrapper
Plug 'tpope/vim-fugitive'
" Better scrolling
Plug 'terryma/vim-smooth-scroll'
" Better color schemes.
Plug 'endel/vim-github-colorscheme'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/seoul256.vim'
Plug 'mkarmona/colorsbox'
Plug 'juanedi/predawn.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'jacoborus/tender'
Plug 'chriskempson/tomorrow-theme'
"Plug 'chriskempson/tomorrow-theme'
" A tree explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Better statusline
Plug 'bling/vim-airline'
" Files fuzzy finder
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'
" Indentation mark for scope
Plug 'Yggdroot/indentLine'
"vim instant markdown
Plug 'suan/vim-instant-markdown'
" ==================================================
" Development tools and facilities
" ==================================================
" Projectionist
Plug 'tpope/vim-projectionist'
" Go vim plugin.
let g:go_fmt_command = 'goimports'
Plug 'fatih/vim-go'
"Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" Enahanced search tool.
Plug 'mileszs/ack.vim'
" End helper
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
"" UltiSnips
Plug 'SirVer/ultisnips'
" Snnipets collection
Plug 'honza/vim-snippets'
" Tab helper
Plug 'ervandew/supertab'
" Strip white spaces
Plug 'ntpeters/vim-better-whitespace'
" Autoformat code
Plug 'Chiel92/vim-autoformat'
" Linter
Plug 'benekastah/neomake', { 'on': 'Neomake' }
" Commenter
Plug 'scrooloose/nerdcommenter'
" Doxygen generator
Plug 'mrtazz/DoxygenToolkit.vim'
" Dash integration
Plug 'rizzatti/dash.vim'
" Tag bar
Plug 'majutsushi/tagbar'
" tmux plug
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
call plug#end()

filetype plugin indent on " required for Vim-Plug

" ==================================================
"   Configuration
" ==================================================

syntax enable
set background=dark

"colorscheme base16-default-dark
"colorscheme colorsbox-stbright
"colorscheme jellybeans

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 235
colorscheme seoul256

set fileencoding=utf-8 nobomb
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab shiftround
set relativenumber
set noswapfile nobackup nowritebackup autowrite
set showmatch showcmd
set splitright
set cursorline
set nofoldenable
set list listchars=tab:▸\ ,trail:•,extends:»,precedes:«,nbsp:¬
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
" custo set
set guifont=<FONT_NAME>:h<FONT_SIZE>
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
au BufRead,BufNewFile *.html.mustache set filetype=html
"au FileType javascript set nocindent
" load doxygen syntax aumatically
let g:load_doxygen_syntax=1
" Make it more obvious which paren I'm on
hi MatchParen cterm=none ctermbg=3 ctermfg=0
" Strip white space for the following file types
autocmd FileType c,cpp,ruby,javascript,java,php,python
      \ autocmd BufWritePre <buffer> StripWhitespace
" Nerdtree no list chars
autocmd FileType nerdtree setlocal nolist

if filereadable(expand("~/.config/nvim/ignore.vim"))
  source ~/.config/nvim/ignore.vim
endif

" ==================================================
" Leader mappings & Key mappings
" ==================================================
let mapleader = "\<Space>"
" Open Neo Vim config
nmap <leader>vi :tabe ~/.config/nvim/init.vim<cr>
" Source .nvimrc and install plugins
noremap <leader>pi :w<cr> :source ~/.config/nvim/init.vim<cr>:PlugInstall<cr>
" Source .nvimrc
noremap <leader>so :w<cr> :source ~/.config/nvim/init.vim<cr>
" Toggle tree navigator (NERDTree plugin)
noremap <Leader>k :NERDTreeToggle<cr>
" Jump to definition (YCM plugin)
nnoremap <leader>jd :YcmCompleter GoTo<cr>
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
" Switch between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Avoid Esc key
imap jj <Esc>
" Add shortcut to end of line
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I
" Rubocop autocorrect
let g:vimrubocop_keymap = 0
" Deoplete
let g:deoplete#enable_at_startup = 1
nmap <Leader>ra :RuboCop -a<cr>
" Exit terminal mode
tnoremap <Leader>e <C-\><C-n>
tnoremap <A-J> <C-\><C-n><C-W><C-J>
tnoremap <A-K> <C-\><C-n><C-W><C-K>
tnoremap <A-L> <C-\><C-n><C-W><C-L>
tnoremap <A-H> <C-\><C-n><C-W><C-H>
"nmap k gk
"nmap j gj

" ==================================================
" Vim-airline configuration
" ==================================================
 let g:airline_theme='jaguirre'

let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#tagbar#enabled = 0

let g:airline_mode_map = {
      \ '__' : '#',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'V•L',
      \ 'c'  : 'C',
      \ "\026" : 'V•B',
      \ 's'  : 'S',
      \ 'S'  : 'S•L',
      \ "\023" : 'S•B',
      \ }
" Extensions
let g:airline#extensions#whitespace#symbol = ""

" ==================================================
" Web-devicons
" ==================================================
let g:webdevicons_enable_airline_statusline=0

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
" YCM configuration
" ==================================================
let ycm_autoclose_preview_window_after_completion = 1
let ycm_min_num_of_chars_for_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '!'
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>']
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" ==================================================
" UltiSnips configuration
" ==================================================
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir = '~/.config/nvim/ultisnips'
let g:UltiSnipsSnippetDirectories = ['ultisnips']
let g:UltiSnipsEditSplit = 'vertical'

" ==================================================
" VimAutoformat configuration
" ==================================================
" C/C++
let g:formatdef_clangfile = "'clang-format -style=file'"
let g:formatdef_llvmstyle = "'clang-format -style=llvm'"
let g:formatters_cpp = ['clangfile', 'llvmstyle']
autocmd FileType c,cpp autocmd BufWritePre <buffer> :Autoformat

" ==================================================
" Correct common stupid mistakes
" ==================================================
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" ==================================================
" Vim smooth scroll configuration
" ==================================================
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 4, 2)<cr>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 4, 2)<cr>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll * 2, 4, 4)<cr>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 4, 4)<cr>

" ==================================================
" CMake project configuration
" ==================================================
let g:cmakeproj_default_generator = 'make'

" ==================================================
" Neomake configuration
" ==================================================
" Ruby
let g:neomake_ruby_enabled_maker = ["rubocop", "mri"]
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake

" ==================================================
" Vim-test configuration
" ==================================================
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>r :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>

function! VerticalSplitStrategy(cmd)
  vertical botright new | call termopen(a:cmd) | startinsert
endfunction
let g:test#custom_strategies = {'terminal_vsplit': function('VerticalSplitStrategy')}
let g:test#strategy = 'vtr'

"let g:test#custom_strategies = {'terminal_vsplit': function('VerticalSplitStrategy')}
"let g:test#strategy = 'terminal_vsplit'

" ==================================================
" DoxyenToolkit configuration
" ==================================================
let g:DoxygenToolkit_commentType = 'C++'
let g:DoxygenToolkit_briefTag_pre = '\brief '
let g:DoxygenToolkit_paramTag_pre = '\param '
let g:DoxygenToolkit_returnTag = '\return '
let g:DoxygenToolkit_fileTag = '\file '
let g:DoxygenToolkit_authorTag = '\author '
let g:DoxygenToolkit_blockTag = '\name '
let g:DoxygenToolkit_versionTag = '\version '
let g:DoxygenToolkit_classTag = '\class '
let g:DoxygenToolkit_dateTag = '\date '

" ==================================================
" Vim markdown configuration
" ==================================================
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1

" ==================================================
" Vim markdown preview configuration
" ==================================================
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-P>'
let vim_markdown_preview_toggle=2


" ==================================================
" Vim markdown preview configuration
" ==================================================
let NERDTreeShowHidden=1


" ==================================================
" Vim markdown preview configuration
" ==================================================
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"vim test yaastrip
let test#javascript#mocha#options='--compilers js:babel-register --require babel-polyfill'
" let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
" '=================================================
" Vim-Go configuration
" ==================================================
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
au FileType go nmap <Leader>i <Plug>(go-info)
"let g:go_auto_type_info = 1
