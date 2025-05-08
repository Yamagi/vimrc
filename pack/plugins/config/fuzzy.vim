vim9script

# A universal fuzzy finder optimized for speed.

# URL: https://github.com/Donaldttt/fuzzyy

# ----

# Disable default mappings.
g:fuzzyy_enable_mappings = 0

# Patterns used to detect project root.
g:fuzzyy_root_patterns = ['.git', '.hg', '.svn', '.vimrc']

# Mappings
nnoremap <silent> <leader>fb :FuzzyBuffers<cr>
nnoremap <silent> <leader>ff :FuzzyFilesRoot<cr>
nnoremap <silent> <leader>fg :FuzzyGrepRoot<cr>
nnoremap <silent> <leader>fm :FuzzyMru<cr>
nnoremap <silent> <leader>ft :FuzzyTagsRoot<cr>
