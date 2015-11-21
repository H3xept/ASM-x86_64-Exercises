.section __DATA,__data
	data: 
		.quad 2,5,7,9,23,45,67,87,100,120,105,200,207,0
.section __TEXT,__text
.globl _main

_main:
	mov $0, %rdi
	leaq data(%rip), %rax
	mov (%rax,%rdi,8), %rax
	mov %rax, %rbx

loop:
	cmp $0, %rax
	je exit
	leaq data(%rip), %rax
	mov (%rax,%rdi,8), %rax
	inc %rdi
	cmp %rbx, %rax #att < lar
	jle loop
	mov %rax, %rbx
	jmp loop

exit:
	mov $0x2000001, %rax
	mov %rbx, %rdi
	syscall
