.global matrix_diagonal_asm

matrix_diagonal_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

		
		mov $0, %ebx /* j = 0 */
		mov $0, %ecx /* i = 0 */		
		
		boucle:
				mov 16(%ebp), %eax
				mul %cl
				add %ebx, %eax /* j + matorder*i */
				
				
				cmp %ebx, %ecx
				jz iegalj
				mov $0, %esi
				jmp boucle2
				
				
				
		iegalj:	
				mov 8(%ebp), %edi
				mov (%edi, %eax, 4), %esi /* stocke matrice[i,j] dans %esi */
				
		boucle2:
		
				mov 12(%ebp), %edi
				mov %esi, (%edi, %eax, 4) /* stocke %esi dans matrice2[i,j] */ 
		
				inc %ebx
				cmp 16(%ebp), %ebx
				jb boucle /* si j != matorder refait la boucle avec j= j+1 */
				mov $0, %ebx /* si j = matorder, revient au début de la ligne, donc : i = i+1, j = 0 */
				inc %ecx
				cmp 16(%ebp), %ecx
				jb boucle /* si i = matorder, la transposé est fini */
		
		
        leave          			/* Restore ebp and esp */
        ret            			/* Return to the caller */

