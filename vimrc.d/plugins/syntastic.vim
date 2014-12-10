NeoBundleLazy 'scrooloose/syntastic', {
            \ 'autoload' : { 'commands' : 'SyntasticCheck' }
            \}

" syntastic
" Shift+Mで構文チェック
nmap M :SyntasticCheck<CR>


let s:hooks = neobundle#get_hooks("syntastic")
function! s:hooks.on_source(bundle)
    " javascriptは保存時構文チェックしない、htmlはvim-html5validatorで行う
    " cssはエラーでたまままのファイルを保存するとvimが落ちる場合があるので除外
    " phpはphp5.2用コードをphp5.3以上の環境でチェックするとnamespace未使用エラーが出るので手動で行う



    let g:syntastic_mode_map = {
                \ 'mode': 'active',
                \ 'active_filetypes': [],
                \ 'passive_filetypes': ['javascript', 'html', 'css', 'php']
                \}

    " file open時にチェック
    let g:syntastic_check_on_open=0

    " error行表示部分にマウスオーバーでポップアップするのを非表示
    let g:syntastic_enable_balloons=0

    " errorを検知した際に自動でQuickfixを開く
    let g:syntastic_auto_loc_list=1

    let g:syntastic_enable_signs = 1
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = '⚠'

    " php
    " --------------------------------------------------------------------------------
    " phpcsでチェックするコーディング規約をdefaultのPEARからPSRに変更(PSR2を指定する事でPSR0、1も対応)、-nで警告表示無し
    let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
    let g:syntastic_php_phpcs_args = '--report=csv -n --standard=PSR2'
    " javascript
    " --------------------------------------------------------------------------------
    " let g:syntastic_javascript_checkers = [‘jshint’]
    " let g:syntastic_javascript_checker = "closurecompiler"
    " let g:syntastic_javascript_closure_compiler_path = $HOME . "/bin/compiler.jar"

    " css
    " --------------------------------------------------------------------------------
    " csslintで連続class指定、装飾無し属性指定のwarn出力を抑止
    " let g:syntastic_csslint_options = "--ignore=adjoining-classes,unqualified-attributes,box-model"

endfunction
