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
        mov $2, %edx						/* 2e él de la vtable */
        mov (%eax, %edx, 4), %eax 			/* 0*objet (vtable) + 2*4(ret float) = CTriangle::PerimeterCpp dans eax */
        call *(%eax)						/* resultat placé à st[0] */
        fld factor							/* st[0] = 2 */
        fdivrp								/* st[1] (CTriangle::PerimeterCpp) /st[0] (2) */
        fstp perimetre						/* sauvegarde p dans ecx */
        mov 8(%ebp), %eax					/* obj dans %eax */
        fld 4(%eax)							/* mSides[0] */
        fld perimetre						/* mettre p dans st[0] */
        fsubp								/* p - mSides[0] */
        fld perimetre							
        fmulp								/* p * (p-mSides[0])*/
        fstp temp
        
        mov 8(%ebp), %eax					/* obj dans %eax */
        mov $1, %edx
        fld 4(%eax, %edx, 4)				/* mSides[1] */
        fld perimetre
        fsubrp								/* p - mSides[1] */
        fld temp							/* load résultat dans st[0] */
        fmulp								/* résultat * (p - mSides[1]) */							
        fstp temp
        
        mov 8(%ebp), %eax					/* obj dans %eax */
        mov $2, %edx
        fld 4(%eax, %edx, 4)				/* mSides[2] */
        fld perimetre
        fsubrp								/* p - mSides[2] */
        fld temp							/* load résultat cumul. */
        fmulp
        fsqrt								/* racine carrée du résultat final */
        
        
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
