.global matrix_row_aver_asm

matrix_row_aver_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

		/* Write your solution here */
		
        mov $0, %ebx			/* ebx = r = 0 */
        mov $0, %ecx			/* ecx = c = 0 */
        jmp for1
        
        for1:
            mov 16(%ebp), %eax		/* eax = matorder */
			cmp %ebx, %eax			/* matorder - r */
			jna end				/* si r > matorder, sinon continuer (on verifie condition de la boucle) */
			add $1, %ebx			/* ++r */
			mov $0, edi 			/* edi = elem = 0 */
			jmp for2
			
        
        for2:
			mov 16(%ebp), %eax		/* eax = matorder */
			cmp %ecx, %eax 			/* matorder - c */
			jna equation				/* si c > matorder, sinon continuer (on verifie condition de la boucle) */
			add $1, %ecx			/* ++c */
			
			mul %ebx				/* matorder x r */
			add %ecx, %ebx			/* (matorder x r) + c */
			mov 8(%ebp), %edx		/* edx = inmatdata */
			sbl $4, %esp			/* fait de la place sur la pile*/
			add %edi, (%edx, %ebx, 4)		/* met resultats dans elem */

			jmp for2
			
		equation:
			mov 16(%ebp), %edx		/* edx = matorder */
			mov %edi, %eax			/* elem = ex */
			div %dx					/* elem/matorder */
			sbl $4, %esp
			push %eax				/* resultat sur la pile */
			mov 12(%ebp), %edx		/* edx = outmatdata */
			mov %esp, (%edx, %ebx, 4) 		/*met resultat dans outmatdata[r]*/

			jmp for1
		
		end:
			leave          			/* Restore ebp and esp */
			ret           			/* Return to the caller */
			
