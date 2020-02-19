augroup go
  autocmd!
  autocmd FileType go set shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
  autocmd FileType go nmap <silent> <leader>r :! go run % <cr>
  autocmd FileType go nmap <silent> <leader>f :! gofmt -w % <cr><cr>
augroup END
