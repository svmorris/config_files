syntax on


" Sets
set noerrorbells

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set list

set nu
set relativenumber

set smartcase
set incsearch

set noswapfile
set nobackup
set undodir=~/.vim/undodir

set clipboard=unnamedplus

set foldmethod=indent
set foldlevelstart=99

set nowrap
set linebreak
set showbreak=~

set mouse=nv

set background=dark
set t_Co=256

set spell spelllang=en

set cmdheight=1




" Vim plug stuff
"" Install Vim-Plug if it's not already installed.
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"" Plugins
call plug#begin('~/.local/share/nvim/site/autoload/')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

Plug 'machakann/vim-highlightedyank'
Plug 'https://github.com/kien/ctrlp.vim.git'

Plug 'mbbill/undotree'
Plug 'junegunn/goyo.vim'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tomtom/tcomment_vim'
Plug 'Yggdroot/indentLine'

Plug 'svmorris/tokyonight-vim'

call plug#end()



" Tokyo night configs. (truecolour and such)
set termguicolors
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 0
colorscheme tokyonight


" Nasm is the only good assembler.
autocmd FileType asm set syntax=nasm



" Maps
:let mapleader = " "
map <Leader>q :q<CR>
map <Leader>w :w<CR>

map <Leader>sv :vsplit<CR><C-w><right>
map <Leader>ss :split<CR><C-w><down>

map <C-up> :res -5<CR>
map <C-down> :res +5<CR>
map <C-left> :vertical res -5<CR>
map <C-right> :vertical res +5<CR>

map <up> <C-y>
map <down> <C-e>
map <left> $
map <right> ^

map <leader>k <C-w><up>
map <leader>j <C-w><down>
map <leader>h <C-w><left>
map <leader>l <C-w><right>

map <Leader>nh :noh<CR>

map <leader>, :bp<CR>
map <leader>. :bn<CR>

map <leader>tr :set wrap!<CR>

map <leader>tg :Goyo<CR>:set number<CR>

map <leader>ff :CtrlP .<CR>
map <Leader>fn :NERDTreeToggle<CR> 

map É :

map <leader>ya zM<CR>
map <leader>yn zR<CR>
map <leader>yl zl<CR>
map <leader>yy zm<CR>
map <leader>ys zo<CR>
map <leader><leader> zO<CR>

noremap <leader>c :TComment<CR>
nnoremap <leader>uu :UndotreeToggle<CR>
nnoremap <leader>pp :call ConsoleLog() <CR>
nnoremap <leader>dd :call <SID>show_documentation()<CR>
nnoremap <leader>to :call Toggle_transparent_background()<CR>

noremap j gj
noremap k gk




" Nerd tree config.
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeIgnore = ['^__pycache__$']


" Show some indents
let g:indentLine_char = '┊'


" Cock configs
"" Cock plugins
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-marketplace',
  \ 'coc-python',
  \ 'coc-jedi',
  \ 'coc-clangd',
  \ 'coc-emmet',
  \ ]

" Cock settings
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes

"" Cock completion stuff
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-Space> coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

"" f2 and gd are genuinely good. The rest remain bc I don't remember what they
nmap <F2> <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)



" Custom functions
"" Toggle transparency
let t:is_transparent = 1
function! Toggle_transparent_background()
    if t:is_transparent == 0
        hi Normal guibg=#1a1b26 ctermbg=black
        let t:is_transparent = 1
    else
        highlight Normal      guibg=NONE ctermbg=NONE
        highlight NonText     guibg=NONE ctermbg=NONE
        highlight Folded      guibg=NONE ctermbg=NONE
        highlight EndOfBuffer guibg=NONE ctermbg=NONE
        let t:is_transparent = 0
    endif
endfunction
call Toggle_transparent_background()


" Highlight yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END


"" Print stuff
function ConsoleLog()
    let value = expand('<cword>')
    let ft = &filetype

    if ft == 'python'
        execute "normal! oprint('" . value . ": ', " . value . ", type(" . value . "))"
    elseif ft == 'javascript'
        execute "normal! oconsole.log('" . value . ": ', " . value . ", typeof(" . value . "));"
    elseif ft == 'c'
        execute "normal! oprintf(\"%%x\\n\", " . value . ");"
        execute "normal! F%x"
    elseif ft == 'cpp'
        execute "normal! ocout << \"" . value . ": \" << " . value . " << endl;"
    elseif ft == 'asm'
        let reg = expand('<cword>')
        execute "normal! o; debug " . reg
        execute "normal! omov rsi, " . reg
        execute "normal! omov rdi, 1        ; stdout"
        execute "normal! omov rdx, 8        ; bytes"
        execute "normal! omov rax, 1        ; sys_write"
        execute "normal! osyscall"
    endif
endfunction



"" Custom grep keyword finding stuff
function! Jump_to_grep_output()
    let filename = split(expand ('<cWORD>'),":")[0]
    let linenum = split(expand ('<cWORD>'),":")[1]
    execute ':e '.filename | execute "normal! ". linenum ."gg"
endfunction
map <leader>o :call Jump_to_grep_output()<CR>

function! Find_in_files()
    let searchstring = input('string: ')
    if searchstring != ""
        execute "term". "!grep -inr --colour=auto '". searchstring ."' 2>/dev/null"
        let t:findfiles_mode = 1
    endif
endfunction
map <leader>hh :call Find_in_files()<CR>


" Ale stuff
let b:ale_fixers = {'python': ['pylint', 'mypy']}
let g:ale_lint_on_insert_leave = 1

" Fuck the providers
let g:loaded_python3_provider = 0
let g:loaded_node_provider    = 0
let g:loaded_perl_provider    = 0
let g:loaded_ruby_provider    = 0
