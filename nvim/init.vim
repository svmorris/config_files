syntax on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "sets
set noerrorbells
set tabstop=4 softtabstop=4
set relativenumber
set shiftwidth=4
set expandtab
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
"set inccommand=nosplit
set clipboard=unnamedplus
set list
set foldmethod=indent
set foldlevelstart=99
set showbreak=~
set mouse=nv

set background=dark
set t_Co=256
set spell spelllang=en

"these 2 make big files lag set nowrap
set nowrap
"set linebreak






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""plugins
"https://github.com/tpope/vim-surround
call plug#begin('~/.local/share/nvim/site/autoload/')
Plug 'morhetz/gruvbox'
" Plug 'jremmen/vim-ripgrep'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'mbbill/undotree'
Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'machakann/vim-highlightedyank'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'leafgarland/typescript-vim'
Plug 'tHoMaStHeThErMoNuClEaRbOmB/tokyonight-vim'
Plug 'lilydjwg/colorizer'
Plug 'kiteco/vim-plugin'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tomtom/tcomment_vim'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-templates'
Plug 'TroyFletcher/vim-colors-synthwave'
Plug 'fxn/vim-monochrome'
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}

" pylint
Plug 'dense-analysis/ale'

" telescope vim
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

call plug#end()




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""colourscheme
" only use good colours in places that support it
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors

    let g:tokyonight_style = 'night' " available: night, storm
    let g:tokyonight_enable_italic = 0
    colorscheme tokyonight
    " let g:monochrome_italic_comments = 1
    " colorscheme monochrome
    " colorscheme gruvbox
    " set background=dark
else
    colorscheme gruvbox
    set background=dark
endif

"set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""special syntax
autocmd FileType asm set syntax=nasm




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""maps
"legend:
    "d = delete/disable | e=enable | t=toggle | f=files | p=paste/insert | n=no | b=buffer
:let mapleader = " "
"basic
map qqqq :q<CR>
map <Leader>q :q<CR>
map <Leader>w :w<CR>
"visual
map <Leader>vl <S-v>
map <Leader>vb <C-v>
"splits
map <Leader>sv :vsplit<CR><C-w><right>
map <Leader>ss :split<CR><C-w><down>
map <Leader>sV :vsplit<CR>
map <Leader>sS :split<CR>
"resize splits
map <C-up> :res -5<CR>
map <C-down> :res +5<CR>
map <C-left> :vertical res -5<CR>
map <C-right> :vertical res +5<CR>
"scroll
map <up> <C-y>
map <down> <C-e>
map <left> $
map <right> ^
"moving between panes
map <leader>k <C-w><up>
map <leader>j <C-w><down>
map <leader>h <C-w><left>
map <leader>l <C-w><right>
map <Leader>nh :noh<CR>
"buffer
map <leader>bd :bd<CR>
map <leader>, :bp<CR>
map <leader>. :bn<CR>
"toggles
map <leader>tr :set wrap!<CR>
map <leader>tnr :set linebreak!<CR>
map <leader>tg :Goyo<CR>:set number<CR>
"file managers
map <leader>ff :CtrlP .<CR>
map <Leader>fn :NERDTreeToggle<CR> 
"coc-vim
map <leader>dc :CocDisable<CR>
map <leader>ec :CocEnable<CR>
map <leader>pt :CocCommand template.template<CR>
"sometimes keyboards are confusing
map É :
"folds
map <leader>ya zM<CR>
map <leader>yn zR<CR>
map <leader>yl zl<CR>
map <leader>yy zm<CR>
map <leader>ys zo<CR>
map <leader><leader> zO<CR>
"show docs
nnoremap <leader>dd :call <SID>show_documentation()<CR>
"transparency [toggle opacity]
nnoremap <leader>to :call Toggle_transparent_background()<CR>
"comment
noremap <leader>c :TComment<CR>
" non leader based remaps
noremap j gj
noremap k gk
"html stuff
noremap <leader>vi< T>vt<
noremap <leader>vi> T>vt<
" undotree (if I ever use it)
nnoremap <leader>u :UndotreeToggle<CR>
" own functrions calls
nnoremap <leader>pp :call ConsoleLog() <CR>
nnoremap <leader>dh :call ShowDocsPrivate() <CR>

" telescope vim
nnoremap <leader><leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>tff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>tfg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>tfb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>tfh <cmd>lua require('telescope.builtin').help_tags()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" nerd tree configs
" stuf for git
let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",   
    "\ "Ignored"   : "#808080"   
    "\ }                         
"ignore some directories
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeIgnore = ['^__pycache__$']



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" kite
" All the languages Kite supports
" let g:kite_supported_languages = ['*']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" indent line
let g:indentLine_char = '┊'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" c++ extra highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1
" if there are errors with flaging braces, enable
"let c_no_curly_error=1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" transparency
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-python',
  \ 'coc-jedi',
  \ 'coc-pairs',
  \ 'coc-json', 
  \ 'coc-marketplace', 
  \ 'coc-docker', 
  \ 'coc-html', 
  \ 'coc-css', 
  \ 'coc-emmet', 
  \ 'coc-tailwindcss', 
  \ 'coc-html-css-support', 
  \ 'coc-tsserver', 
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-a> <Plug>(coc-range-select)
xmap <silent> <C-a> <Plug>(coc-range-select)




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""bazsi smoothscrolling thing
"function smoothscroll(up)
"    if a:up
"        let scrollaction=""
"    else
"        let scrollaction=""
"    endif
"    exec "normal " . scrollaction
"    redraw
"    let counter=1
"    while counter<&scroll
"        let counter+=1
"        sleep 5m
"        redraw
"        exec "normal " . scrollaction
"    endwhile
"endfunction
"
"nnoremap <C-U> :call SmoothScroll(1)<Enter>
"nnoremap <C-D> :call SmoothScroll(0)<Enter>
"inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
"inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i
"






"""""""""""""""""""""""""""""""""""""""""" auto print
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END


"""""""""""""""""""""""""""""""""""""""""" auto print
function ConsoleLog()
    let value = expand('<cword>')
    let ft = &filetype

    if ft == 'python'
        execute ":normal! o" . "print('" . value . ": '," . value . " , type(". value ."))"
    elseif ft == 'javascript'
        execute ":normal! o" . "console.log('" . value . ": '," . value . " , typeof(". value ."));"
    elseif ft == 'cpp'
        execute ":normal! o" . "cout << \"" . value . ": \" << " . value . " << endl;"
    endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""" other docs
function ShowDocsPrivate()
    if &filetype == "python"
        " set up variables
        let object = expand('<cword>')
        let package = expand('%')[0:-4]

        " call
        execute "! python3 -c 'import " . package . "; print(help(" . join([package,object],'.') . "))'"

    elseif &filetype == "cpp"
        " show man
        execute "! man 3 " . expand('<cword>')
    elseif &filetype == "vim"
        execute ":help " . expand("<cword>")
    endif
endfunction



"""""""""""""""""""""""""""""""""""""""" find strings in files
let t:findfiles_mode = 0
function! Find_in_files()
    if t:findfiles_mode == 1
        let filename = split(expand ('<cWORD>'),":")[0]
        let linenum = split(expand ('<cWORD>'),":")[1]
        execute ':e '.filename | execute "normal! ". linenum ."gg"
        let t:findfiles_mode = 0
    else
        let searchstring = input('string: ')
        if searchstring != ""
            execute "term". "!grep -inr --colour=auto '". searchstring ."' 2>/dev/null"
            let t:findfiles_mode = 1
        endif
    endif

endfunction
map <leader>hh :call Find_in_files()<CR>



"""""""""""""""""""""""""""""""""""""""" find all of one type of pylint error
let t:pylintsearch_mode = 0
function! Pylint_refactor()
    if t:pylintsearch_mode == 1
        let filename = split(expand ('<cWORD>'),":")[0]
        let linenum = split(expand ('<cWORD>'),":")[1]
        execute ':e '.filename | execute "normal! ". linenum ."gg"
        let t:pylintsearch_mode = 0
    else
        let searchstring = input('warning-type: ')
        if searchstring != ""
            execute "term". "!pylint * | grep -i --colour=auto '". searchstring ."' 2>/dev/null"
            let t:pylintsearch_mode = 1
        endif
    endif
endfunction



"""""""""""""""""""""""""""""""""""""""""" templates apply to new files
g:templates_empty_files = 1



""""""""""""""""""""""""""""""""""""""""" pwnfile
function! Pwn()
    set ft=pwn
    set ft=cpp
    let filename = input('filename: ')
    execute ":write " . filename . ".cpp"
endfunction


""""""""""""""""""""""""""""""""""""""""" switch between ycm and coc
let g:ycm_filetype_whitelist = { 'rust': 1, 'vimscript': 1, 'cpp': 1}
autocmd FileType rust :CocDisable
autocmd FileType cpp :CocDisable





"""""""""""""""""""""""""""""""""""""""""" jedi settings
"let g:jedi#auto_initialization = 1
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#rename_command = "<leader>r"
"





"""""""""""""""""""""""""""""""""""""""""" html specific maps
" if &filetype == "html"
nmap <leader>hti :CocDisable<CR>Bi<i><Esc>Ea</i><Esc>:CocEnable<CR>
nmap <leader>htu :CocDisable<CR>Bi<u><Esc>Ea</u><Esc>:CocEnable<CR>
nmap <leader>htb :CocDisable<CR>Bi<b><Esc>Ea</b><Esc>:CocEnable<CR>

nmap <leader>ht6 :CocDisable<CR>I<h6><Esc>A</h6><Esc>^:CocEnable<CR>
nmap <leader>ht5 :CocDisable<CR>I<h5><Esc>A</h5><Esc>^:CocEnable<CR>
nmap <leader>ht4 :CocDisable<CR>I<h4><Esc>A</h4><Esc>^:CocEnable<CR>
nmap <leader>ht3 :CocDisable<CR>I<h3><Esc>A</h2><Esc>^:CocEnable<CR>
nmap <leader>ht2 :CocDisable<CR>I<h2><Esc>A</h2><Esc>^:CocEnable<CR>
nmap <leader>ht1 :CocDisable<CR>I<h1><Esc>A</h1><Esc>^:CocEnable<CR>

nmap <leader>htp :CocDisable<CR>I<p><Esc>A</p><Esc>^:CocEnable<CR>
nmap <leader>htd :CocDisable<CR>I<d><Esc>A</d><Esc>^:CocEnable<CR>
nmap <leader>htl :CocDisable<CR>I<li><Esc>A</li><Esc>^:CocEnable<CR>
nmap <leader>hta :CocDisable<CR>I<a href=""><Esc>A</a><Esc>^:CocEnable<CR>
" endif








"""""""""""""""""""""""""""""""""""""""""" ale linter
let b:ale_fixers = {'python': ['pylint', 'mypy']}
let g:ale_lint_on_insert_leave = 1
