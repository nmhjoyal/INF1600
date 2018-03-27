.global matrix_diagonal_asm

matrix_diagonal_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

		/* Write your solution here */
		
		mov $0, %ebx /* i */
		mov $0, %ecx  /* j */
  
        jmp boucleColonnes
        
        boucleLignes:
			inc %ebx					/* i++ */
			cmp %ebx, %eax				/* i < matorder? */
			jl boucleColonnes			/* si oui, parcours colonnes */
			jmp fin
			
		boucleColonnes:	
		
			mov 16(%ebp), %eax			/* matorder dans eax */
			mul %ebx					/* matorder x i */
			add %ecx, %eax				/* (matorder x i) + j */
			
			cmp %ecx, %ebx
			jz diagonal
			
			mov 12(%ebp), %edx			/* outmatdata dans edx */
			mov $0, (%edx, %eax, 4)		/* mettre 0 a position [i,j] de edx */
			mov %edx, 12(%ebp)			/* mettre a jour param out */
			
			inc %ecx					/* sinon, j++ */
			mov 16(%ebp), %eax			
			cmp %ecx, %eax				/* j < matorder ? */
			jl boucleColonnes
			mov $0, %ecx				/* reinit j */			
			jmp boucleLignes
		
		diagonal:
			mov 8(%ebp), %edx			/* inmatdata dans edx */
			mov (%edx, %eax, 4), %edi	/* inmatdata[i,j] dans edi */
			mov 12(%ebp), %edx			/* outmatdata dans edx */
			mov %edi, (%edx, %eax, 4)	/* %edi dans outmatdata[i,j] */
			
			mov %edx, 12(%ebp)			/* mettre a jour param out */
			
			inc %ecx						
			jmp boucleColonnes
			
		
		fin:	
			leave          			/* Restore ebp and esp */
			ret            			/* Return to the caller */
