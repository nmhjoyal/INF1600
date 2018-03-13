.global func_s

func_s:
	flds b
	flds d	#b = s[1], d = s[0]
	fmulp		#b * d = s[0]
	flds c	#c = s[0], b*d = s[1]
	fsubrp	#s[1] - s[0] = s[0]
	fstps c	#résultat mis dans c
	flds f	
	flds g	#f = s[1], g = s[0]
	fsubrp	#s[1] - s[0] = s[0]
	flds c	#résultat sous. = s[1], c = s[0]
	fdivp		# s[0] / s[1] = s[0]
	flds e	# résultat div. = s[1], e = s[0]
	faddp		# s[0] + s[1] = s[0]
	fstps c	# s[0] mis dans c
	flds e	
	flds g	# e = s[1], g = s[0]
	fsubp		# s[0] - s[1] = s[0]
	flds f	# résultat = st[1], f = st[0]
	fdivrp	# st[1] / st[0] = st[0]
	flds c	# résultat = st[1], c = st[0]
	fmulp		# st[0] * st[1] = st[0]
	fstps a	# met st[0] dans a

	ret
