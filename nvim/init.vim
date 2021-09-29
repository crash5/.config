source $XDG_CONFIG_HOME/vim/vimrc

set shadafile=$XDG_DATA_HOME/nvim/nviminfo
set undodir&

set inccommand=nosplit

" Treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = 'maintained',
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
            swap_next = {["<leader>xp"] = "@parameter.inner"},
            swap_previous = {["<leader>xP"] = "@parameter.inner"}
        },
        lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
                ["<leader>pf"] = "@function.outer",
                ["<leader>pc"] = "@class.outer"
            }
        }
    }
}
EOF
" }}}

lua <<EOF
require'lspconfig'.pyright.setup{}
EOF
