NeoBundle 'thinca/vim-quickrun', {
            \ 'depends' : 'Shougo/vimproc.vim',
            \}

let s:hooks = neobundle#get_hooks("vim-quickrun")
function! s:hooks.on_source(bundle)
    augroup QuickRunPHPUnit
        " *Test.phpをphpunitファイルとして定義する
        autocmd!
        autocmd BufWinEnter,BufNewFile *Test.php set filetype=php.phpunit
    augroup END

    " init
    let g:quickrun_config = {}

    " runnerにvimprocを設定、非同期処理させてvim自体の動作に影響を出さない
    let g:quickrun_config['*'] = {'runmode': "async:remote:vimproc", 'split':'below'}
    let g:quickrun_config['_'] = {'runner': 'vimproc', 'runner/vimproc/updatetime': 100}

    " <Leader>rでテスト実行
    " see also http://www.karakaram.com/quickrun-phpunit
    " 実行時は:cd でphpunit.xmlがあるdirへ移動してから実行
    " phpunit.xml以外の名前の設定ファイルの場合
    " :QuickRun -cmdopt '-c "phpunit.xml.dist"'とかするといいぽい
    let g:quickrun_config['php.phpunit'] = {}
    let g:quickrun_config['php.phpunit']['outputter/buffer/split'] = '10'
    let g:quickrun_config['php.phpunit']['command'] = 'phpunit'
    let g:quickrun_config['php.phpunit']['exec'] = '%c %o %s'



    " vagrantを使用したテストは以下内容の.vimrc.localをproject rootに配置する
        " phpunit.xmlもしくはphpunit.xml.distのあるdirectory(絶対パス)
        " let s:phpunit_xml_path = "/vagrant/app/"

        " テストのrootディレクトリ名
        " let s:test_directory_name = "Tests"

        " テストディレクトリのパス(絶対パス)
        " let s:test_directory_path = "/vagrant/src/Waltz/Route16Bundle/" . s:test_directory_name

        " let g:quickrun_config['php.phpunit'] = {}
        " let g:quickrun_config['php.phpunit']['outputter/buffer/split'] = '10'
        " let g:quickrun_config['php.phpunit']['command'] = 'vagrant'
        " let g:quickrun_config['php.phpunit']['cmdopt'] = '-c'
        " let g:quickrun_config['php.phpunit']['args'] = 'phpunit -c ' . s:phpunit_xml_path
        " %c = command, %o = cmdopt, %a = args, %s = ソースファイル絶対パス(hostOS上)
        " hoge:gs?fuga?foo? = 文字列hoge内のfugaをfooに置換する
        " let g:quickrun_config['php.phpunit']['exec'] = '%c ssh webserver %o "%a ' . s:test_directory_path . "%s:gs?/\.*" . s:test_directory_name . "/?/?" . '"'
endfunction
