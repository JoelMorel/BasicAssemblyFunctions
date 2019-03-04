TITLE Echo Name ; proc that accepts a string and counts the characters in the string.

; Author: Joel Morel
; Date: 9/30/2014

Include Irvine32.inc

.data

			prompt		byte 	"Enter a string of characters: ",0
			lengthCount byte    "Length of string is: ",0
			array       byte  	 20 DUP(0)

.code

strLen		PROC
			
			push ebp
			mov  ebp, esp
			push edx
			mov  eax, 0
			mov  edx, [ebp+8]

			l1 :
			mov       bl, [edx]
			cmp       bl, 0
			je        last
			inc       eax
			inc       edx
			loop	  l1	
			
		    last:
			pop       edx
			pop		  ebp
			ret		  4

strLen		ENDP

strPut      PROC

			push    ebp
			mov     ebp, esp
			push	edx
			mov     edx, [ebp+8]
			call 	writestring
			call    crlf
			pop     edx
			pop		ebp
			
			ret		4
strPut      ENDP

main 		PROC

			push    offset prompt
			call	strPut 
			mov  	edx, offset array
			mov	    ecx, lengthof array
			call	ReadString
			push	edx
			call	strLen
			push    offset lengthCount 
			call	strPut
			call    writedec
			call	crlf
			exit

main 		ENDP

			END 	main