;Write a simple program that receives the age of a person as input and
;outputs whether the person is eligible for voting or not.

section .data
instr1   db     'Enter your age: ',0
instr2	 db	'Enter voting age limit: ',0

instring db     '%d',0
	msg2 db 'Eligible for voting',10,0
	lmsg2 equ $-msg2
	msg3 db 'Not eligible for voting',10,0
	lmsg3 equ $-msg3
	nlinea db 10,10,0
    	lnlinea equ $-nlinea

section .bss

in1	resd	1
in2	resd	1
section .text
    global main                       

main:  
                               
extern	printf
extern  scanf
;; put your code here

getinput:


	push	instr1
	call	printf
	add	esp, 4

	push	in1
	push	instring
	call	scanf
	add	esp, 8

getinput2:
	push	instr2
	call	printf
	add	esp,4
	push	in2
	push	instring
	call	scanf
	add	esp, 8

	mov	eax, [in1]
	mov	ebx, [in2]
	
	cmp 	eax, ebx
	jle 	fail


succ:

	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, lmsg2
	int 80h
	JMP exit

fail:

	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, lmsg3
	int 80h
	
exit:
	mov     ebx,0   
        mov     eax,1   
        int     0x80    
	
