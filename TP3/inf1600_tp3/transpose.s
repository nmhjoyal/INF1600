.globl matrix_transpose_asm

matrix_transpose_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        
        mov $0, %ebx			/* ebx = r = 0 */
        mov $0, %ecx			/* ecx = c = 0 */
        jmp for
        
        for:

			mov 16(%ebp), %eax
			mul %cl						/* matorder x c */
			add %ebx, %eax				/* (matorder x c) + r */
			mov 8(%ebp), %edx			/* edx = inmatdata */
			mov (%edx, %eax, 4), %esi	/* met resultats dans edi */
			
			mov 16(%ebp), %eax
			mul %ebx						/* matorder x r */
			add %ecx, %eax				/* (matorder x r) + c */
			mov 12(%ebp), %edx			/* edx = outmatdata */
			mov %esi, (%edx, %eax, 4)	/* met resultats dans edx */
			
			inc %ecx					/* ++c */
			mov 16(%ebp), %eax			/* eax = matorder */
			cmp %ecx, %eax 				/* matorder - c */
			ja for	
			
			inc %ebx
			mov $0, %ecx
			cmp %ebx, %eax
			jz end
			
			jmp for
		
		end:	
			leave          /* restore ebp and esp */
			ret            /* return to the caller */
