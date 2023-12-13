	org	$34

aeon	rmb	1
	
	org	$e000

Reset
	; SEXW
	ldf	#42
	sexw

	ldf 	#-42
	sexw

	ldf	#0
	sexw

	ldf	#-1
	sexw
	
	; Manipulate D
	ldd	#-27
	negd
	
	; Quad byte instructions
	ldq	quad

	leax	quad,pcr
	ldq	4,x
	
	stq	>aeon

	ldq	<aeon
	stq	>aeon+4

	leax	aeon,pcr
	stq	8,x
	
	; Test OIM Direct
	lda	#$42
	sta	<aeon
	oim	#$82,<aeon
	ldb	<aeon

	; Test AIM Direct
	lda	#$42
	sta	<aeon
	aim	#$82,<aeon
	ldb	<aeon

	; Test EIM Direct
	lda	#$42
	sta	<aeon
	eim	#$82,<aeon
	ldb	<aeon

	; ADDR
	lda	#27
	lde	#99
	ldf	#$42
	addr	a,e

	ldd	#$1234
	ldw	#$dead
	addr	w,d

	; 8-bit registers
	lde	#$55
	ldf	#$aa

	come
	comf

	dece
	ince

	decf
	incf

	tste
	tstf

done	bra	done

quad	fqb	$deadface
	fqb	$a5a55a5a
	
	
	org	$fffe
	fdb	Reset
