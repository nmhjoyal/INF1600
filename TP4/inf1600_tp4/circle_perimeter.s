.data
        factor: .float 2.0 /* use this to multiply by two */

.text
.globl _ZNK7CCircle12PerimeterAsmEv

_ZNK7CCircle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */

        /* Write your solution here */
        
        mov 8(%ebp), %eax		/* objet dans %eax */	
        fld 4(%eax)				/* objet + 4 (mRadius) sur pile */
        fldpi					/* pi sur pile */
        fmulp					/* pi * mRadius */
        fld factor				/* factor (2) sur pile */
        fmulp					/* 2*(pi*mRadius) */
        
        /* on garde le resultat sur pile (st[0]) pour pouvoir retourner un float */
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
