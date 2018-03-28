
.globl matrix_transpose_asm

matrix_transpose_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */

        
        mov $0, %ebx
        mov $0, %ecx /* fixe i et j (colonne et ligne)*/
        
        
        boucle:
					
					
					mov 16(%ebp), %eax					
					mul %cl /* j*matorder */
					add %ebx, %eax /* i + matorder*j */
					mov 8(%ebp), %edx
					mov (%edx, %eax, 4), %esi /* on stocke la valeur à l'adresse [i,j] */
					mov 16(%ebp), %eax
					mul %ebx
					add %ecx, %eax /* matorder*i+j */
					mov 12(%ebp), %edx
					mov %esi, (%edx, %eax, 4) /*on stocke dans le nouvelle matrice à l'addresse [j,i] */
					
					
					inc %ebx
					cmp 16(%ebp), %ebx
					jb boucle /* si i != matorder refait la boucle avec i= i+1 */
					mov $0, %ebx /* si i = matorder, revient au début de la ligne, donc : j = j+1, i = 0 */
					inc %ecx
					cmp 16(%ebp), %ecx
					jb boucle /*si j = matorder, la transposé est fini */
					
					
        
        
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
