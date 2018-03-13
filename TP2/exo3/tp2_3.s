.data
	/* Votre programme assembleur ici... */
	i:

.global func_s

func_s:	
	conditionIf2:
		mov b, %ebx
		sub $500, %ebx
		mov %ebx, b

	conditionIf: 
		mov c, %edx
		sub $500, %edx
		mov %edx, c
		mov b, %ebx
		cmp %edx, %ebx
		ja conditionIf2

	conditionElse:
		mov b, %ebx
		sub e, %ebx
		mov %ebx, b
		mov d, %edx
		add $500, %edx
		mov %edx, d

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
		ja conditionIf
		jna conditionElse
		loop boucle

	
	ret
