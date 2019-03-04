TITLE Echo Name ; proc that accepts a string and displays to standard output

; Author: Joel Morel
; Date: 9/16/2014

Include Irvine32.inc

.data

stringDisplay byte 	"This is a string passed through the stack",0
		

.code

strPut      PROC

			push   	 ebp
			mov      ebp, esp
			push	 edx
			mov      edx, [ebp+8]
			call 	 writestring
			call  	 crlf
			pop      edx
			pop	 	 ebp
			ret		 4
	    
strPut      ENDP

main 		PROC

			push 	offset stringDisplay
			call	strPut
			exit

main 		ENDP

END 	main
