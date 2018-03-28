global matrix_multiply_asm

.equ MOutOffset, 16 # OUT -  Deplacement de %ebp pour la matrice de sortie sur la pile
.equ rPM1, %ebx # IN - Pointeur de la matrice 1
.equ rPM2, %ecx # IN - Pointeur de la matrice 2
.equ rMSize, %esi # Largeur de la matrice
.equ rTemp, %edi # valeurs temporaires

.data
    _indRow: .long 0 # Index Ligne
    _indCol: .long 0 # Index Colonne
    _indBuf: .long 0 # Index du buffer pour multiplier les elements
    _element: .long 0 # Valeur du nouvel element
    
matrix_multiply_asm:
    # Prologue
    pushl %ebp
    movl %esp, %ebp

    # Sauvegarder les registres avant de les manipuler
    pushl %ebx
    pushl %esi
    pushl %edi
	
    # ================================================================
    # Initialiser valeurs
    # ================================================================
    # Obtenir la largeur de la matrice carree
    movl 20(%ebp), rMSize
        
    # Sortir de la fonction si le nombre de cellules est egal a zero
    test rMSize, rMSize
    jz end
        
    # Initialiser les pointeurs vers les matrices
    movl 8(%ebp), rPM1 # Pointeur vers la premiere IN matrice
    movl 12(%ebp), rPM2 # Pointeur vers la deuxieme IN matrice
    # ================================================================
        
    jmp LRow

LRow:
    cmpl _indRow, rMSize # Si l'Index de ligne < largeur de matrice, Commencer la boucle pour colonnes
    ja LCol
    
    jmp end

LCol:
    cmpl _indCol, rMSize
    ja LBuf
    
    movl $0, _indCol	# Remettre l'Index de colonne a zero pour permettre de recommencer une boucle si necessaire
    incl _indRow        # Incrementer l'Index de lignes
    jmp LRow
    
LBuf:
    # Chercher l'element de la premiere matrice a la position (indBuffer + indRow * mSize)
    movl _indRow, %eax
    mull rMSize 
    addl _indBuf, %eax
    movl (rPM1, %eax, 4), rTemp # Sauvegarder la valeur de la premiere matrice
    
    # Chercher l'element de la deuxieme matrice a la position (indCol + indBuf * mSize)
    movl _indBuf, %eax
    mull rMSize
    addl _indCol, %eax
    movl (rPM2, %eax, 4), %eax
    
    # Multiplier les deux elements et additionner le resultat a la valeur du nouvel element
    mull rTemp
    addl %eax, _element
    
    # Boucler tant que l'Index du buffer est plus petit que la largeur de la matrice
    incl _indBuf
    cmpl _indBuf, rMSize
    ja LBuf
    
    # =================================================================
    # Stocker l'element dans la matrice de sortie
    # =================================================================
    # Chercher la position dans la matrice de sortie pour stocker l'element (indCol + indRow * size)
    movl _indRow, %eax
    mull rMSize
    addl _indCol, %eax
    
    # Chercher l'adresse de la matrice de sortie
    movl MOutOffset(%ebp), rTemp
    lea (rTemp, %eax, 4), rTemp
    
    # Stocker l'element dans la matrice de sortie
    movl _element, %eax
    movl %eax, (rTemp)
    # =================================================================
    
    movl $0, _element # Reinitialiser la valeur temporaire
    movl $0, _indBuf # Remettre l'Index de buffer a zero
    incl _indCol # Incrementer l'Index de colonnes
    jmp LCol
    
end:
    popl %edi
    popl %esi
    popl %ebx
        
    leave          /* Restore ebp and esp */
    ret
