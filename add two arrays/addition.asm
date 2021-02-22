include irvine32.inc
.data
arrayA BYTE 2,3,4,5; array a to store 4 ints
arrayB BYTE 3,4,5,6; array to store 4 ints
arrayC BYTE 4 DUP(?) ;uninitialized array
myString byte "The sums of the arrays are shown in the registers EAX and EBX"


.code

main proc

mov eax,0; empty reg
mov ebx,0 ; empty reg
mov edx, offset myString
mov ecx, 4 ;
mov esi, offset arrayA ;
L1:
add eax, [esi] ;store offset value in eax
inc esi ; increment esi offset
	loop L1

mov ecx, 4 ;
mov esi, offset arrayB ;
L2:
add ebx, [esi] ;store offset value in eax
inc esi ; increment esi offset
	loop L2

call writeString
call dumpregs
exit
main endp
end main
