augroup filetypedetect
" Inventor
au BufNewFile,BufRead *.iv		setf iv
" wikipedia
au BufNewFile,BufRead *.wikitext	setf wikipedia
" ln_manager
au BufNewFile,BufRead *.lnc	setf lnc
augroup END
