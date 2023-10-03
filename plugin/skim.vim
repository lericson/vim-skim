let g:skim_displayline = '/Applications/Skim.app/Contents/SharedSupport/displayline -n'

function! s:SkimPDF(arg)
  if a:arg != ""
    let g:skim_pdf = a:arg
  elseif !exists('g:skim_pdf')
    call s:SkimFindPDF()
    if !exists('g:skim_pdf')
      return
    endif
  endif
  let l:cmd = join([g:skim_displayline, line('.'), shellescape(g:skim_pdf), shellescape(expand('%:p'))], ' ')
  silent let l:output = systemlist(l:cmd)
  if !empty(l:output)
    echoerr "displayline failed:"
    for l:line in l:output
      echoerr l:line
    endfor
  endif
  if v:shell_error != 0
    echoerr "displayline exited with return code " .. v:shell_error
  endif
  "silent ! %line "%pdffile" "%texfile"
endfunction

function! s:SkimFindPDF()
  if exists('g:skim_pdf')
    return
  endif

  let dirnams = ['output', 'build', '.']
  let fnams = ['output.pdf', 'main.pdf']

  for dirnam in dirnams
    for fnam in fnams
      let path = dirnam .. '/' .. fnam
      if filereadable(path)
        let g:skim_pdf = path
        return
      endif
    endfor
  endfor

  echo "Could not autodetect PDF name, open manually"
  echo "  :SkimPDF path/to/my.pdf"

endfunction

command! -nargs=? -complete=file SkimPDF call s:SkimPDF(<q-args>)

nmap <Plug>(skim_here) :SkimPDF<CR>
