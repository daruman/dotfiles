" NeoBundle 'mattn/emmet-vim'
NeoBundleLazy 'mattn/emmet-vim', {
            \ 'autoload': {'filetypes': ['html','ruby','php','css'] }
            \}

let s:hooks = neobundle#get_hooks("emmet-vim")
function! s:hooks.on_source(bundle)
    let g:user_emmet_settings = {
                \  'lang' : 'ja',
                \  'php' : {
                \    'extends' : 'html',
                \    'filters' : 'c',
                \  },
                \  'xml' : {
                \    'extends' : 'html',
                \  },
                \  'haml' : {
                \    'extends' : 'html',
                \  },
                \  'html' : {
                \    'empty_element_suffix' : '>',
                \  },
                \}

    " let g:user_emmet_settings  = {
    " \  'lang' : 'ja',
    " \  'html' : {
    " \    'empty_element_suffix' : '>',
    " \  }
    " \}
endfunction

