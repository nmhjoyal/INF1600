.globl matrix_row_aver_asm

matrix_row_aver_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

		/* Write your solution here */
		
        movl $0, %ebx			/* ebx = r = 0 */
        movl $0, %ecx			/* ecx = c = 0 */
        push $0	 				/* elem -4(%ebp)*/
        jmp for2
        
        for2:
			mov 16(%ebp), %eax		/* eax = matorder */
			mul %ebx				/* matorder x r */
			add %ecx, %eax			/* (matorder x r) + c */
			mov 8(%ebp), %edx		/* edx = inmatdata */
			mov (%edx, %eax, 4), %edx 		/* met resultats dans edx */
			mov -4(%ebp), %eax		/* met elem dans eax*/
			add %edx, %eax			/* elem += ... */
			mov %eax, -4(%ebx)		/* rep dans elem */
			
			inc %ecx					/* ++c */
			mov 16(%ebp), %eax 		/* eax = matorder */
			cmp %ecx, %eax 				/* matorder - c */
			ja for1				/* si c > matorder, sinon continuer (on verifie condition de la boucle) */

			jmp for2
			
		for1:
			
			mov 16(%ebp), %edi		/* edx = matorder */
			mov -4(%ebp), %eax			/* elem = eax */
			div %edi				/* elem/matorder */
			mov 12(%ebp), %edx		/* edx = outmatdata */
			mov %eax, (%edx, %ebx, 4) 		/*met resultat dans outmatdata[r]*/

			mov 16(%ebp), %eax		/* eax = matorder */
			cmp %ebx, %eax			/* matorder - r */
			ja end					/* si r > matorder, sinon continuer (on verifie condition de la boucle) */
			inc %ebx				/* ++r */
			mov $0, %ecx			/* c = 0 */
			mov %ecx, -4(%ebp)			/* edi = elem = 0 */
			jmp for2
		
		end:
			leave          			/* Restore ebp and esp */
			ret           			/* Return to the caller */
			
