"" this is a personal setting file for python.
"" author: Leo-Ne

"" autocmd Filetype vimwiki inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
"" autocmd Filetype vimwiki inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
"" autocmd Filetype vimwiki inoremap <buffer> ,n ---<Enter><Enter>
"" autocmd Filetype vimwiki inoremap <buffer> ,b **** <++><Esc>F*hi
"" autocmd Filetype vimwiki inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
"" autocmd Filetype vimwiki inoremap <buffer> ,i ** <++><Esc>F*i
"" autocmd Filetype vimwiki inoremap <buffer> ,d `` <++><Esc>F`i
"" autocmd Filetype vimwiki inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
"" autocmd Filetype vimwiki inoremap <buffer> ,m - [ ]
"" autocmd Filetype vimwiki inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
"" autocmd Filetype vimwiki inoremap <buffer> ,a [](<++>) <++><Esc>F[a
"" autocmd Filetype vimwiki inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
"" autocmd Filetype vimwiki inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
"" autocmd Filetype vimwiki inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
"" autocmd Filetype vimwiki inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
"" autocmd Filetype vimwiki inoremap <buffer> ,l --------<Enter>
autocmd Filetype python inoremap <buffer> ,/ <Esc>00i#<Esc>
autocmd FileType python noremap ,/ 00i#<Esc>
autocmd Filetype python inoremap <buffer> ,' <Esc>F#xx
autocmd FileType python noremap ,' <Esc>00f#x

autocmd FileType python noremap \\ <Esc>00i#<Esc>
"" autocmd FileType python noremap || <Esc>00f#d<Esc>
