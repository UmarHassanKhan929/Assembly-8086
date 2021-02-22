Include irvine32.inc

.data
prompt byte "Enter your marks: ",0 ;
respond byte "Your grade is: ",0 ;
invalid byte "Invalid marks...",0 ;
gradeA byte 'A',0;
gradeB byte 'B',0;
gradeC byte 'C',0;
gradeD byte 'D',0;
gradeF byte 'F',0;
.code
main proc
mov ebx,0
looptyloop:
mov edx, offset prompt;
call writestring ;
call readint;
call crlf
cmp eax,-1
je terminate

cmp al,100
ja notvalid

cmp al,89
ja printA

cmp al,79
ja printB

cmp al,69
ja printC

cmp al,59
ja printD

cmp al,0
jae printF

cmp al,-2
jb  notvalid

jmp looptyloop

notvalid:
mov edx, offset invalid;
call writestring
call crlf
jmp looptyloop

printA:
mov edx, offset respond;
call writestring
mov edx,offset gradeA
call writestring
call crlf
jmp looptyloop

printB:
mov edx, offset respond;
call writestring
mov edx,offset gradeB
call writestring
call crlf
jmp looptyloop

printC:
mov edx, offset respond;
call writestring
mov edx,offset gradeC
call writestring
call crlf
jmp looptyloop

printD:
mov edx, offset respond;
call writestring
mov edx,offset gradeD
call writestring
call crlf
jmp looptyloop

printF:
mov edx, offset respond;
call writestring
mov edx,offset gradeF
call writestring
call crlf
jmp looptyloop

terminate:

exit
main endp
end main
