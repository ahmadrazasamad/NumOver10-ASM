                         ;this program supports printing numbers upto 9999

org 100h

.model small
.stack 100h
.data

    number dw 6104          ;this is a random four-digit number (can place any number here even 1, 2, or 3 digit number too)
    message db "The number is: $"
    invalidNumberMessage db "Invalid number entered in the number variable. It is greater than 9999!$"
    tempNumberHolder dw ?

.code

    Main proc
        mov ax, @data       ;copy address of data segment into ax
        mov ds, ax          ;initializes ds to point to the begining of the data segment
        
        ;digits seperation and printing starts here
        mov ax, number
        mov [tempNumberHolder], ax
        
        cmp ax, 9999
        jg invalidNumberMessagePrint
        
        lea dx, message
        mov ah, 09h
        int 21h
        
        mov ax, number
        
        cmp ax, 10
        jl seperateOneDigit
        cmp ax, 100
        jl seperateTenDigit
        cmp ax, 1000
        jl seperateHundredDigit
        
        seperateThousandDigit:
            mov dx, 0h              ;clearing dx, preparing dx for 32-bit division
            mov bx, 1000
            div bx
            mov [number], dx
            mov dx, 0h              ;clearing dx
            mov dl, al
            call printDigit
            
            seperateHundredDigit:
                mov ax, number
                mov bx, 100
                div bl
                mov dx, 0h          ;clearing dx
                mov dl, al
                mov al, ah
                mov ah, 0h          ;clearing ah
                mov [number], ax
                call printDigit
                
                seperateTenDigit:
                    mov ax, number
                    mov bx, 10
                    div bl
                    mov dx, 0h          ;clearing dx
                    mov dl, al
                    mov al, ah
                    mov ah, 0h          ;clearing ah
                    mov [number], ax
                    call printDigit
                    
                    seperateOneDigit:
                        mov ax, number
                        mov dl, al
                        call printDigit     
        
        mov ax, tempNumberHolder
        mov [number], ax
        jmp endProgram
        
        invalidNumberMessagePrint:
            lea dx, invalidNumberMessage
            mov ah, 09h
            int 21h
                
        endProgram:
            mov ah, 4ch
            int 21h           
    Main endp
    
    printDigit proc
        add dl, 30h
        mov ah, 02h
        int 21h
        
        ret                 ;return to the caller
    printDigit endp

end main