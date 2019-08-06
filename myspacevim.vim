function! myspacevim#before() abort
endfunction

function! myspacevim#after() abort
  set clipboard+=unnamed
  set clipboard+=unnamedplus
  set ignorecase
  let g:spacevim_lint_on_save = 0
endfunction

