" Set the encodings
set enc=utf-8
set fenc=utf-8
set tenc=utf-8

" Set the various properties
set nocompatible		" Do not keep compatibility with Vi
set number			" Show line numbers
set showmatch			" Highlight the matching braces

" Searching in the document
set hlsearch			" Hightlight all search results
set ignorecase
set smartcase			" Ignore cases while searching, except when at least one character is upper case
set incsearch			" Incremental search - search while typing

" Set Line break properties
set linebreak
set wrap
set textwidth=119		" Break the line if longer than 119 characters, after white space
set cc=+1			" Show a colored column after the break limit
hi ColorColumn ctermbg=lightgrey " of light grey color

" Tabs and autoindentation
set autoindent
set shiftwidth=4		" number of spaces to use in autoindentation
set smartindent
set smarttab
set tabstop=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start	" Set backspace over EOL, indentation and start of line

set ruler			" Show line and column number of the cursor position
set showmode			" Show current mode on last line
set showcmd			" Show command being executed

set laststatus=2		" Status bar
set fileformat=unix

filetype off
" Start the plugins
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jnurmine/Zenburn'
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()
filetype plugin indent on 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'

" Look and Feel with Zenburn
set t_Co=256
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme zenburn

" Setting status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" NERDTree Settings
cd /home/mayukh/Projects/CompetitiveProgramming/
autocmd vimenter * NERDTree		" open NERDTree automatically on opening vim

" Syntastic Settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_auto_jump = 1
let g:syntastic_check_on_wq = 0

" Vim Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme = 'molokai'
let g:airline_powerline_fonts = 1
let g:airline_section_y = '%{strftime("%H:%M")}'

" CtrlP Settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$'
 \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']		" Ignore files in gitignore

" Let autocomplete window go away when we are done with YouCompleteMe
let g:ycm_global_ycm_extra_conf='/home/mayukh/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1

" NERD Commenter
let g:NERDSpaceDelims = 1							" Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1							" Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'							" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1							" Set a language to use its alternate delimiters by default
let g:NERDCommentEmptyLines = 1							" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1						" Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1						" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDTreeMinimalMenu=1

augroup project
    autocmd!
    autocmd BufNewFile,BufRead *.h,*.c set filetype=c.doxygen
augroup END
let &path.="include,/usr/include/AL,"

" Keyboard mappings
let mapleader="/"			" Our leader
map <leader>n :NERDTreeToggle<cr>

" map window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" save the file
nnoremap <leader>w :w<CR>
inoremap <leader>w <Esc>:w<CR><i>

" open splits
map <leader>v <C-w>v
map <leader>s <C-w>s

" Go to the definition or declaration
map <leader>y :YcmCompleter GoToDefinitionElseDeclaration<CR>

" tab behaviour. Move to previous or next tab using leader and arrow keys
nnoremap <leader>a :tabprevious<CR>
inoremap <leader>a <Esc>:tabprevious<CR>
nnoremap <leader>f :tabnext<CR>
inoremap <leader>f <Esc>:tabnext<CR>

" Move the current tab to left or right
nnoremap <silent> <leader>s :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <leader>d :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" For competitive programming purpose, the templates
nnoremap <leader>p :r ~/.vim/templates/newfile.c<CR>		" For Other than USACO
nnoremap <leader>u :r ~/.vim/templates/usaco.c<CR>		" For USACO

" Compile using g++, for competitive programming
inoremap <leader>c <Esc>:!g++ % -o main<CR><CR><i>
nnoremap <leader>c :!g++ % -o main<CR><CR>

" In software, to issue make
inoremap <leader>m <Esc>:!make<CR><i>
nnoremap <leader>m :!make<CR>

" For licensing the source codes
let g:license_author = 'Mayukh Sarkar'
let g:license_email = 'mayukhsarkar.in@gmail.com'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'

set secure

