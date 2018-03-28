.globl matrix_equals_asm

matrix_equals_asm:
        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */
                
        mov 16(%ebp), %eax; 
        mull %eax /*matorder*/
        mov %eax, %ecx /*initialise le compteur*/
        mov $0, %esi   
        
        Boucle:
		
		mov 12(%ebp), %eax
        mov (%eax,%esi,4), %edx /*met l'adresse de la deuxième matrice dans edx*/
        mov 8(%ebp), %eax
        mov (%eax,%esi,4), %ebx /*met l'adresse de la première matrice dans ebx*/
        cmp %ebx, %edx
        jnz non_egual
        inc %esi
        cmp %esi,%ecx
		jnz Boucle /*si nous n'avons pas passé à travers tout les éléments de la matrice, refait la boucle*/
		
		mov $1, %eax
		jmp fin
		
		non_egual: 
		mov $0, %eax
		
		fin:
        
        leave          /* Restore ebp and esp */
        ret            /* Return to the caller */
