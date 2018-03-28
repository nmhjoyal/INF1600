.global matrix_row_aver_asm

matrix_row_aver_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

		mov $0, %ebx /* colonne j*/
		mov $0, %ecx /* ligne i */
		pushl $0 /* initialise élement, dans lequel on stocke le résultat des additions */
		
				
		boucle:
				
				mov 16(%ebp), %eax
				mul %ecx /* i * matorder */
				add %ebx, %eax /* j + i*matorder */
				mov 8(%ebp), %edx /* adresse de la matrice d'entrée */
				mov (%edx, %eax, 4), %edx
				mov -4(%ebp), %eax /* load element */
				add %edx, %eax
				mov %eax, -4(%ebp) /* enregistre l'addition */			
		
		
				inc %ebx
				cmp 16(%ebp), %ebx
				jb boucle /* si j != matorder refait la boucle avec j= j+1 */
				
				
				mov -4(%ebp), %eax
				mov 16(%ebp), %ebx
				mov $0, %edx
				div %bx /* element/matorder */
				mov 12(%ebp), %ebx /* adresse de la matrice de sortie */ 
				mov %eax, (%ebx, %ecx, 4) /* on stocke dans la matrice de sortie */
				
				movl $0, -4(%ebp)
				mov $0, %ebx /* si j = matorder, revient au début de la ligne, donc : i = i+1, j = 0 */
				inc %ecx
				cmp 16(%ebp), %ecx
				jb boucle /*si i != matorder, refait la boucle pour i = i+1  */
				
				
				
				
		
        leave          			/* Restore ebp and esp */
        ret           			/* Return to the caller */
		
