function y = dtft2(x,w)
	assert(isa(x,'sequence'),'DTFT2 error, x is not a sequence',class(x)); %needed to be able to use sequence properties
	R = zeros(1,length(w));
	I = zeros(1,length(w));
	for k = 1:length(w)
		for n = x.offset:length(x.data)+x.offset - 1
			R(k) = R(k) + (x.data(n-x.offset + 1)*cos(w(k)*n));
			I(k) = I(k) + (x.data(n-x.offset + 1)*sin(w(k)*n));
		end
	end
	I = I * -1;
	y = prop(R,I); %to a class with only definitions for real and imaginary numbers
end