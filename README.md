# image-watermarking
image copyright protection using one-bit watermarking system

DWT

Embedding: The	input	image	is	wavelet	transformed	with	two levels	of	decomposition	using	
the	Haar wavelet.	

The	second	level	sub-bands	H2,	D2 and	V2 are	used	to	hold	three	watermarks	w1,	w2,	and	
w3 respectively	(H	stands	for	Horizontal,	V	for	vertical,	and	D	for	Diagonal).

These	watermarks	are	of	size	
(128	x	128)	each	and	are	saved	in	a	MAT	file	named	‘watermark.mat’.	

The	embedding	rule	is	additive	with	
a	watermark	strength	α=1.5.	

For	instance,	the	ith wavelet	coefficient	in	H2 is	updated	as
Y'(i) = Y(i) + α * ω1(i)
where	Y'(i) is	the	watermarked	coefficient	in	H2.	Y(i) is	the	original	coefficient	in	H2.	

Once	the	coefficients	
are	updated,	the	inverse	wavelet	transform	is	performed	to	obtain	the	watermarked	image.

Detection: This	programme	verifies	the	presence	of	the	watermarks	w1,	w2,	and	w3 in	the	
previously	saved	picture.	

First, two levels	of wavelet	decomposition	are	performed	as before.	Then,	three	
similar	watermark	detectors	are	used	for	detecting	w1,	w2,	and w3 that	are	stored	in	‘watermark.mat’.

For	example,	for	H2 where	w1	is	verified,	the	detector	calculates	
Φ1 = (Sum[w1(i),{i,1,N}] * sgn(Y'(i)))^2 / (Sum[w1(i)^2,{i,1,n}])
where	N	is	the	number	of	samples in	the	subband. sgn() represents	the	sign	operation. σ1 is	
the	standard	deviation	of	the	sub-band	H2 (use	std	if	the	matrix	is	converted	into	a	column	vector	and	std2	
otherwise).	

The	decision	for	watermark	w1 is	made	as	follows if Φ1 > 10 × σ! then	w1 exists	in	H2.	Otherwise,	w1 does	not	exist.

Similarly,	the	second	detector	calculates	σ2	 (from	D2)	and Φ2 to	decide	on	the	presence	of	w2 in	D2.	
The	third	detector	calculates	σ3 (from	V2)	and	Φ3 to	decide	on	the	presence	of	w3 in	V2

DCT

Embedding: The	input	image	is	DCT-transformed.	Three	square	regions	are	selected	from	the	
transformed	image	to	hold	w1,	w2 and	w3 (see	figure)	using	the	same	multiplicative	rule	as	before.	

Then,	
the	inverse	DCT	is	applied	to	get	the	watermarked	image.

Detection: This	programme	verifies	the	presence	of	the	watermarks	w1,	w2,	and	w3 in	the	
previously	saved	picture.	

First,	the	DCT	is	applied	on	the	watermarked	image.

Then,	three	similar	watermark	detectors	as	described	earlier	are	used	for	detecting	w1,	w2,	and	w3 which	are	stored	in	‘watermark.mat’.	

For	example,	for	the	region	where	w1	is	verified,	the	detector	calculates	σ1 (from	the	
horizontal	block)	and	Φ1 to	decide	on	the	presence	of	w1.
