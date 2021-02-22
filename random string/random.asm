include irvine32.inc
;length of string
L=10

.data
prompt byte "Enter how many strings you want: ",0
string byte L DUP(?)
count dword ?

.code
main proc
;displaying promt
    mov edx,offset prompt;
    call writestring;

;reading input
    call readint;
    mov count,eax;

;test function for looping
    mov ecx,count
    whileNZ:
        call generaterandomstring
    loop whileNZ
    
exit
main endp

;procedure for random string generation
generaterandomstring proc
    pushad
    mov edi,0
    mov ecx, lengthof string
    generate:
        mov eax,26 ;setting lower bound for random ascii 
        call randomrange ;for any random  ascii 0 to 26
        add eax,65 ; 65 is the ascii where capital letters start, so 65-90 is range we get
        mov string[edi],al; moving random charcter in string
        inc edi ;incrementing array index
    loop generate
    mov edx, offset string ;moving offset of string
    call writestring ;;displaying generated string
    call crlf
    popad
ret
generaterandomstring endp
end main
