NeoBundleLazy "wesleyche/SrcExpl", {
            \ "autoload" : { "commands": ["SrcExplToggle"]}}

" Mappings
" トグル用のショートカットは<Leader>E<CR>に。
"
" <Leader>Euで現ファイルのタグをアップデート。
" <Leader>Eaで全てのファイルのタグをアップデート。
" <Leader>En/pはその関数が複数の場所で定義されてる時などに 次の候補や前の候補への移動。
" @link [VimをIDEっぽく(主にC++/Java用)整える - rcmdnk’s blog](http://rcmdnk.github.io/blog/2014/07/25/computer-vim/)
nn [srce] <Nop>
nm <Leader>E [srce]
nn <silent> [srce]<CR> :SrcExplToggle<CR>
nn <silent> [srce]u :call g:SrcExpl_UpdateTags()<CR>
nn <silent> [srce]a :call g:SrcExpl_UpdateAllTags()<CR>
nn <silent> [srce]n :call g:SrcExpl_NextDef()<CR>
nn <silent> [srce]p :call g:SrcExpl_PrevDef()<CR>

" Update all tags
function! g:SrcExpl_UpdateAllTags()
    let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase -R .'
    call g:SrcExpl_UpdateTags()
    let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %'
endfunction


let s:hooks = neobundle#get_hooks("SrcExpl")
function! s:hooks.on_source(bundle)
    " Set refresh time in ms
    let g:SrcExpl_RefreshTime = 1000

    " Is update tags when SrcExpl is opened
    let g:SrcExpl_isUpdateTags = 0

    " Tag update command
    let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %'

    " Source Explorer Window Height
    let g:SrcExpl_winHeight = 14
endfunction
