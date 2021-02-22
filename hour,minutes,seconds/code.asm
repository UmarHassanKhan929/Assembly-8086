include irvine32.inc
.stack 100h
.data

prompt byte "Enter the seconds : ",0
answerp byte "Answer in hours,min,sec is: ",0
comma byte ":",0
oseconds dword ?
hours dword ?
minutes dword ?
seconds dword ?

.code
main proc
mov edx,offset prompt 
call writestring ;
call readint 
mov oseconds,eax;
mov edx,0
mov eax, oseconds;
mov ebx,3600
div ebx
mov hours,eax
mov oseconds,edx

mov edx,0
mov eax, oseconds;
mov ebx,60
div ebx
mov minutes,eax;
mov seconds,edx;

mov edx, offset answerp;
call writestring;

mov eax, hours;
call writedec
mov edx,offset comma;
call writestring;
mov eax, minutes;
call writedec
mov edx,offset comma;
call writestring;

mov eax, seconds;
call writedec

exit
main endp
end main
