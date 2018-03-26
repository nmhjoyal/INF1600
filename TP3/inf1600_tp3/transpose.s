.globl matrix_transpose_asm

matrix_transpose_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        
        dim: .int 8(%ebp)
    
        mov $0, %edx
        mov $0, %ebx
        mov dim-1, %ecx
        jmp incre
        
        incre:
			jmp remplirTranspose
			inc %ebx
			cmp dim, %ebx
			jne init
        
        remplirTranspose:
			add (16(%ebp) + (%edx)), %eax
			add dim, %edx
			loop remplirTranspose
			
		init:
			mov dim-1, %ecx
			mov (%ebx), %edx
			jmp incre
			
		mov %eax, 12(%ebp)
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
