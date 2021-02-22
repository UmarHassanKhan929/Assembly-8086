Include irvine32.inc

.data
prompta byte "Enter integer 1: ",0 ;for 1
promptb byte "Enter integer 2: ",0 ;for 2
promptc byte "Smaller value is: ",0
smaller word ? ; to show answer

.code
main proc
mov edx, offset prompta ; 
call writestring ;
call readint ; 
mov ebx, eax;
call crlf
mov edx, offset promptb;
call writestring ;
call readint ;

cmp ax,bx;
ja firstisless;
mov smaller,ax;
jmp conclusion

firstisless:
	mov smaller,bx;

conclusion:
	call crlf;
	mov ax,smaller;
	mov edx, offset promptc;
	call writestring;
	call writedec;

exit
main endp
end main
