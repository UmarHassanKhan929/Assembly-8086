include Irvine32.inc
maxBuffSize=100

.data
    prompt byte "Enter the plain text: ",0
    promptKey byte "Enter the key for encryption: ",0
    encryptionPrompt byte "Encrypted text: ",0
    decryptedPrompt byte  "Decrypted text: ",0
    
    string byte maxBuffSize+1 DUP(?)
    key byte maxBuffSize+1 DUP(?)
    stringSize dword ?
    keySize dword ?
.code
    main proc
        ; for user input of string
        mov edx, offset prompt
        call writestring
        mov ecx, maxBuffSize;
        mov edx, offset string;
        call readstring
        mov stringSize,eax
        call crlf 
        
        ; for encryption key input
        mov edx, offset promptKey
        call writestring
        mov ecx, maxBuffSize;
        mov edx, offset key;
        call readstring
        sub eax,1
        mov keySize,eax
        call crlf       
        
        ;for encryption
        call TranslationCipher 
        ;printing stuff
        mov edx,offset encryptionPrompt
        call writestring
        mov edx, offset string
        call writestring
        call crlf
        call crlf
        
        ;for decrytion
        call TranslationCipher
        ;printing stuff
        mov edx,offset decryptedPrompt
        call writestring
        mov edx, offset string
        call writestring
        call crlf
        call crlf
        
        exit
    main endp

TranslationCipher proc
    pushad
    mov ecx,stringSize
    mov esi,0 
    mov edi,0
    L1:
    ;xor each element of character with key character
        mov bl,key[edi]
        xor string[esi],bl 
        inc esi 
        inc edi
        cmp edi,keySize
        je reset
        jmp skip
        
        reset:
            mov edi,0
        
        skip:
        
    loop L1
    
    popad
    ret
TranslationCipher endp

END main
