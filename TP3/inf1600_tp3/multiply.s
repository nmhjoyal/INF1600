.globl matrix_multiply_asm

matrix_multiply_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        
        mov $0, %ebx			/* ebx = r = 0 */
        mov $0, %ecx 			/* ecx = c = 0 */
        push $0				/* -4(ebp) = i */
        push $0				/* -8(ebp) = elem */
        jmp for3
        
        for1:
			mov 20(%ebp), %eax		/* eax = matorder */
			cmp %ebx, %eax			/* matorder - r */
			jz end					/* si r > matorder, sinon continuer (on verifie condition de la boucle) */
			inc %ebx				/* ++r */
			mov $0, %ecx 			/* c = 0 */
			jmp for3	
			
		for3:
			mov 20(%ebp), %eax		/* eax = matorder */	
			mul %ebx				/* matorder x r */
			mov -4(%ebp), %edx		/* met i dans edx */
			add %edx, %eax			/* (matorder x r) + i */
			mov 8(%ebp), %edx		/* edx = inmatdata1 */
			mov (%edx, %eax, 4), %edx
			mov %edx, %esi			/* met resultats dans esi */
			
			mov 20(%ebp), %eax		/* eax = matorder */
			mov -4(%ebp), %edx		/* remet i dans edx */
			mul %edx				/* matorder x i */
			add %ecx, %eax			/* (matorder x i) + c */
			mov 12(%ebp), %edx		/* met inmatdata2 dans edx */
			mov (%edx, %eax, 4), %edx		/* met resultats dans eax */
			
			mov %esi, %eax
			mul %edx
			mov -8(%ebp), %edx
			add %edx, %eax
			mov %eax, -8(%ebp)			/* elem += ... */
			
			
			mov -4(%ebp), %edx		/* met i dans edx */
			inc %edx					/* ++i */
			mov %edx, -4(%ebp)
			
			mov 20(%ebp), %eax		/* eax = matorder */
			cmp %edx, %eax 					/* matorder + i */
			jna for2						/* si i > matorder, sinon continuer (on verifie condition de la boucle) */
			
			jmp for3
			
		for2:
			mov 20(%ebp), %eax		/* matorder dans eax*/
			mul %ebx				/* matorder x r */
			add %ecx, %eax			/* (matorder x r) + c */
			mov 16(%ebp), %edx		/* edx = outmatdata */
			mov -8(%ebp), %esi		/* outmatdata = elem */
			mov %esi, (%edx, %eax, 4)
			
			mov $0, %eax
			mov %eax, -4(%ebp)		/* i = 0 */
			
			mov 20(%ebp), %eax		/* eax = matorder */
			cmp %ecx, %eax			/* matorder - c */
			jna for1				/* si c > matorder, sinon continuer (on verifie condition de la boucle) */
			inc %ecx				/* ++c */
			
			mov $0, %eax
			mov %eax, -8(%ebp)				/* -8(ebp) = elem */
			
			jmp for3
			
		end: 	 #epilogue    
		
			leave          /* restore ebp and esp */
			ret            /* return to the caller */
