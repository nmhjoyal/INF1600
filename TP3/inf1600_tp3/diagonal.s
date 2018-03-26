.global matrix_diagonal_asm

matrix_diagonal_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

		/* Write your solution here */
		
		dim: .int 8(%ebp)
		nombre: .int dim*dim
		
		mov dim-1, %ecx
		mov $0, %eax
		mov $0, %ebx
		jmp diagonal
		
		diagonal:
			add (16(%ebp) + (%ebx)), %eax
			inc %ebx
			mov dim-1, %ecx
			cmp %ebx, nombre
			jne zeros
		
		zeros:
			add $0, %eax
			inc %ebx
			loop zeros
		
		
		mov %eax, 12(%ebx)
		
        leave          			/* Restore ebp and esp */
        ret            			/* Return to the caller */

