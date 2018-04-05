.globl _ZNK9CTriangle12PerimeterAsmEv

_ZNK9CTriangle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        mov 8(%ebp), %eax				/* objet dans %eax */
        fld 4(%eax)						/* mSides[0] */
        fld 8(%eax)						/* mSides[1] */
        faddp					
        fld 12(%eax)					/* mSides[2] */
        faddp
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
