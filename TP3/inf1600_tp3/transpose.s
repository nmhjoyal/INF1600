.globl matrix_transpose_asm

matrix_transpose_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        
        mov $0, %ebx			/* ebx = r = 0 */
        mov $0, %ecx			/* ecx = c = 0 */
        jmp for1
        
        for1:
            mov 16(%ebp), %eax		/* eax = matorder */
			cmp %ebx, %eax			/* matorder - r */
			jna end				/* si r > matorder, sinon continuer (on verifie condition de la boucle) */
			add $1, %ebx			/* ++r */
			jmp for2
			
        
        for2:
			mov 16(%ebp), %eax		/* eax = matorder */
			cmp %ecx, %eax 			/* matorder - c */
			jna for1				/* si c > matorder, sinon continuer (on verifie condition de la boucle)
			
			mul %ecx				/* matorder x c */
			add %ebx, %eax			/* (matorder x c) + r */
			mov 8(%ebp), %edx		/* edx = inmatdata */
			subl $4, %esp			/* fait de la place sur la pile */
			push (%edx, %eax, 4)		/* met resultats dans edi */
			
			mul %ebx				/* matorder x r */
			add %ecx, %eax			/* (matorder x r) + c */
			mov 12(%ebp), %edx		/* edx = outmatdata */
			mov %esp, (%edx, %eax, 4)		/* met resultats dans edx */
			
			add $1, %ecx			/* ++c */
			jmp for2	
		
		end:	
			leave          /* restore ebp and esp */
			ret            /* return to the caller */
