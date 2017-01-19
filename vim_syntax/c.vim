" "Add syntax for HEW
" syn keyword	cType		uint8 uint16 uint32 uint64
" syn keyword	cType		int8 int16 int32 int64
" syn match	cDefine		display "DF_[a-zA-Z0-9_]*"
" syn match	cppStorageClass		display "TG_[a-zA-Z0-9_]*"
" " -----------------

syn match	cOperator	"[\+\*\|\-\<\>\!=\.\/\&\%]" contains=cComment,cCommentL
syn keyword	cNote		contained NOTE
syn cluster	cCommentGroup	contains=cTodo,cBadContinuation,cNote

syn match	cType		"\w*_t\%(\w\)\@!"
syn match	cGrobal		"\%(\w\)\@<!g_\w*"
syn match	cDefine	"\%([a-z]\)\@<!\([A-Z][A-Z0-9\_]*\)\%([a-z]\)\@!"

hi def link cGrobal		Identifier
