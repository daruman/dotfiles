NeoBundle 'Shougo/junkfile.vim', {
            \ 'depends' : 'Shougo/unite.vim',
            \}


let g:junkfile#directory=expand('$HOME/memo/junkfile')

command! -nargs=0 JunkfileDay call junkfile#open_immediately(strftime('%Y-%m-%d.md'))

nnoremap <silent> ,ml  :<C-u>Unite junkfile<CR>
nnoremap <silent> ,m  :<C-u>JunkfileDay<CR>

