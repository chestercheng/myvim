" go to start/end of line
imap <Char-1> <Char-15>:normal ^<cr>
imap <Char-5> <Char-15>:normal $<cr>

" go to prev/next word
imap <ESC>b <Char-15>:normal b<cr>
imap <ESC>f <Char-15>:normal w<cr>

nmap <silent> <leader><ESC> :let @/=""<cr>
nmap <silent> <leader>a <Plug>(EasyAlign)
vmap <silent> <leader>a <Plug>(EasyAlign)
nmap <silent> <leader>c <Plug>(caw:hatpos:toggle)
vmap <silent> <leader>c <Plug>(caw:hatpos:toggle)
nmap <silent> <leader>l :Limelight!!<cr>

nmap <silent> <F2> :NERDTree<cr>
vmap <silent> <F5> :sort<cr>
nmap <silent> <F12> :MarkdownPreview<cr>

if !exists('g:VM_maps')
  let g:VM_maps={}
endif
let g:VM_maps["Select Cursor Up"]='<S-Up>'
let g:VM_maps["Select Cursor Down"]='<S-Down>'
