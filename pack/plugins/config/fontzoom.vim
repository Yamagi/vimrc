vim9script

# fontzoom allows to adjust the fontsite in gvim with key combinations.

# URL: https://github.com/thinca/vim-fontzoom/

# ----

# No default bindings.
g:fontzoom_no_default_key_mappings = 1

# Resize on CTRL-+ and CTRL--, the same as most terminals.
nmap <C-+> <Plug>(fontzoom-larger)
nmap <C-_> <Plug>(fontzoom-smaller)
nmap <C-0> :Fontzoom!<CR>
