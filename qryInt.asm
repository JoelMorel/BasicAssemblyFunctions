TITLE Echo Name; proc that prompts user to enter an interger
			   ; and echos it back to screen. Using the stack.

; Author: Joel Morel
; Date: 9 / 30 / 2014

Include Irvine32.inc

.data

prompt		byte 	"Enter an interger: ", 0
userNumber  byte	"Your number is: ",0

.code

qryInt		PROC
			push    ebp
			mov     ebp,esp
			push	edx
			push	offset prompt
			call	strPut
			call	ReadInt
			pop     edx
			pop     ebp
			ret     
qryInt		ENDP


strPut      PROC

			push    ebp
			mov     ebp, esp
			push	edx
			mov     edx, [ebp + 8]
			call 	writestring
			call    crlf
			pop     edx
			pop		ebp
			ret		4
strPut      ENDP

main 		PROC
			
			call	qryInt
			mov		edx, offset userNumber
			push	edx
			call	strPut
			call	WriteInt
			call	crlf

			exit
main 		ENDP

			END 	main