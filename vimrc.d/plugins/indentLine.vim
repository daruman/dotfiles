NeoBundle 'Yggdroot/indentLine'

let g:indentLine_faster = 1
let g:indentLine_color_term = 237
let g:indentLine_color_gui = "#333333"

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

