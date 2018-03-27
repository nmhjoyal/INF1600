.globl matrix_multiply_asm

matrix_multiply_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        
        mov $0, %ebx			/* ebx = r = 0 */
        mov $0, %ecx			/* ecx = c = 0 */
        mov $0, %edx			/* edx = i = 0 */
        jmp for1
        
        for1:
			mov 16(%ebp), %eax		/* eax = matorder */
			cmp %ebx, %eax			/* matorder - r */
			jna fin					/* si r > matorder, sinon continuer (on verifie condition de la boucle) */
			add $1, %ebx			/* ++r */
			jmp for2
			
        
        for2:
			mov 16(%ebp), %eax		/* eax = matorder */
			cmp %ecx, %eax			/* matorder - c */
			jna for1				/* si c > matorder, sinon continuer (on verifie condition de la boucle) */
			add $1, %ecx			/* ++c */
			mov $0, %edi			/* edi = elem = 0 */
			jmp for3	
			
		for3:
			mov 16(%ebp), %eax		/* eax = matorder */
			cmp %edx, %eax 					/* matorder + i */
			jna for2						/* si c > matorder, sinon continuer (on verifie condition de la boucle) */
			add $1, %edx					/* ++i */
			
			mul %ebx				/* matorder x r */
			add %edx, %eax			/* (matorder x r) + i */
			subl $8, %esp			/* fait de l'espace sur la pile */
			push 8(%ebp)		/* met sur la pile inmatdata1 */
			push (-4(%ebp), %eax, 4)		/* met resultats sur la pile _-8(ebp) */
			
			mul %edx				/* matorder x i */
			add %ebx, %eax			/* (matorder x r) + i */
			subl $8, %esp			/* fait de l'espace sur la pile */
			push 8(%ebp)		/* met sur la pile inmatdata */
			push (-4(%ebp), %eax, 4)		/* met resultats sur la pile _-16(ebp) */
			
			mov -8(%ebp), %eax
			mul -16(%ebp)
			add %eax, %edi			/* elem += ... */
			
			add $16, %esp 			/* on remet le pointeur au debut et ainsi delete les anciens resultats */			
			jmp for2	
			
		end:      
			leave          /* restore ebp and esp */
			ret            /* return to the caller */
