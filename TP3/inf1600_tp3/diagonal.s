.global matrix_diagonal_asm

matrix_diagonal_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

		/* Write your solution here */
		
		mov $0, %ebx /* r */
		mov $0, %ecx  /* c */
  
        jmp boucleColonnes
        
        boucleLignes:
			inc %ebx					/* r++ */
			cmp %ebx, %eax				/* r < matorder? */
			jl boucleColonnes			/* si oui, parcours colonnes */
			jmp fin
			
		boucleColonnes:	
		
			mov 16(%ebp), %eax			/* matorder dans eax */
			mul %ebx					/* matorder x r */
			add %ecx, %eax				/* (matorder x r) + c */
			
			cmp %ecx, %ebx
			jz diagonal
			
			mov 12(%ebp), %edx			/* outmatdata dans edx */
			mov $0, %edi
			mov %edi, (%edx, %eax, 4)		/* mettre 0 a position [r,c] de edx */
			mov %edx, 12(%ebp)			/* mettre a jour param out */
			
			jmp verif
		
		diagonal:
			mov 8(%ebp), %edx			/* inmatdata dans edx */
			mov (%edx, %eax, 4), %edi	/* inmatdata[i,j] dans edi */
			mov 12(%ebp), %edx			/* outmatdata dans edx */
			mov %edi, (%edx, %eax, 4)	/* %edi dans outmatdata[r,c] */
			
			mov %edx, 12(%ebp)			/* mettre a jour param out */
			
			jmp verif
			
			
		verif:
			inc %ecx
			mov 16(%ebp), %eax
			cmp %ecx, %eax
			jl boucleColonnes				
			mov $0, %ecx				/* reinit c */			
			jmp boucleLignes
			
		
		fin:	
			leave          			/* Restore ebp and esp */
			ret            			/* Return to the caller */
