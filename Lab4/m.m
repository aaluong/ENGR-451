classdef m %needed to get magnitude and phase
	properties
		mag
		phase
	end
	methods
		function s = m(m,p)
			s.mag = m;
			s.phase = p;
		end
	end
end