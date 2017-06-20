" NeoBundle Scripts-----------------------------
if has('vim_starting')  
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)  
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

call neobundle#begin(expand('$HOME/.config/nvim/bundle'))  
NeoBundleFetch 'Shougo/neobundle.vim'

" All plugins
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'xuyuanp/nerdtree-git-plugin'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'mhartington/oceanic-next'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Valloric/YouCompleteMe', {  
     \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer'
        \ }
     \ }

" ------------------------------------
" THIS IS WHERE YOUR PLUGINS WILL COME
" ------------------------------------

call neobundle#end()  

" Plugins form plug-vim
call plug#begin('$HOME/.config/nvim/plugged')

"Plug 'vimlab/neojs'
Plug 'SirVer/ultisnips'

" Initialize plug-vim system
call plug#end()


filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck  
"End NeoBundle Scripts-------------------------

" Shortcuts
map <silent> <C-\> :NERDTreeToggle<CR>

" Adds ctrlp plugin
set runtimepath^=~/.config/nvim/bundle/ctrlp.vim

" Activate oceanic-next theme
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

" General configs
"set nu

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set cursorline          " Mark active line

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" ctrlp ignore dir
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|bower_components\|.sass-cache\|.git\|build'

let mapleader = ","
"autocmd bufwritepost *.js silent !standard --fix %
set autoread

" Imports autoclose script
source /Users/luiz/.config/nvim/scripts/autoclose.vim 

