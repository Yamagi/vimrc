" Pencil is a nice script that alters Vims autoformat behavior to match
" common word processors. That makes writing running text much more
" conveniant.

" Enable Pencil on <leader>ip
map <Leader>mp :TogglePencil<CR>

" Enable automatically when entering Goyo for non-distracted writing.
autocmd User GoyoEnter call pencil#init({'wrap': 'on' })
autocmd User GoyoLeave call pencil#init({'wrap': 'off' })

