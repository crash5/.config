if !exists('g:loaded_fzf') || !executable('fzf')
    finish
endif

nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <leader><C-p> :<C-u>FZF <C-R>=expand("%:p:h") . "/"<CR><CR>
