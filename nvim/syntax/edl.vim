" intel sgx enclave definition language highlighter

if exists("b:current_syntax")
  finish
endif

" TODO: highlight preprocessor directives

syn keyword edlKeyword enclave trusted untrusted from import include public allow
syn keyword edlType struct union enum const
syn keyword edlType char short unsigned int float double int8_t int16_t int32_t uint8_t uint16_t uint32_t uint64_t size_t wchar_t long void

syn match   edlInt     /-\?\<\d\+\>/

syn match edlAttr /\[[^\]]*\]/

syn region edlComment start="\/\*" end="\*\/"
syn region edlComment start="//" skip="\\$" end="$" keepend

syn region  edlString  start=/"/ skip=/\\./ end=/"/

hi def link edlKeyword Keyword
hi def link edlType Type
hi def link edlInt Number
hi def link edlComment Comment
hi def link edlString String
" not correct but looks nice
hi def link edlAttr Identifier

syn sync fromstart

let b:current_syntax = "edl"
