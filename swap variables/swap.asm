INCLUDE Irvine32.inc
.data
var1 BYTE 20 ;declare and initialize to 20
var2 BYTE 30 ;declare and initialize to 30
.code
main PROC
mov al, var1 ;store var1 value in al
mov ah, var2 ;store var2 value in ah
call DumpRegs 	; display the registers
mov dl, 0 ; using dl as temp register
mov dl, al; moving eax contents to edx
mov al, ah; moving ebx contents to eax
mov ah, dl; moving edx content to eax
mov var1, al ; storing value in variable
mov var2, ah ;storing value in variable
call DumpRegs ; display contents of registers
exit
main ENDP
END main

