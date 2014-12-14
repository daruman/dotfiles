NeoBundleLazy 'Chiel92/vim-autoformat', {
            \ 'autoload': {
            \ 'commands' : 'Autoformat',},}

noremap <F3> :Autoformat<CR><CR>

let s:hooks = neobundle#get_hooks("vim-autoformat")
function! s:hooks.on_source(bundle)
    let g:formatprg_php = "phpcbf"
endfunction

