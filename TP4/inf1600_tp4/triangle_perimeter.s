.globl _ZNK9CTriangle12PerimeterAsmEv

_ZNK9CTriangle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        mov 8(%ebp), %eax
        fld (%eax,,4)
        fld (%eax,,8)
        faddp
        fld (%eax,,12)
        faddp
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
