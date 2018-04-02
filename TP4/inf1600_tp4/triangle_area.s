.globl _ZNK9CTriangle7AreaAsmEv

_ZNK9CTriangle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        mov 8(%ebp), %eax					/* objet dans eax */
        mov $2, %edx						/* 2e él de la vtable */
        lea (%eax, %edx, 4), %eax 			/* 0*objet (vtable) + 2*4(ret float) = CTriangle::PerimeterCpp dans eax */
        call *(%eax)						/* resultat placé à st[0] */
        mov $2, %eax
        fld %eax							/* st[0] = 2 */
        fdivrp								/* st[1] (CTriangle::PerimeterCpp) /st[0] (2) */
        fstp %ecx							/* sauvegarde p dans ecx */
        mov 8(%ebp), %eax					/* obj dans %eax */
        mov $0, %edx
        fld 4(%eax, %edx, 4)				/* mSides[0] */
        fld %ecx							/* mettre p dans st[0] */
        fsubrp								/* p - mSides[0] */
        fld %ecx							
        fmulp								/* p * (p-mSides[0])*/
        fstp %eax
        push %eax
        
        mov 8(%ebp), %eax					/* obj dans %eax */
        mov $1, %edx
        fld 4(%eax, %edx, 4)				/* mSides[1] */
        fld %ecx
        fsubrp								/* p - mSides[1] */
        fld 12(%ebp)						/* load résultat dans st[0] */
        fmulp								/* résultat * (p - mSides[1]) */
        pop %esp							
        fstp %eax
        push %eax							/*remplace 12(%ebp) par nouveau résultat cumulatif */
        
        mov 8(%ebp), %eax					/* obj dans %eax */
        mov $2, %edx
        fld 4(%eax, %edx, 4)				/* mSides[2] */
        fld %ecx
        fsubrp								/* p - mSides[2] */
        fld 12(%ebp)						/* load résultat cumul. */
        fmulp
        fsqrt								/* racine carrée du résultat final */
        pop %esp
        
        
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
