" Load vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Update alias
command! PU PlugUpdate | PlugUpgrade

" Update function
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/xoria256.vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
endif
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Syntax Plugins
Plug 'justinmk/vim-syntax-extra'
call plug#end()
