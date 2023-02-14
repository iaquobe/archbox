--MAPPINGS
--open and close folds

local keymap = vim.keymap

keymap.set('n', '<tab>', 'za')

-- coc autocomplete
vim.cmd('inoremap <silent><expr> <c-space> coc#refresh()')

-- exit term mode
keymap.set('t', '<C-o>', '<C-\\><C-N>')

-- navigation
keymap.set('t','<C-h>','<C-\\><C-N><C-w>h',{remap=true})
keymap.set('t','<C-j>','<C-\\><C-N><C-w>j',{remap=true})
keymap.set('t','<C-k>','<C-\\><C-N><C-w>k',{remap=true})
keymap.set('t','<C-l>','<C-\\><C-N><C-w>l',{remap=true})
keymap.set('i','<C-h>','<C-\\><C-N><C-w>h',{remap=true})
keymap.set('i','<C-j>','<C-\\><C-N><C-w>j',{remap=true})
keymap.set('i','<C-k>','<C-\\><C-N><C-w>k',{remap=true})
keymap.set('i','<C-l>','<C-\\><C-N><C-w>l',{remap=true})
keymap.set('n','<C-h>','<C-w>h',{remap=true})
keymap.set('n','<C-j>','<C-w>j',{remap=true})
keymap.set('n','<C-k>','<C-w>k',{remap=true})
keymap.set('n','<C-l>','<C-w>l',{remap=true})
keymap.set('n','<silent>','<leader>ww :call WindowSwap#EasyWindowSwap()<CR>',{remap=true})

-- auto correct with leader + c
keymap.set('n', '<Leader>c', 'mm0]s1z=`m')

-- delete last typed word with ctrl + u
keymap.set('i', '<C-u>', '<C-w>', {remap=true})

-- add lines with [number]<space>+<j/k>
vim.cmd([[function! InsertLines(direction)
	if a:direction == 1
		execute "normal ". v:count1. "o" 
		execute "normal ". v:count1. "k" 
	elseif a:direction == -1
		execute "normal ". v:count1. "O" 
		execute "normal j" 
	endif
endfunction]])
keymap.set('n','<leader>j', ':<c-u>call InsertLines(1)<ESC>')
keymap.set('n','<leader>k', ':<c-u>call InsertLines(-1)<ESC>')

-- change tabs
keymap.set('n','<leader>1','1gt',{remap=true})
keymap.set('n','<leader>2','2gt',{remap=true})
keymap.set('n','<leader>3','3gt',{remap=true})
keymap.set('n','<leader>4','4gt',{remap=true})
keymap.set('n','<leader>5','5gt',{remap=true})
keymap.set('n','<leader>6','6gt',{remap=true})
keymap.set('n','<leader>7','7gt',{remap=true})
keymap.set('n','<leader>8','8gt',{remap=true})
keymap.set('n','<leader>9','9gt',{remap=true})
keymap.set('n','<leader>n','gt',{remap=true})
keymap.set('n','<leader>p','gT',{remap=true})

-- goyo open
keymap.set('n', '<leader>y', ':Goyo<CR>')

vim.g.windowswap_map_keys = 0 
vim.cmd("nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>")

-- FZF keybinds
keymap.set("n", "<leader>e", ":FZF<CR>", {remap=true})
keymap.set("n", "<leader>v", ":vsplit<CR>:FZF<CR>", {remap=true})
