;Write a program that performs conversion between Celsius scale and

instrman db 	'Enter choice 1(celcius->fahrenheit) 2(fahrenheit->celcius): ',0
instr1   db     'Enter value in celcius: ',0
instr2	 db	'Enter value in fahrenheit: ',0
instring db     '%d',0
mystring db	10, 'Value in Fahrenheit is %d', 10, 0
mystring2 db	10, 'Value in Celcius is %d', 10, 0
mystring3 db 	10, 'Value in Celcius is -%d',10,0



section .bss

in1	resd	1
result  resd	1
opt 	resd 	1

section .text
    global main                       

main:  
                               
extern	printf
extern  scanf
;; put your code here

getinput:


	push	instrman  ;print 1st message
	call	printf
	add	esp,4

	push	opt
	push	instring
	call	scanf
	add	esp, 8
	
	
	mov ah, [opt]
	cmp ah, 1d
	jz c2f

	mov ah, [opt]
	cmp ah, 2d
	jz f2c
	jmp exit

c2f:

	push	instr1
	call	printf
	add	esp, 4

	push	in1
	push	instring
	call	scanf
	add	esp, 8

	xor	eax, eax
	mov	eax, [in1]
	xor 	ecx, ecx
	mov	ecx, eax
	add	eax, ecx
	xor 	ebx, ebx
	mov	ebx, 32d
	add	eax, ebx
	
	jmp	succ
	

f2c:

	push	instr2
	call	printf
	add	esp, 4

	push	in1
	push	instring
	call	scanf
	add	esp, 8

	xor 	edx, edx	
	xor 	ebx, ebx
	mov	eax, [in1]
	cmp	eax, 32d
	jl	f2c1

	mov	eax, [in1]
	cmp	eax, 32d
	jge	f2c2

succ:
 
	push eax
	push mystring
	call printf
	add esp, 8
	jmp exit
	

succ1:

	push eax
	push mystring2
	call printf
	add esp, 8
	jmp exit

f2c1:

	xor ebx, ebx
	mov ebx, [in1]
	mov eax, 32d
	sub eax, ebx
	xor edx, edx
	xor ebx, ebx
	mov ebx, 2d
	idiv ebx

	push eax
	push mystring3
	call printf
	add esp, 8
	jmp exit

f2c2:

	mov eax, [in1]
	sub eax, 32d
	xor edx, edx
	xor ebx, ebx
	mov ebx, 2d
	idiv ebx

	push eax
	push mystring2
	call printf
	add esp, 8
	

	
exit:
	mov     ebx,0   
        mov     eax,1   
        int     0x80    
	
