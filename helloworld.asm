;Write a simple hello world program in x86 assembly without the C library.


section .text				

			
    global _start	
			

_start:

;write our string to stdout

        mov     edx,len 
        mov     ecx,msg 
        mov     ebx,1   
        mov     eax,4   
        int     0x80	

;and exit

	mov	ebx,0	
        mov     eax,1   
        int     0x80	

section .data				

msg     db      "Hello, world!",0xa	
len     equ     $ - msg                 

