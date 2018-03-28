.globl matrix_multiply_asm

matrix_multiply_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* fixe i et j (colonne et ligne)*/
        pushl $0	/* -4(%ebp) ou est stocké une valeur temp */
        pushl $0    /* -8(%ebp) ou est stocké j */    
        pushl $0	/* -12(%ebp) utilisé pour stocké une valeur temp */			
		mov $0, %ebx	/* i*/
		mov $0, %ecx	/* j*/
				
				
		boucle:
				mov $0, %edi /* compteur r pour parcourir ligne et colonne lors multiplication*/
				
				
		boucle2: /*parcourue à chaque multiplication */
				/* pour la première matrice */
				mov 20(%ebp), %eax	
				mov -8(%ebp), %ecx	/* load j */		
				mul %ecx 		/* j*matorder */
				add %edi, %eax /* i +r + matorder*j = adresse dans la matrice */
				mov 8(%ebp), %ecx /*adresse du début de la matrice */
				mov (%ecx, %eax, 4), %eax
				mov %eax, -12(%ebp) 	/* on stocke la valeur de l'adresse [i,j] */
				
				
				/*pour la deuxième matrice */
				mov 20(%ebp), %eax	
				mul %edi /* (j+r)*matorder */
				add %ebx, %eax /* i + matorder*(j+r) */
				mov 12(%ebp), %ecx /*adresse de début de la deuxième matrice */
				mov (%ecx, %eax, 4), %eax /* on stocke la valeur de l'adresse [i,j] */
				
				mov -12(%ebp), %esi
				imul %esi, %eax /* 1iere matrice[i+r,j] * 2iemematrice[i,j+r] */
				mov -4(%ebp), %ecx
				add %ecx, %eax	/* additionne le nombre déja stokée avec la nouvelle multiplication */
				mov %eax, -4(%ebp) /* enregistre la multiplication sur la pile */
				
				inc %edi
				cmp 20(%ebp), %edi
				jb boucle2 /* si r<matorder, on recommence avec r=r+1 */
				
				
				/* trouve l'adresse de la matrice de sortie */
				mov 20(%ebp), %eax	
				mov -8(%ebp), %ecx /*on remet j dans ecx */
				mul %ecx /* j * matorder */ 
				add %ebx, %eax /* i + matorder*j */
				movl 16(%ebp), %ecx	/* adresse de début de la matrice de sortie */
				
				mov -4(%ebp), %esi /* le résultat des multiplication */
				mov %esi,(%ecx,%eax,4) /* enregistre dans la matrice de sortie */ 
				movl $0, -4(%ebp) /* remet à zéro */
               
				inc %ebx
				cmp 20(%ebp), %ebx
				jb boucle  /* si i != matorder refait la boucle avec i= i+1 */
				
				mov $0, %ebx /* si i = matorder, revient au début de la ligne, donc : j = j+1, i = 0 */
				mov -8(%ebp), %ecx
				inc %ecx
				mov %ecx, -8(%ebp)
				cmp 20(%ebp), %ecx
				jb boucle  /*si j = matorder, la transposé est fini */
				
				movl $0,-12(%ebp)
				movl $0, -8(%ebp)
				movl $0, -4(%ebp)
				mov %ebp, %esp
				
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
