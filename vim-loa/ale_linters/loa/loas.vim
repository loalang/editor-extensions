" Author: Emil Persson <emil.n.persson@gmail.com>
" Description: Loa Language Server integration for ALE

call ale#Set('loas_executable', '/usr/local/bin/loas')

function! ale_linters#loa#loas#GetExecutable(buffer) abort
    return ale#Var(a:buffer, 'loas_executable')
endfunction

function! ale_linters#loa#loas#GetProjectRoot(buffer) abort
    let l:pkg = ale#path#FindNearestFile(a:buffer, 'pkg.yml')

    return !empty(l:pkg) ? fnamemodify(l:pkg, ':h') : getcwd()
endfunction

function! ale_linters#loa#loas#GetLanguage(buffer) abort
    return 'loa'
endfunction

call ale#linter#Define('loa', {
\   'name': 'loas',
\   'lsp': 'stdio',
\   'executable_callback': 'ale_linters#loa#loas#GetExecutable',
\   'command_callback': 'ale_linters#loa#loas#GetExecutable',
\   'language_callback': 'ale_linters#loa#loas#GetLanguage',
\   'project_root_callback': 'ale_linters#loa#loas#GetProjectRoot',
\})
