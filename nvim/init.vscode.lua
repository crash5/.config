vim.cmd [[
    if &compatible
        set nocompatible
    endif

    let g:loaded_python3_provider = 0
    let g:loaded_node_provider = 0
    let g:loaded_perl_provider = 0
    let g:loaded_ruby_provider = 0

    if empty($MYVIMRC) | let $MYVIMRC = expand('<sfile>:p') | endif

    if empty($XDG_DATA_HOME)   | let $VIMDATA = expand('~/.local/share/vim/') | else | let $VIMDATA = $XDG_DATA_HOME.'/vim/'     | endif
    if empty($XDG_CONFIG_HOME) | let $VIMCONFIG  = expand('~/.config/vim/')   | else | let $VIMCONFIG = $XDG_CONFIG_HOME.'/vim/' | endif

    set runtimepath^=$VIMCONFIG
    set runtimepath+=$VIMCONFIG/after
    set packpath^=$VIMCONFIG
    set packpath+=$VIMCONFIG/after

    augroup Vimrc_highlight_on_yank
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank{timeout=250}
    augroup END

    set shada=
    set clipboard^=unnamed,unnamedplus

    source $XDG_CONFIG_HOME/vim/keybinding

    " Search/Replace {{{
    set hlsearch                                             " highlight matches
    set showmatch                                            " highlight matching [{()}]
    set ignorecase
    set incsearch                                            " search as characters are entered
    set smartcase
    " }}}

    let g:no_CamelCaseMotion_maps = 1
    map <leader>w <Plug>CamelCaseMotion_w
    map <leader>b <Plug>CamelCaseMotion_b
    map <leader>e <Plug>CamelCaseMotion_e
    omap <leader>iw <Plug>CamelCaseMotion_iw
    xmap <leader>iw <Plug>CamelCaseMotion_iw
    omap <leader>ib <Plug>CamelCaseMotion_ib
    xmap <leader>ib <Plug>CamelCaseMotion_ib
    omap <leader>ie <Plug>CamelCaseMotion_ie
    xmap <leader>ie <Plug>CamelCaseMotion_ie

    " vscode calls
    nnoremap ]d <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>
    nnoremap [d <Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>
    nnoremap ]q <Cmd>call VSCodeNotify('search.action.focusPreviousSearchResult')<CR>
    nnoremap [q <Cmd>call VSCodeNotify('search.action.focusNextSearchResult')<CR>

    nnoremap <CR> <Cmd>call VSCodeNotify('editor.action.smartSelect.expand')<CR>
    nnoremap <BS> <Cmd>call VSCodeNotify('editor.action.smartSelect.shrink')<CR>
    xnoremap <CR> <Cmd>call VSCodeNotify('editor.action.smartSelect.expand')<CR>
    xnoremap <BS> <Cmd>call VSCodeNotify('editor.action.smartSelect.shrink')<CR>

    nnoremap <leader>g <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
    xnoremap <leader>g <Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>
    nnoremap <leader>d <Cmd>call VSCodeNotify('editor.action.showHover')<CR>

    noremap <leader>q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
    noremap <leader>Q <Cmd>call VSCodeNotify('workbench.action.closeAllEditors')<CR>

    nnoremap <silent> za <Cmd>call VSCodeNotify('editor.toggleFold')<CR>
    nnoremap <silent> zR <Cmd>call VSCodeNotify('editor.unfoldAll')<CR>
    nnoremap <silent> zM <Cmd>call VSCodeNotify('editor.foldAll')<CR>
    nnoremap <silent> zo <Cmd>call VSCodeNotify('editor.unfold')<CR>
    nnoremap <silent> zO <Cmd>call VSCodeNotify('editor.unfoldRecursively')<CR>
    nnoremap <silent> zc <Cmd>call VSCodeNotify('editor.fold')<CR>
    nnoremap <silent> zC <Cmd>call VSCodeNotify('editor.foldRecursively')<CR>
    nnoremap <silent> zj <Cmd>call VSCodeNotify('editor.gotoNextFold')<CR>
    nnoremap <silent> zk <Cmd>call VSCodeNotify('editor.gotoPreviousFold')<CR>

    nnoremap <leader>rn <Cmd>call VSCodeNotify('editor.action.rename')<CR>

    xnoremap gc  <Plug>VSCodeCommentary
    nnoremap gc  <Plug>VSCodeCommentary
    nnoremap gcc <Plug>VSCodeCommentaryLine

    " Plugins
    packadd! CamelCaseMotion
    packadd! ReplaceWithRegister
    packadd! vim-sandwich
    packadd! targets.vim
]]
