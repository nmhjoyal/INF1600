.data
	/* Votre programme assembleur ici... */
	i: .int 10
	zero: .int 0

.global func_s

func_s:	
	mov i, %esi
	mov zero, %ecx
	jmp boucle
	
	conditionIf2:
		mov b, %ebx
		sub $500, %ebx
		mov %ebx, b
		jmp boucle

	conditionIf: 
		mov c, %edx
		sub $500, %edx
		mov %edx, c
		mov b, %ebx
		cmp %edx, %ebx
		ja conditionIf2
		jmp boucle

	conditionElse:
		mov b, %ebx
		sub e, %ebx
		mov %ebx, b
		mov d, %edx
		add $500, %edx
		mov %edx, d
		jmp boucle

	boucle:
		mov a, %eax
		add d, %eax
		add e, %eax
		sub b, %eax
		mov %eax, a 
		mov b, %ebx
		sub $1000, %ebx
		mov c, %edx
		add $500, %edx
		cmp %ebx, %edx
		ja conditionIf 		# si (c+500) - (b-1000) > 0, jmp if
		jna conditionElse	
		add $1, %ecx
		cmp %ecx, %esi 		
		ja boucle		# i (%esi) > compteur (%ecx), boucle 
		ret
