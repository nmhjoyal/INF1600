.globl matrix_transpose_asm

matrix_transpose_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        
        mov $0, %eax			// eax = r = 0
        mov $0, %ebx			// ebx = c = 0
        mov 16(%ebp), %ecx		// ecx = matorder
        jmp for1
        
        for1:
			cmp %eax, %ecx			// matorder - r
			jna dim				// si r > matorder, sinon continuer (on verifie condition de la boucle)
			add $1, %eax			// ++r
			jmp for2
			
        
        for2:
			cmp %ebx, %ecx 			// matorder - c
			jna for1				// si c > matorder, sinon continuer (on verifie condition de la boucle)
			add $1, %ebx			// ++c
			mov %eax(%ebx,,%ecx), %ecx		//edx = c + r * matorder
			mov 8(%edx), %esi		// esi = inmatdata
			mov 12(%ebp), %edi		// edi = outmatdata
			mov %eax[%edx], %ecx[%edx]	// outmatdata[%edx] = inmatdata[%edx]
			jmp for1	
			
              
        dim: .int 8(%ebp)
    
        mov $0, %edx
        mov $0, %ebx
        mov dim-1, %ecx
        jmp incre
        
        incre:
			jmp remplirTranspose
			inc %ebx
			cmp dim, %ebx
			jne init
        
        remplirTranspose:
			add (16(%ebp) + (%edx)), %eax
			add dim, %edx
			loop remplirTranspose
			
		init:
			mov dim-1, %ecx
			mov (%ebx), %edx
			jmp incre
			
		mov %eax, 12(%ebp)
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
