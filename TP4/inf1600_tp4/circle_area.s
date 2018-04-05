.globl _ZNK7CCircle7AreaAsmEv

_ZNK7CCircle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        mov 8(%ebp), %eax		/* objet C dans %eax */	
        fld 4(%eax)
        fld 4(%eax)				/* st[0] et st[1] contiennent mRadius */
        fmulp					/* mRadius ^2 */
        fldpi
        fmulp					/* (mRadius^2) * pi */
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
