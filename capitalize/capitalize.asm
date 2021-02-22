include Irvine32.inc
.data
string byte 50 dup (?)
prompt byte "ENter string ",0;
.code
main proc
mov edx,offset prompt
call writestring
mov ecx, lengthof string
mov edx, offset string
call readstring
call crlf
mov ecx, lengthof string-1
mov esi, offset string
convert:
mov bl, [esi]
and bl,11011111b
mov al,bl;
call writechar
inc esi
loop convert
exit
main endp
end main
