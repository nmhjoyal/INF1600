.globl matrix_equals_asm

matrix_equals_asm:
        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */

        /* Write your solution here */
        
        mov 16(%ebp), %eax			/* compteur loop */
		mull %eax
		mov %eax, %ecx
		mov $0, %edx				/* compteur matrice */
        jmp boucle
			
		boucle:
			mov 8(%ebp), %eax			/* inmatdata1 */
			mov (%eax, %edx, 4), %ebx 	/* [i,j] de la premiere matrice */
			
			mov 12(%ebp), %eax			/* inmatdata2 */
			mov (%eax, %edx, 4), %esi
			
			cmp %ebx, %esi				/* cmp inmatdata1 et inmatdata2 */
			jnz notEqual				/* si mat1 != mat2 jmp notEqual */
			
			inc %edx					/* sinon, compteur matrice */
			cmp %edx, %ecx
			jnz boucle
			
			mov $1, %eax
			jmp fin		
			
			
        notEqual:
			mov $0, %eax
			jmp fin
		
			
		fin:
			leave          /* Restore ebp and esp */
			ret            /* Return to the caller */
