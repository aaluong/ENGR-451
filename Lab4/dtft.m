function y = dtft(x,w)
	assert(isa(x,'sequence'),'DTFT error, x is not a sequence',class(x)); %needed to be able to use sequence properties
	Output = zeros(1,length(w));
	for k = 1:length(w)
		for n = x.offset:length(x.data)+x.offset - 1
			Output(k) = Output(k) + (x.data(n-x.offset+1)*exp(-1j * w(k) * n));
		end
	end
	y = Output;
end