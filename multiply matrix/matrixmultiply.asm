Include irvine32.inc
.stack 4096
.data
; holding data stuff
inlabel1 byte "enter values for matrix 1",0 ;string prompt
inlabel2 byte "enter values for matrix 2",0 ;string prompt
label1 byte "Matrix 1",0 ;string label
label2 byte "Matrix 2",0 ;string label
label3 byte "Multiplcation of Both",0 ;string label
matstore1 byte 9 DUP(?) ;array for matrix 1
matstore2 byte 9 DUP(?) ;array for matrix 2
matprod byte 9 DUP(?) ;product storing array
space byte " ",0 ;for spacing
;
; main code
;
.code
Main PROC ;calling main procedure
call Matrix1 ; calling matrix1 procedure
call Matrix2; call matrix2 procedure
call Product; product procedure
call crlf ;
Exit
Main ENDP ;main end
;==============================================================
============
;user input matrix1 values and printing in matrix shape and sto
ring in array
;==============================================================
============
Matrix1 PROC
;print string for matrix 1 input
mov edx, offset inlabel1
call writestring
call crlf
mov ecx,9
mov esi,0
L1: ;user input
call Readint;
mov matstore1[esi],al
add esi, type byte
loop L1
call crlf;
mov edx,offset label1 ;
call writestring
call crlf;
mov esi,0
mov ecx,3
;printing matrix in shape
L2:
mov al,matstore1[esi]
call writedec;
call Spacing;
add esi, type byte
loop L2
;next line
call crlf;
mov ecx,3
L3:
mov al,matstore1[esi]
call writedec;
call Spacing;
add esi, type byte
loop L3
;next line
call crlf;
mov ecx,3
L4:
mov al,matstore1[esi]
call writedec;
call Spacing;
add esi, type byte
loop L4
call crlf
ret
Matrix1 ENDP
;==============================================================
============
;user input matrix2 values and printing in matrix shape and sto
ring in array
;==============================================================
============
Matrix2 PROC
mov esi,0
mov edx, offset inlabel2
call writestring
call crlf;
mov ecx,9
L5: ;user input
call ReadInt;
mov matstore2[esi],al
add esi, type matstore2
loop L5
call crlf;
mov edx,offset label2 ;
call writestring
call crlf
mov esi,0
mov ecx,3
;printing in matrix shape
L6:
mov al,matstore2[esi]
call writedec
call Spacing
add esi, type matstore2
loop L6
call crlf
mov ecx,3
L7:
mov al,matstore2[esi]
call writedec
call Spacing
add esi, type matstore2
loop L7
call crlf
mov ecx,3
L8:
mov al,matstore2[esi]
call writedec
call Spacing
add esi, type matstore2
loop L8
call crlf
ret
Matrix2 ENDP
;====================================;
;matrix multiplecication ;
;====================================;
Product PROC
mov edx,offset label3 ; label print
call writestring
mov esi, 0
mov edi, 0
mov ebx,0
call RCMul ;1r,1c
add edi,type byte
add ebx,type byte
call RCMul ;1r,2c
add edi,type byte
add ebx,type byte
call RCMul ;1r,3c
add esi,3*type byte
mov edi,0
add ebx,type byte
call RCMul ;2r,1c
add edi,type byte
add ebx,type byte
call RCMul ;2r,2c
add edi,type byte
add ebx,type byte
call RCMul ;2r,3c
add esi,3*type byte
mov edi,0
add ebx,type byte
call RCMul ;3r,1c
add edi,type byte
add ebx,type byte
call RCMul ;3r,2c
add edi,type byte
add ebx,type byte
call RCMul ;3r,3c
;printing product matrix shape
call crlf
mov esi,0
mov ecx,3
mp1:
mov al,matprod[esi]
call writedec
call Spacing
add esi, type matprod
loop mp1
call crlf
mov ecx,3
mp2:
mov al,matprod[esi]
call writedec
call Spacing
add esi, type matprod
loop mp2
call crlf
mov ecx,3
mp3:
mov al,matprod[esi]
call writedec
call Spacing
add esi, type matprod
loop mp3
ret
Product ENDP
;====================================;
;row to col multiplecication proc ;
;====================================;
RCMul PROC
pushad
mov eax,0
movzx ecx, matstore2[edi]
l20: ;for column 1st element multiplication
add al,matstore1[esi]
loop l20
add esi, type byte
add edi,3
movzx ecx,matstore2[edi]
l21: ;for column 2nd element multiplication
add al,matstore1[esi]
loop l21
add esi, type byte
add edi,3
movzx ecx,matstore2[edi]
l22: ;for column 3rd element multiplication
add al,matstore1[esi]
loop l22
mov matprod[ebx],al
popad
ret
RCMul ENDP
;=======================
;method for spacing
;=======================
Spacing PROC
pushad
mov edx, offset space
call writestring
popad
ret
Spacing ENDP
End Main