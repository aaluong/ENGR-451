classdef prop %class definition for real and imaginary
	properties
		real
		imag
	end
	methods
		function s = prop(r,i)
			s.real = r;
			s.imag = i;
		end
	end
end