function! AlignSetChar( char )
	let b:align_char = a:char
endfunction

" Character
" Width
function! AlignLeft(...)
	let char = ( a:0 > 0 ) ? a:1 : exists( "b:align_char" ) ? b:align_char : " "
	let width = ( a:0 > 1 ) ? a:2 : ( &textwidth > 0 ) ? &textwidth : 80
	let linewidth = strwidth(
		\ substitute( getline( "." ), "\t", repeat( " ", &tabstop ), "" ) )
	if width - linewidth < 2
		return
	endif

	if getline( "." ) =~ '^\s*$'
		exe ":normal A" . repeat(
			\ char,
			\ width - linewidth
		\ )
	else
		exe ":normal A " . repeat(
			\ char,
			\ width - linewidth - 1
		\ )
	endif
endfunction

" Character
" Width
function! AlignCenter(...)
	let char = ( a:0 > 0 ) ? a:1 : exists( "b:align_char" ) ? b:align_char : " "
	let width = ( a:0 > 1 ) ? a:2 : ( &textwidth > 0 ) ? &textwidth : 80
	let linewidth = strwidth(
		\ substitute( getline( "." ), "\t", repeat( " ", &tabstop ), "" ) )
	if width - linewidth < 2
		return
	endif

	if getline( "." ) =~ '^\s*$'
		exe ":normal A" . repeat(
			\ char,
			\ width - linewidth
		\ )
	else
		exe ":normal A " . repeat(
			\ char,
			\ float2nr( ceil( ( width + 0.0 - linewidth ) / 2 ) ) - 1
		\ )
		exe ":normal I" . repeat(
			\ char,
			\ float2nr( floor( ( width + 0.0 - linewidth ) / 2 ) ) - 1
		\ ) . " "
	endif
endfunction

" Character
" Width
function! AlignRight(...)
	let char = ( a:0 > 0 ) ? a:1 : exists( "b:align_char" ) ? b:align_char : " "
	let width = ( a:0 > 1 ) ? a:2 : ( &textwidth > 0 ) ? &textwidth : 80
	let linewidth = strwidth(
		\ substitute( getline( "." ), "\t", repeat( " ", &tabstop ), "" ) )
	if width - linewidth < 2
		return
	endif

	if getline( "." ) =~ '^\s*$'
		exe ":normal A" . repeat(
			\ char,
			\ width - linewidth
		\ )
	else
		exe ":normal I" . repeat(
			\ char,
			\ width - linewidth - 1
		\ ) . " "
	endif
endfunction

command! -range AlignLeft :call AlignLeft()
command! -range AlignCenter :call AlignCenter()
command! -range AlignRight :call AlignRight()
command! -range -nargs=1 AlignSetChar :call AlignSetChar( <f-args> )
