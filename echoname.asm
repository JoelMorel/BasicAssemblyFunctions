TITLE Echo name

; Author: Joel Morel
; Date: 9/9/2014

Include Irvine32.inc

.data

		prompt 	byte 	"Enter your name:",0
		array  	byte  	20 DUP(0)

.code

putstr      PROC

        call      writestring


ret
putstr      ENDP

main 		PROC

		call 	clrscr
		mov  	edx, offset prompt
		call 	writestring
		mov  	ecx, sizeof array
		mov  	edx, offset array
		call 	readstring
		call 	writestring

		exit
main 		ENDP

		END 	main
