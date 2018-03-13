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
		mov d, %eax
		mov e, %ebx
		add %ebx, %eax		# d+e
		mov b, %ebx
		sub %ebx, %eax		#(d+e)-b
		mov %eax, a 		# a = (d+e)-b
		mov b, %ebx		
		sub $1000, %ebx		# b-1000
		mov c, %edx
		add $500, %edx		# c+500
		cmp %ebx, %edx		# (c+500) - (b-1000)
		ja conditionIf 		# si (c+500) - (b-1000) > 0, jmp if
		jmp conditionElse


	conditionIf: 
		mov c, %edx			
		sub $500, %edx		# c-500
		mov %edx, c
		mov b, %ebx		
		cmp %edx, %ebx		# b - (c-500)
		ja conditionIf2		# si b - (c-500) > 0
		jmp break
		
	conditionIf2:
		mov b, %ebx
		sub $500, %ebx		# b-500
		mov %ebx, b
		jmp break

	conditionElse:
		mov b, %ebx			
		mov e, %eax
		sub %eax, %ebx		# b-e
		mov %ebx, b
		mov d, %edx
		add $500, %edx		# d+500
		mov %edx, d
		jmp break
		
	break:
		add $1, %ecx		#incremente compteur
		cmp %ecx, %esi 		# compteur - 10
		jae boucle			# si 10 >= compteur, boucle 
		ret
