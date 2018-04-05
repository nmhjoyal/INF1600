.data
	factor: .float 2.0
	temp: .float 0.0
	perimetre: .float 0.0

.globl _ZNK9CTriangle7AreaAsmEv

_ZNK9CTriangle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        mov 8(%ebp), %eax					/* objet dans eax */
        mov (%eax), %ebx					/* vTable dans %ebx */
        push %eax							/* param = objet pour call */
        call *8(%ebx)						/* appel PerimeterCpp, resultat placé à st[0] */
        fld factor							/* st[0] = 2 */
        fdivrp								/* st[1] (CTriangle::PerimeterCpp) /st[0] (2) */
        fstp perimetre						/* sauvegarde resultat dans perimetre */
        
        fld 4(%eax)							/* mSides[0] */
        fld perimetre						/* mettre perimetre dans st[0] */
        fsubp								/* p - mSides[0] */
        fld perimetre							
        fmulp								/* p * (p-mSides[0])*/
        fstp temp							/* resultat dans temp */
        
        fld 8(%eax)							/* mSides[1] */
        fld perimetre
        fsubrp								/* p - mSides[1] */
        fld temp							/* load résultat cumul. sur pile */
        fmulp								/* résultat * (p - mSides[1]) */							
        fstp temp							/* nouveau resultat dans temp */
        
        fld 12(%eax)						/* mSides[2] */
        fld perimetre
        fsubrp								/* p - mSides[2] */
        fld temp							/* load résultat cumul. */
        fmulp
        fsqrt								/* racine carrée du résultat final */
        
        
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
