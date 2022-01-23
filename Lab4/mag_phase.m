function y = mag_phase(x)
	assert(isa(x,'prop'),'mag_phase error, x is not a prop',class(x)); %needed to be able to use real and imaginary properties  
	for i=1:length(x.real)
		mag(i) = sqrt((x.real(i)^2) + (x.imag(i)^2));
		ph(i) = atan2(x.imag(i),x.real(i));
	end
	y = m(mag,ph); %to a class with only definitions for magnitude and phase numbers 
end