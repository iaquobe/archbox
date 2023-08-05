vim.cmd('command! -bang -nargs=? -complete=dir HFiles call fzf#vim#files(<q-args>, {\'source\': \'fd --hidden --ignore-file .git/ -g ""\'}, <bang>0)')
