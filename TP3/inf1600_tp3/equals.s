.globl matrix_equals_asm

matrix_equals_asm:
        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */

        /* Write your solution here */
        
        mov $0, %ebx /* i */
		mov $0, %ecx  /* j */
  
        jmp boucleColonnes
        
        boucleLignes:
			incl %ebx					/* i++ */
			cmp %ebx, %eax				/* i < matorder? */
			jl boucleColonnes			/* si oui, parcours colonnes */
			mov $1, %eax				/* sinon, ret = 1, fin */
			jmp fin
			
		boucleColonnes:
			mov 8(%ebp), %edx			/* inmatdata1 */
			mov 16(%ebp), %eax			/* matorder */
			mul %ebx					/* matorder x i */
			add %ecx, %eax				/* (matorder x i) + j */
			mov (%edx, %eax, 4), %edi 	/* [i,j] de la premiere matrice */
			
			
			mov 12(%ebp), %edx			/* inmatdata2 */
			mov (%edx, %eax, 4), %eax
			
			cmp %eax, %edi				/* cmp inmatdata1 et inmatdata2 */
			jnz notEqual				/* si mat1 != mat2 jmp notEqual */
			
			incl %ecx					/* sinon, j++ */
			mov 16(%ebp), %eax			
			cmp %ecx, %eax				/* j < matorder ? */
			jl boucleColonnes
			mov $0, %ecx				/* reinit j */			
			jmp boucleLignes			
			
        notEqual:
			mov $0, %eax
			jmp fin
        
        fin:
			leave          /* Restore ebp and esp */
			ret            /* Return to the caller */
