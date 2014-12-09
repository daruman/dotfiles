NeoBundle 'gregsexton/gitv', {
            \ 'depends' : 'tpope/vim-fugitive',
            \}

augroup gitv
  autocmd!

  " diff内容を折りたたまないで表示
  autocmd FileType git :setlocal foldlevel=99
augroup END
