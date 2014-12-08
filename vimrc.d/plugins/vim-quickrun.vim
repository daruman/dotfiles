NeoBundle 'thinca/vim-quickrun', {
    \ 'depends' : 'Shougo/vimproc.vim',
\}

" <Leader>rでテスト実行
" see also http://www.karakaram.com/quickrun-phpunit

" 実行時は:cd でphpunit.xmlがあるdirへ移動してから実行
" phpunit.xml以外の名前の設定ファイルの場合
" :QuickRun -cmdopt '-c "phpunit.xml.dist"'とかするといいぽい

augroup QuickRunPHPUnit
    " *Test.phpをphpunitファイルとして定義する
    autocmd!
    autocmd BufWinEnter,BufNewFile *Test.php set filetype=php.phpunit
augroup END

" init
let g:quickrun_config = {}
let g:quickrun_config['*'] = {'runmode': "async:remote:vimproc", 'split':'below'}
" runnerにvimprocを設定、非同期処理させてvim自体の動作に影響を出さない
let g:quickrun_config['_'] = {'runner': 'vimproc', 'runner/vimproc/updatetime': 100}

let g:quickrun_config['php.phpunit'] = {}
let g:quickrun_config['php.phpunit']['outputter/buffer/split'] = '10'
let g:quickrun_config['php.phpunit']['command'] = 'phpunit'
let g:quickrun_config['php.phpunit']['exec'] = '%c %o %s'

