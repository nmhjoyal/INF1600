.data
	/* Votre programme assembleur ici... */
.global func_s

func_s:	
	mov $10, %esi
	mov $0, %edi
	
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
		jnae conditionElse


	conditionIf: 
		mov c, %edx			
		sub $500, %edx		# c-500
		mov %edx, c
		mov b, %eax		
		cmp %edx, %eax		# b - c
		ja conditionIf2		# si b - c > 0
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
		add $1, %edi		#incremente compteur
		cmp %edi, %esi 		# 10-compteur
		jae boucle			# si 10-compteur >= 0, boucle 
		ret
