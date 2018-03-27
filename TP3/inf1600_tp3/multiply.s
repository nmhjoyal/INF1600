.globl matrix_multiply_asm

matrix_multiply_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        
        mov $0, %eax			// eax = r = 0
        mov $0, %ebx			// ebx = c = 0
        mov $0, %ecx			// ecx = i = 0
        mov 16(%ebp), %edx		// edx = matorder
        jmp for1
        
        for1:
			cmp %eax, %edx			// matorder - r
			jna end					// si r > matorder, sinon continuer (on verifie condition de la boucle)
			add $1, %eax			// ++r
			jmp for2
			
        
        for2:
			cmp %ebx, %edx			// matorder - c
			jna for1				// si c > matorder, sinon continuer (on verifie condition de la boucle)
			add $1, %ebx			// ++c
			mov $0, %edi			// edi = elem = 0
			jmp for3	
			
		for3:
			cmp %ecx, %edx 					// matorder - i
			jna for2						// si c > matorder, sinon continuer (on verifie condition de la boucle)
			add $1, %ecx					// ++i
			sbl $8, %esp					// on fait de la place sur la pile pour 2 resultats
			
			mov 8(%ebp), %esi				// esi = inmatdata1
			flds %esi[%ecx(%eax,,%edx)]		// met au dessus de la pile  inmatdata1[i + r * matorder]
			push %esp						// esp pointe sur le resultat (ebp - 8)
			
			mov 12(%ebp), %esi				// esi = inmatdata2
			lds %esi[%ebx(%ecx,,%edx)]		// met au dessus de la pile inmatdata2[c + i * matorder]
			push %esp						// esp pointe sur le resultat (ebp - 12)
			
			add (-8(%ebp), ,-12(%ebp)), %edi			//  elem = resultat 1 * resultat 2
			
			subl $8, %esp 			// on remet le pointeur au debut et ainsi delete les anciens resultats
			
			lds %ebx(%eax,,%edx)		// met au dessus de la pile c + r * matorder
			push %esp						// esp pointe sur le resultat (ebp - 8)
			mov  %edi, 16(%ebp)[%ebx(%eax,,%edx)			// outmatdata[c + r * matorder] = elem
			
					
			jmp for2	
			
		end:      
			leave          /* restore ebp and esp */
			ret            /* return to the caller */
