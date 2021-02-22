Include irvine32.inc
.stack 100h
.data
prompt byte "Please type in your first and last name: ",0
outprompt byte "Your name is: ",0
numnamech byte "number of characters in your name are: ",0
 promptR byte "name in reverse order is: ",0
sname byte 50 DUP(?) ;string to store name

.code
Main Proc
mov eax,0
mov ebx,0
mov ecx,0
call CallName;
mov ecx,eax
mov edx, offset promptR
call crlf;
call writestring
mov ebx,ecx;
call ReverseOrder
call printReverse
Exit 
Main endp

; part a
CallName proc
mov edx, offset prompt;
call writestring;
mov ecx, lengthof sname
mov edx,offset sname;
call readstring
mov edx, offset outprompt;
call writestring;
mov edx, offset sname;
call writestring;
call crlf;
mov edx, offset numnamech;
call writestring;
call writedec;
pushad
popad
ret
CallName endp

; part b
ReverseOrder proc
mov esi,0
mov ecx, ebx
L1:
movzx eax,sname[esi];
push eax;
inc esi;
loop L1
mov esi,0
mov ecx, ebx
L2:
pop eax;
mov sname[esi],al;
inc esi;
loop L2
ret
ReverseOrder endp

; part c
printReverse proc
mov edx, offset sname;
call writestring;
ret
printReverse endp

End Main
