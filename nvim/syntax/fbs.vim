" flatbuffers syntax highlighter

if exists("b:current_syntax")
  finish
endif

" todo: highlight member names as identifiers?

syn keyword fbsKeyword namespace table union enum struct include root_type
syn keyword fbsType bool byte ubyte short ushort int uint float long ulong double string
syn keyword fbsType int8 uint8 int16 uint16 int32 uint32 float32 int64 uint64 float64

syn match   fbsInt     /-\?\<\d\+\>/

syn region fbsComment start="\/\*" end="\*\/"
syn region fbsComment start="//" skip="\\$" end="$" keepend

syn region  fbsString  start=/"/ skip=/\\./ end=/"/

hi def link fbsKeyword Keyword
hi def link fbsType Type
hi def link fbsInt Number
hi def link fbsComment Comment
hi def link fbsString String

" this is the only option that isn't janky.
" might be slower, who cares.
syn sync fromstart

let b:current_syntax = "fbs"
