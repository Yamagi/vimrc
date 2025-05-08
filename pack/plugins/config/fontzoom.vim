vim9script

# fontzoom allows to adjust the fontsize in gvim with key combinations.

# URL: https://github.com/thinca/vim-fontzoom/

# ----

# No default bindings.
g:fontzoom_no_default_key_mappings = 1

# Resize on CTRL-+ and CTRL--, the same as most terminals.
nmap <c-+> <plug>(fontzoom-larger)
nmap <c-_> <plug>(fontzoom-smaller)
nmap <c-0> :Fontzoom!<cr>
