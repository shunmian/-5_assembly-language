assume cs:code,ds:data
data segment
        db 'conversation',0
data ends

code segment
start:  mov ax, data
        mov ds, ax
        mov si,0
        mov ax,0b800h
        mov es,ax
        mov di,12*160

     s: mov cl,[si]
        mov ch,00h
        jcxz ok
        mov al,cl
        mov ah,24h
        mov es:[di],ax
        inc si
        add di,2
        jmp near ptr s

    ok: mov ax,4c00h
        int 21h
code ends
end start
