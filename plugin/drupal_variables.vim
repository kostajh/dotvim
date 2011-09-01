" Pulls in Drupal variables (from Drush) and outputs variable_set() calls for
" each variable.
" Todo: Should probably check to see if drush can bootstrap
function! s:DrushVariableGet(args)
  exec "normal o"
  exec "r !drush variable-get --pipe " . a:args . " | sed 's/$variables\\[\\(.*\\)\\] = /variable_set(\\1, /' | sed 's/;$/);/'"
  exec "normal ={"
endfunction
command! -bang -nargs=* -complete=file Dvar call s:DrushVariableGet(<q-args>)
