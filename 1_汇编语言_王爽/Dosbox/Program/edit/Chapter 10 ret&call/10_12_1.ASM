assume cs:code,ds:data

data segment
        db 'conversation',0
data ends

code segment
start:  mov ax, data
        mov ds, ax
        mov si,0
        call capital
        mov ax, 4c00h
        int 21h

capital: mov cl,[si]
            mov ch, 00h
         jcxz ok
         and byte ptr [si],11011111b
         inc si
         loop capital
     ok: ret
code ends
end start
