augroup python
  autocmd!
  autocmd Filetype python set shiftwidth=4 softtabstop=4 tabstop=4 expandtab
  autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
  autocmd FileType python match Excess /\%80v.*/
augroup END
