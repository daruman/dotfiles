NeoBundle 'Yggdroot/indentLine'

let g:indentLine_faster = 1

" <Leader>iでtoggle
nnoremap <silent><Leader>i :<C-u>IndentLinesToggle<CR>


" 除外するファイルタイプ
let g:indentLine_fileTypeExclude = [
      \ 'help',
      \ 'tweetvim',
      \ 'unite',
      \ 'vimfiler',
      \ 'vimshell',
      \ 'calendar',
      \ ]
