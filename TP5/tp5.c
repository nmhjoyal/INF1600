
#include <stdio.h>

unsigned int Decryption_fct(unsigned int le)
{
	unsigned int be;

	/*
	 * Remplacez le code suivant par de l'assembleur en ligne
	 * en utilisant le moins d'instructions possible
	 
	 be = (le & 0xff000000) | (le&0xff) << 16  | (le & 0xff00) | (le & 0xff0000) >> 16;
	 */
	

	asm volatile (
		"movl $0xff000000, %%ebx\n" 		//mov '0xff000000' dans ebx	
		"movl %1, %%eax\n" 					//mov 'le' (%1) dans %eax
		"and %%ebx, %%eax\n"				//'ET' logique 
		"movl %%eax, %%ecx\n"				// mov resultat dans ecx
		"movl %1, %%eax\n"				
		"movl $0xff, %%ebx\n"
		"and %%ebx, %%eax\n"				
		"shl $16, %%eax\n"				//shift gauche de 16 bits
		"or %%ecx, %%eax\n"				//'OU' logique avec resultat precedent 12(%ebp)
		"movl %%eax, %%ecx\n"
		"movl %1, %%eax\n"
		"movl $0xff00, %%ebx\n"
		"and %%ebx, %%eax\n"
		"or %%ecx, %%eax\n"
		"movl %%eax, %%ecx\n"
		"movl %1, %%eax\n"
		"movl $0xff0000, %%ebx\n"
		"and %%ebx, %%eax\n"
		"shr $16, %%eax\n"
		"or %%ecx, %%eax\n"
		"movl %%eax, %0\n"				//mettre resultat dans 'be' (%0)
		: "=r"(be)
		: "r"(le)
		: "%eax", "%ebx", "%ecx"
	);

	return be;
}

int main()
{
	unsigned int data = 0xeeaabbff;

	printf("Représentation crypte en little-endian:   %08x\n"
	       "Représentation decrypte en big-endian:    %08x\n",
	       data,
	       Decryption_fct(data));

	return 0;
}
