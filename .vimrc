set nocompatible

set expandtab
set hidden
syntax on
"set spell
set backup
set incsearch
set ignorecase                                  " case insensitive search
set smartcase                                   " case sensitive when uc present
set gdefault                                    " the /g flag on :s substitutions by default
set hlsearch

let hasgit=executable("git")

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        if hasgit == 1
                silent !mkdir -p ~/.vim/bundle
                silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
                let iCanHazVundle=0
        else
                echo "git not installed"
                let iCanHazVundle=1
        endif
endif

if iCanHazVundle == 0
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()

        " let Vundle manage Vundle
        " required!
        Bundle 'gmarik/vundle'

        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
endif

if filereadable(expand("~/.vim/colors/solarized.vim"))
        set background=dark
        colorscheme solarized
endif

filetype plugin on
filetype plugin indent on

augroup filetype
au! BufRead,BufNewFile *.proto setfiletype proto
au! BufRead,BufNewFile *.sh setfiletype shellscript
au! BufRead,BufNewFile *.json setfiletype javascript
augroup end

" XML preferences
autocmd FileType xml :set ts=4
autocmd FileType xml :set shiftwidth=4
autocmd FileType xml syntax on

" Java prefs
autocmd FileType java syntax on

" bash
au FileType shellscript :set ts=2
au FileType shellscript :set shiftwidth=2

" proto
"au FileType proto match ExtraWhitespace /\s\+$\|\%81v.\+/
autocmd FileType proto :set colorcolumn=101
au FileType proto :set ts=4
au FileType proto :set shiftwidth=4

" ios
au BufNewFile,BufReadPost {*.m,*.h} syntax on
au BufNewFile,BufReadPost {*.m,*.h} :set ts=4
au BufNewFile,BufReadPost {*.m,*.h} :set shiftwidth=4
au BufNewFile,BufReadPost {*.m,*.h} :set colorcolumn=101
"au BufNewFile,BufReadPost {*.m,*.h} match ExtraWhitespace /\s\+$\|\%101v.\+/
":autocmd BufWinEnter * match ExtraWhitespace /\s\+$\|\%101v.\+/
map <leader>l :ListMethods
map <leader>d :exec("CocoaDoc ".expand("<cword>"))<CR>
au BufWritePost *.h,*.m silent! !eval '/Users/Curtis/Scripts/ctags.sh' 2> /dev/null &

" python
autocmd FileType python syntax on
autocmd FileType python :set ts=2
autocmd FileType python :set sw=2
"autocmd FileType python match ExtraWhitespace /\s\+$\|\%81v.\+/
autocmd FileType python :set colorcolumn=81

" javascript
autocmd FileType javascript syntax on
autocmd FileType javascript :set ts=2
autocmd FileType javascript :set sw=2

" jsp
autocmd FileType jsp syntax on
autocmd FileType jsp :set ts=2
autocmd FileType jsp :set sw=2

" html
autocmd FileType html syntax on
autocmd FileType html :set ts=2
autocmd FileType html :set sw=2

" ruby
autocmd FileType ruby syntax on
autocmd FileType ruby :set ts=2
autocmd FileType ruby :set sw=2
autocmd FileType ruby :set nu
autocmd FileType ruby :set colorcolumn=81

:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=brred guibg=brred
:autocmd ColorScheme * highlight OverLength ctermbg=red guibg=red

" Trailng whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red guibg=#592929

" Switch off :match highlighting.
:match

" Turn off backups
set nobackup
set nowritebackup

" Status bar
set modeline
set ls=2

" Replace under cursor
:nnoremap <Leader>s :%s/\(\<<C-r><C-w>\>\)/