include irvine32.inc
.data
a byte ?
b byte ?
result byte 0;
prompt byte "Enter the numbbers to be multiplied: ",0

.code
main proc
mov edx, offset prompt;
call writestring;
call crlf
call readint
mov a,al;
call readint
mov b,al;
mov bl,a
mov dl,result
movzx ecx, b

loopty:
test b,01b
je inf
inf:
	add dl,bl
shl a,1
shr b,1	
loop loopty

mov al,dl
call writedec
exit
main endp
end main
