.data
	un: .int 1
	deux: .int 2

.globl _ZNK9CTriangle12PerimeterAsmEv

_ZNK9CTriangle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        mov 8(%ebp), %eax
        fld 4(%eax)
        mov un, %edx
        fld 4(%eax, %edx, 4)
        faddp
        mov deux, %edx
        fld 4(%eax, %edx, 4)
        faddp
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
