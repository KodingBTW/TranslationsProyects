org $D61A
;base $1D61A

overflow_hijack:
	JSR $DED0
	STA $B8
	JSR $D9BD
	JSR $D711
	RTS