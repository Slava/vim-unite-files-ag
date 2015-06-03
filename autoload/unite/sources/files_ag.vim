let s:save_cpo = &cpo
set cpo&vim

let s:unite_source = {
      \ 'name': 'files_ag',
      \ 'hooks': {},
      \ 'action_table': {'*': {}},
      \ 'default_kind': 'file'
      \ }

function! s:unite_source.gather_candidates(args, context)
  let ag_command = 'ag'
  let ag_flags = '-l -G ""'

  if exists('g:unite_ag_command')
    let ag_command = g:unite_ag_command
  endif

  if exists('g:unite_ag_flags')
    let ag_flags = g:unite_ag_flags
  endif

  let fileslist = split(system(ag_command . ' ' . ag_flags . ' | head -20000'), '\n')

  " "action__type" is necessary to avoid being added into cmdline-history.
  return map(fileslist, '{
        \ "word": v:val,
        \ "action__path": v:val
        \ }')
endfunction

function! unite#sources#files_ag#define()
  return s:unite_source
endfunction


"unlet s:unite_source

let &cpo = s:save_cpo
unlet s:save_cpo
