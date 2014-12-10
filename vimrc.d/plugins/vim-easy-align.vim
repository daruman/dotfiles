" @link [VimでPHPによく出てくるテキスト整形 - Qiita](http://qiita.com/NanohaAsOnKai/items/5e196bfbb8c3d0b98385)
" とりあえず選択→<Leader>a→'='で=の位置で整列、'$'で$のいちで整列
NeoBundleLazy 'junegunn/vim-easy-align', {
            \    'autoload': {
            \        'commands' : 'EasyAlign',},}

vnoremap <silent> <Leader>a :EasyAlign<CR>


let s:hooks = neobundle#get_hooks("vim-easy-align")
function! s:hooks.on_source(bundle)
    let g:easy_align_delimiters = {
                \    '=': {
                \        'pattern': '===\|!==\|<=>\|\(&&\|||\|<<\|>>\)=\|=\~[#?]\?\|=>\|[:+/*!%^=><&|.-]\?=[#?]\?',
                \        'left_margin': 1,
                \        'right_margin': 1,
                \        'stick_to_left': 0 },
                \    '>': {
                \        'pattern': '>>\|=>\|>', },
                \    '/': {
                \        'pattern':       '//\+\|/\*\|\*/',
                \        'ignore_groups': ['String'], },
                \    '#': {
                \        'pattern':         '#\+',
                \        'ignore_groups':   ['String'],
                \        'delimiter_align': 'l', },
                \    '$': {
                \        'pattern':         '\((.*\)\@!$\(.*)\)\@!',
                \        'ignore_groups':   ['String'],
                \        'right_margin':  0,
                \        'delimiter_align': 'l', },
                \    ']': {
                \        'pattern':       '[[\]]',
                \        'left_margin':   0,
                \        'right_margin':  0,
                \        'stick_to_left': 0, },
                \    ')': {
                \        'pattern':       '[()]',
                \        'left_margin':   0,
                \        'right_margin':  0,
                \        'stick_to_left': 0, },
                \    'd': {
                \        'pattern':      ' \(\S\+\s*[;=]\)\@=',
                \        'left_margin':  0,
                \        'right_margin': 0, }, }
endfunction

