" Author: Emil Broman <emil@emilbroman.me>
" Description: Loa Language Server integration for ALE

call ale#Set('loa_executable', '/usr/local/bin/loa')

function! ale_linters#loa#loa_server#GetExecutable(buffer) abort
    return ale#Var(a:buffer, 'loa_executable')
endfunction

function! ale_linters#loa#loa_server#GetProjectRoot(buffer) abort
    let l:pkg = ale#path#FindNearestFile(a:buffer, 'pkg.yml')

    return !empty(l:pkg) ? fnamemodify(l:pkg, ':h') : getcwd()
endfunction

function! ale_linters#loa#loa_server#GetLanguage(buffer) abort
    return 'loa'
endfunction

call ale#linter#Define('loa', {
\   'name': 'loa_server',
\   'lsp': 'stdio',
\   'executable_callback': 'ale_linters#loa#loa_server#GetExecutable',
\   'command': '%e server',
\   'language_callback': 'ale_linters#loa#loa_server#GetLanguage',
\   'project_root_callback': 'ale_linters#loa#loa_server#GetProjectRoot',
\})
