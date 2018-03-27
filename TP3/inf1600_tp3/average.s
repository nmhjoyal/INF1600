.global matrix_row_aver_asm

matrix_row_aver_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

		/* Write your solution here */
		s
        mov $0, %eax			// eax = r = 0
        mov $0, %ebx			// ebx = c = 0
        mov 16(%ebp), %ecx		// edx = matorder
        jmp for1
        
        for1:
			cmp %eax, %ecx			// matorder - r
			jna end				// si r > matorder, sinon continuer (on verifie condition de la boucle)
			add $1, %eax			// ++r
			mov $0, edx 			// edx = elem = 0
			jmp for2
			
        
        for2:
			cmp %ebx, %ecx 			// matorder - c
			jna equation				// si c > matorder, sinon continuer (on verifie condition de la boucle)
			add $1, %ebx			// ++c
			
			sbl $4, %esp			// fait de la place pour une reponse
			mov 8(%ebp), %esi		// esi = inmatdata
			lds %esi[%ebx(%eax,,%edx)]		// met au dessus de la pile  inmatdata1[c + r * matorder] 
			add -8(%ebp), %edx				// ajoute la reponse a elem

			jmp equation
			
		equation:
			mov 12(%ebp), %esi 		// esi = outmatdata
			div %cx,%dx				// elem/matorder
			mov %edx,%esi[eax]		// outmatdata[r] = elem/matorder
			jmp for1
		
		end:
			leave          			/* Restore ebp and esp */
			ret           			/* Return to the caller */
			
