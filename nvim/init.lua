-- vim: foldmethod=marker formatoptions-=o

vim.cmd [[
    let g:loaded_python3_provider = 0
    source $XDG_CONFIG_HOME/vim/common-before

    set shadafile=$VIMDATA/nviminfo
    set undodir=$VIMDATA/nvimundo//     | call mkdir(&undodir,   'p')

    set inccommand=nosplit

    augroup Vimrc_highlight_on_yank
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank{timeout=250}
    augroup END

    packadd! CamelCaseMotion
    packadd! ReplaceWithRegister
    packadd! targets.vim
    packadd! vim-sandwich
]]

if vim.g.vscode then
    vim.cmd [[
        set clipboard^=unnamed,unnamedplus

        nnoremap ]d <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>
        nnoremap [d <Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>
        nnoremap ]q <Cmd>call VSCodeNotify('search.action.focusPreviousSearchResult')<CR>
        nnoremap [q <Cmd>call VSCodeNotify('search.action.focusNextSearchResult')<CR>

        nnoremap <leader>g <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
        nnoremap <leader>d <Cmd>call VSCodeNotify('editor.action.showHover')<CR>

        nnoremap <leader>q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
        nnoremap <leader>Q <Cmd>call VSCodeNotify('workbench.action.closeAllEditors')<CR>

        nnoremap <silent> za <Cmd>call VSCodeNotify('editor.toggleFold')<CR>
        nnoremap <silent> zR <Cmd>call VSCodeNotify('editor.unfoldAll')<CR>
        nnoremap <silent> zM <Cmd>call VSCodeNotify('editor.foldAll')<CR>
        nnoremap <silent> zo <Cmd>call VSCodeNotify('editor.unfold')<CR>
        nnoremap <silent> zO <Cmd>call VSCodeNotify('editor.unfoldRecursively')<CR>
        nnoremap <silent> zc <Cmd>call VSCodeNotify('editor.fold')<CR>
        nnoremap <silent> zC <Cmd>call VSCodeNotify('editor.foldRecursively')<CR>
        nnoremap <silent> zj <Cmd>call VSCodeNotify('editor.gotoNextFold')<CR>
        nnoremap <silent> zk <Cmd>call VSCodeNotify('editor.gotoPreviousFold')<CR>

        xmap gc  <Plug>VSCodeCommentary
        nmap gc  <Plug>VSCodeCommentary
        omap gc  <Plug>VSCodeCommentary
        nmap gcc <Plug>VSCodeCommentaryLine


        highlight OperatorSandwichBuns guifg='#aa91a0' gui=underline ctermfg=172 cterm=underline
        highlight OperatorSandwichChange guifg='#edc41f' gui=underline ctermfg='yellow' cterm=underline
        highlight OperatorSandwichAdd guibg='#b1fa87' gui=none ctermbg='green' cterm=none
        highlight OperatorSandwichDelete guibg='#cf5963' gui=none ctermbg='red' cterm=none
    ]]
else
    vim.cmd [[
        packadd! matchit
        packadd! papercolor-theme
        packadd! vim-commentary
        packadd! vim-indent-object
        packadd! vim-unimpaired
    ]]

    -- Treesitter {{{
    -- vim.opt.foldmethod = "expr"
    -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

    local status, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
    if(status) then
        nvim_treesitter.setup {
            ensure_installed = 'all',
            highlight = {enable = true},
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<S-A-Right>",
                    node_incremental = "<S-A-Right>",
                    scope_incremental = "<S-A-Up>",
                    node_decremental = "<S-A-Left>",
                }
            },
            -- external plugin
            rainbow = { enable = true },
            context_commentstring = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                    }
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        [']m'] = '@function.outer',
                        [']]'] = '@class.outer'
                    },
                    goto_next_end = {
                        [']M'] = '@function.outer',
                        [']['] = '@class.outer'
                    },
                    goto_previous_start = {
                        ['[m'] = '@function.outer',
                        ['[['] = '@class.outer'
                    },
                    goto_previous_end = {
                        ['[M'] = '@function.outer',
                        ['[]'] = '@class.outer'
                    }
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["g>>"] = "@parameter.inner"
                    },
                    swap_previous = {
                        ["g<<"] = "@parameter.inner"
                    }
                },
                lsp_interop = {
                    enable = true,
                    border = 'none',
                    peek_definition_code = {
                        ["<leader>hf"] = "@function.outer",
                        ["<leader>hc"] = "@class.outer"
                    }
                }
            }
        }
    end
    -- }}}

    -- LSP {{{
    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        float = { border = "single" },
    })

    local on_attach = function(client, bufnr)
        print("LSP started.");
        -- require'completion'.on_attach(client)
        -- require'diagnostic'.on_attach(client)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>i', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>r', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
        -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
        -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
        -- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
    end

    -- Enable the following language servers
    local status, nvim_lsp = pcall(require, 'lspconfig')
    if(status) then
        local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
        for _, lsp in ipairs(servers) do
            nvim_lsp[lsp].setup{
                on_attach = on_attach
            }
        end
    end
    -- }}}
end


--
vim.cmd [[
    source $XDG_CONFIG_HOME/vim/common-after
]]

