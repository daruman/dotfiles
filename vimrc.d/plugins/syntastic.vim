NeoBundleLazy 'scrooloose/syntastic', {
            \ 'autoload' : { 'commands' : 'SyntasticCheck' }
            \}

" syntastic
" Shift+Mで構文チェック
nmap M :SyntasticCheck<CR>


let s:hooks = neobundle#get_hooks("syntastic")
function! s:hooks.on_source(bundle)
    " errorを検知した際に自動でQuickfixを開く
    " let g:syntastic_auto_loc_list=1

    " syntastic_auto_loc_list=1だと当然checkするたびにqfが開くので
    " C-eで自分で開閉する
    nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>


    let g:syntastic_mode_map = {
                \ 'mode': 'active',
                \ 'active_filetypes': [],
                \ 'passive_filetypes': ['javascript', 'html', 'css', 'php']
                \}

    " file open時にチェック
    let g:syntastic_check_on_open=0

    " error行表示部分にマウスオーバーでポップアップするのを非表示
    let g:syntastic_enable_balloons=0


    let g:syntastic_enable_signs = 1
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = '⚠'



    " php
    " --------------------------------------------------------------------------------
    " phpcsでチェックするコーディング規約をdefaultのPEARからPSRに変更(PSR2を指定する事でPSR0、1も対応)、-nで警告表示無し
    let g:syntastic_php_phpcs_args = '--report=csv -n --standard=PSR2'

    " javascript
    " --------------------------------------------------------------------------------
    let g:syntastic_javascript_checkers = ['jshint']
    let g:syntastic_javascript_jshint_args = "--config ~/.jshintrc"

    " css
    " --------------------------------------------------------------------------------
    " csslintで連続class指定、装飾無し属性指定のwarn出力を抑止
    " @link [CSSLintのRulesの超訳](https://gist.github.com/hail2u/1303613)
    let g:syntastic_csslint_options = "--ignore=adjoining-classes,unqualified-attributes,box-model"

    " json
    " --------------------------------------------------------------------------------
    let g:syntastic_json_checkers = ['jsonlint']

endfunction

" toggle error quickfix
"
" @link [vim - Toggle Error Location panel in syntastic - Stack Overflow](http://stackoverflow.com/questions/17512794/toggle-error-location-panel-in-syntastic)
function! ToggleErrors()
    let l:old_last_winnr = winnr('$')
    lclose
    if l:old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
