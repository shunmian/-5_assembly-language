;监测点13.1(2) 安装程序
assume cs:code

code segment
start:  mov ax,0
        mov es,ax
        mov di,200h

        mov ax,cs
        mov ds,ax
        mov si,offset repeat
        mov cx, offset repend - offset repeat
        cld
        rep movsb

        mov ax,0
        mov es,ax
        mov word ptr es:[4*7ch],200h
        mov word ptr es:[4*7ch+2],0h

        mov ax,4c00h
        int 21h

repeat: push bp
        mov bp,sp
        add [bp+2],bx
        pop bp
        iret


repend: nop

code ends
end start
