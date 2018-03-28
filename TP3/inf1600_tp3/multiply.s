.globl matrix_multiply_asm

matrix_multiply_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        
        mov $0, %ebx			/* ebx = r = 0 */
        mov $0, %ecx 			/* ecx = c = 0 */
        pushl $0				/* -4(ebp) = i */
        pushl $0				/* -8(ebp) = elem */
		pushl $0				/* temp */
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
			mul %bl				/* matorder x r */
			mov -4(%ebp), %edx		/* met i dans edx */
			add %edx, %eax			/* (matorder x r) + i */
			mov 8(%ebp), %edx		/* edx = inmatdata1 */
			mov (%edx, %eax, 4), %edx
			mov %edx, -12(%ebp)			/* met resultat dans temp */
			
			mov 20(%ebp), %ax		/* eax = matorder */
			mov -4(%ebp), %si		/* remet i dans edx */
			mul %si				/* matorder x i */
			add %ecx, %eax			/* (matorder x i) + c */
			mov 12(%ebp), %edx		/* met inmatdata2 dans edx */
			mov (%edx, %eax, 4), %esi		/* met resultats dans edx */
			
			mov -12(%ebp), %eax
			mul %esi
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
			mul %bl					/* matorder x r */
			add %ecx, %eax			/* (matorder x r) + c */
			mov 16(%ebp), %edx		/* edx = outmatdata */
			
			mov %ecx, -12(%ebp)		/* mettre c dans var temp */
			mov -8(%ebp), %ecx		/* outmatdata = elem */
			mov %ecx, (%edx, %eax, 4)
			mov -12(%ebp), %ecx		/* remet c dans ecx */
			
			mov $0, %eax
			mov %eax, -4(%ebp)		/* i = 0 */
			
			mov 20(%ebp), %eax		/* eax = matorder */
			cmp %ecx, %eax			/* matorder - c */
			je for1				/* si c > matorder, sinon continuer (on verifie condition de la boucle) */
			inc %ecx				/* ++c */
			
			mov $0, %eax
			mov %eax, -8(%ebp)				/* -8(ebp) = elem */
			
			jmp for3
			
		end:   
			
			movl $0, -12(%ebp)
			movl $0, -8(%ebp)
			movl $0, -4(%ebp)
			leave          /* restore ebp and esp */
			ret            /* return to the caller */
