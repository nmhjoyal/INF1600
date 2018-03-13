.data
	/* Votre programme assembleur ici... */
	i: .int 10
	increm: .int 0
	zero: .int 0

.global func_s

func_s:	
	mov i, %esi
	mov increm, %ecx
	
	boucle:
		mov zero, %eax
		mov d, %ebx
		add %ebx, %eax
		mov e, %ebx
		add %ebx, %eax
		mov b, %ebx
		sub %ebx, %eax
		mov %eax, a 
		mov b, %ebx			# pour comparer la 1ere condition
		sub $1000, %ebx
		mov c, %edx
		add $500, %edx
		cmp %ebx, %edx
		ja conditionIf 		# si (c+500) - (b-1000) > 0, jmp if
		jna conditionElse	


	conditionIf: 
		mov c, %edx
		sub $500, %edx
		mov %edx, c
		mov b, %ebx
		cmp %edx, %ebx
		ja conditionIf2
		jmp break
		
	conditionIf2:
		mov b, %ebx
		sub $500, %ebx
		mov %ebx, b
		jmp break

	conditionElse:
		mov b, %ebx
		mov e, % eax
		sub %eax, %ebx
		mov %ebx, b
		mov d, %edx
		add $500, %edx
		mov %edx, d
		jmp break
		
	break:
		add $1, %ecx
		cmp %ecx, %esi 		
		jae boucle			# i (%esi) > compteur (%ecx), boucle 
		ret
