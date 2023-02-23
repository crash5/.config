vim.cmd [[
    let g:loaded_python3_provider = 0
    source $XDG_CONFIG_HOME/vim/vimrc

    " vscode only >

    set clipboard^=unnamed,unnamedplus

    nnoremap <leader>g <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
    nnoremap ]d <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>
    nnoremap [d <Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>
    nnoremap <leader>d <Cmd>call VSCodeNotify('editor.action.showHover')<CR>

    nnoremap <leader>q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
    nnoremap <leader>Q <Cmd>call VSCodeNotify('workbench.action.closeAllEditors')<CR>

    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine

    highlight OperatorSandwichBuns guifg='#aa91a0' gui=underline ctermfg=172 cterm=underline
    highlight OperatorSandwichChange guifg='#edc41f' gui=underline ctermfg='yellow' cterm=underline
    highlight OperatorSandwichAdd guibg='#b1fa87' gui=none ctermbg='green' cterm=none
    highlight OperatorSandwichDelete guibg='#cf5963' gui=none ctermbg='red' cterm=none
    " vscode only <
]]
