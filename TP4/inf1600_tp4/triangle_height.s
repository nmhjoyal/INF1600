.data
	element: .int 4
	factor: .float 2.0
	
.globl	_ZNK9CTriangle9HeightAsmEv

_ZNK9CTriangle9HeightAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        mov 8(%ebp), %eax					/* objet dans eax */
        mov element, %edx					/* 4e él de la vtable */
        mov (%eax, %edx, 4), %eax 			/* 0*objet (vtable) + 4*4(ret float) = CTriangle::AreaCpp dans eax */
        call *(%eax)						/* resultat placé à st[0] */
        fld factor
        fmulp
        
        mov 8(%ebp), %eax					/* obj dans %eax */
        mov element, %edx
        fld 4(%eax, %edx, 4)				/* mSides[2] */
        fdivrp
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
