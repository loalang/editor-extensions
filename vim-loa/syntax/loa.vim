" Vim Syntax File
" Language: Loa

if exists("b:current_syntax")
  finish
endif

syn keyword loaTodo             contained TODO FIXME XXX
syn region  loaMultilineComment start="/\*" end="\*/" fold contains=loaMultilineComment,loaTodo,@Spell
syn match   loaComment          "//.*" contains=loaTodo,@Spell

syn region  loaBlock            start="{" end="}" transparent fold

syn keyword loaKeyword          namespace import export as class public private var init self is partial in out inout static let
syn match   loaType             '\v[A-Z_][A-Za-z_0-9.]*\'*'
syn match   loaVariable         '\v[a-z_][A-Za-z_0-9.]*\'*'
syn match   loaFunction         '\v[A-Za-z_0-9]+\'*\(@='

syn region  loaString           start='"' end='"' fold
syn region  loaChar             start="'" end="'" fold

syn match   loaNumber           '\v-?[0-9\']+'
syn match   loaNumber           '\v-?[0-9\']+\.[0-9']+'
syn match   loaNumber           '\v-?[0-9\']+\#[A-Za-z0-9\']+'
syn match   loaNumber           '\v-?[0-9\']+\#[A-Za-z0-9\']+\.[A-Za-z0-9 ]+'

syn match   loaPunctuation      '\v(\(|\)|\<|\>|,|:|\[|\]|\{|\})'
syn match   loaPunctuation      '->'
syn match   loaPunctuation      '=>'

let b:current_syntax = "loa"

hi link loaMultilineComment Comment
hi link loaComment          Comment
hi link loaTodo             Todo
hi link loaKeyword          Keyword
hi link loaType             Type
hi link loaFunction         Function
hi link loaString           String
hi link loaChar             String
hi link loaNumber           Number
hi link loaPunctuation      Special
