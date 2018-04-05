.data
	factor: .float 2.0
	
.globl	_ZNK9CTriangle9HeightAsmEv

_ZNK9CTriangle9HeightAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        mov 8(%ebp), %eax					/* objet dans eax */
        mov (%eax), %ebx					/* vTable dans %ebx */
        push %eax							/* objet = param pour call */
        call *16(%ebx)						/* Appel AreaCpp, resultat placé à st[0] */
        fld factor			
        fmulp
        fld 12(%eax)						/* mSides[2] */
        fdivrp
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
