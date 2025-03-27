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
    nnoremap ]d <Cmd>lua require('vscode').action('editor.action.marker.next')<CR>
    nnoremap [d <Cmd>lua require('vscode').action('editor.action.marker.prev')<CR>
    nnoremap ]q <Cmd>lua require('vscode').action('search.action.focusNextSearchResult')<CR>
    nnoremap [q <Cmd>lua require('vscode').action('search.action.focusPreviousSearchResult')<CR>

    nnoremap g/ <Cmd>lua require('vscode').action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })<CR>
    xnoremap g/ <Cmd>lua require('vscode').action('workbench.action.findInFiles')<CR>

    noremap <leader>q <Cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>
    noremap <leader>Q <Cmd>lua require('vscode').action('workbench.action.closeAllEditors')<CR>

    nnoremap <silent> za <Cmd>lua require('vscode').action('editor.toggleFold')<CR>
    nnoremap <silent> zR <Cmd>lua require('vscode').action('editor.unfoldAll')<CR>
    nnoremap <silent> zM <Cmd>lua require('vscode').action('editor.foldAll')<CR>
    nnoremap <silent> zo <Cmd>lua require('vscode').action('editor.unfold')<CR>
    nnoremap <silent> zO <Cmd>lua require('vscode').action('editor.unfoldRecursively')<CR>
    nnoremap <silent> zc <Cmd>lua require('vscode').action('editor.fold')<CR>
    nnoremap <silent> zC <Cmd>lua require('vscode').action('editor.foldRecursively')<CR>
    nnoremap <silent> zj <Cmd>lua require('vscode').action('editor.gotoNextFold')<CR>
    nnoremap <silent> zk <Cmd>lua require('vscode').action('editor.gotoPreviousFold')<CR>

    nnoremap g. <Cmd>lua require('vscode').call('editor.action.refactor')<CR>
    xnoremap g. <Cmd>lua require('vscode').call('editor.action.refactor')<CR>

    nnoremap <leader>rt <Cmd>lua require('vscode').action('testing.runAtCursor')<CR>
    nnoremap <leader>rft <Cmd>lua require('vscode').action('testing.runCurrentFile')<CR>

    xnoremap gc  <Plug>VSCodeCommentary
    nnoremap gc  <Plug>VSCodeCommentary
    nnoremap gcc <Plug>VSCodeCommentaryLine

    " disable lsp default shortcut, conflicts with ReplaceWithRegister
    nunmap gri

    " Plugins
    packadd! CamelCaseMotion
    packadd! ReplaceWithRegister
    packadd! vim-sandwich
    packadd! targets.vim
]]
