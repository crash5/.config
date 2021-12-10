" vim: foldmethod=marker formatoptions-=o

source $XDG_CONFIG_HOME/vim/vimrc

set shadafile=$XDG_DATA_HOME/nvim/nviminfo
set undodir&

set inccommand=nosplit

augroup Vimrc_highlight_on_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{timeout=250}
augroup END

lua require('initrc')

