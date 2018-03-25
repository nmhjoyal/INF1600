.globl matrix_equals_asm

matrix_equals_asm:
        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */

        /* Write your solution here */
        
        mov $1, %eax
        mov 8(%ebp), %ecx
        mov 12(%ebp), %ebx
		mov 16(%ebp), %edx
        cmpb (%ebx), (%edx)
        jnz notEqual
        jmp boucleEquals
        
        boucleEquals:
			incl %ebx
			incl %edx
			cmpb (%ebx), (%edx)
			jnz notEqual
			loop boucleEquals
			
        notEqual:
			mov $0, %eax
        
        leave          /* Restore ebp and esp */
        ret            /* Return to the caller */
