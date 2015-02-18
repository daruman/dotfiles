" <Leader>cdでプロジェクトカレントディレクトリへ移動

NeoBundle 'airblade/vim-rooter'

if ! empty(neobundle#get("vim-rooter"))
    " 通常:cdのところ:lcdを使って移動(:lcdは現ウィンドウでのみcd)
    let g:rooter_use_lcd = 1

    " 指定フォーマットファイルが存在する箇所をルートとする
    " (左優先なので.hgがあってもその親階層に.gitがあればそこがルートになる)
    let g:rooter_patterns = ['.git', '.git/', '_darcs/', '.hg/', '.bzr/', 'Makefile', 'GNUMakefile', 'GNUmakefile', '.svn/']

    " 指定拡張子のファイルを開いたら自動でルートへ移動
    let g:rooter_autocmd_patterns = '*.c,*.cc,*.cxx,*.cpp,*.h,*.hh,*.java,*.py,*.sh,*.rb,*.html,*.css,*.js'
endif
