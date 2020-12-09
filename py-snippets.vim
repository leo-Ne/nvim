"" this is a personal setting file for python.
"" author: Leo-Ne

autocmd Filetype python map <F4> :call TitleDet()<CR>
" map <F4> :call TitleDet()<CR>
function AddTilte()
  call append(0, "\#! /use/bin/env python")
  call append(1,"''' **************************************")
  call append(2,"# Author       :leo-Ne")
"#  call append(3,"# Last modified:".strftime("%Y-%m-%d %H:%M"))
  call append(3,"# Last modified:".strftime("%Y-%m-%d %H:%M"))
  call append(4,"# Email        : leo@email.com")
  call append(5,"# Filename     :".expand("%:t"))
  call append(6,"# Description  : ")
  call append(7,"**************************************'''")
  echohl WarningMsg | echo "Sucessful in adding copyright." | echohl None
endf

function UpdateTitle()
  normal m'
  execute '/# Last modified/s@:.*$@\=strftime(":\t%y-%m-%d %H:%M")@'
  normal ''
  normal mk
  execute '/# Filename/s@:.*$@\=":\t".expand("%:t")@'
  execute "noh"
  execute 'k
  echohl WarningMsg | echo "Sucessful in updating the copyright." | echohl None
endfunction

function TitleDet()
  let n=1
  while n < 10
    let line = getline(n)
    if line =~ '^\#\s*\S*Last\smodified\S*.*$:'
      call UpdateTitle()
      return
    endif
    let n= n + 1
  endwhile
  call AddTilte()
endfunction

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
" function annotation
autocmd Filetype python inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype python inoremap <buffer> ,c """<Enter><++><Enter>"""<Enter><++><Esc>3kA
