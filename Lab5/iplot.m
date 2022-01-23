function iplot(b, a)
	i1 = find(a,1,'first');
	a = a((i1):length(a)); %gets rid of the leading zeros so that filter can work correctly. Doesn't change results
	y = filter(b, a,[1, zeros(1,999)]);
	if(length(a) == 1) %FIR
		N = length(b);
	elseif(abs(real(roots(a))) >= 1 | abs(imag(roots(a))) >= 1) %IIR Unstable
		N = 20;
	else %IIR Stable
		x_rms = sqrt(1/length(y)*(sum(y.^2)));
		h1 = round(.99*x_rms);
		if(h1 < 10)
			N = 10;
		elseif(h1 > 100)
			N = 100;
		else
			N = h1;
		end
	end
	start = i1 - 1;
	stem((start * -1):N-start-1,y(1:N),'bo');
	hold on;
	plot(xlim, [0 0], 'k');
	xlabel('n');
	hold off;
end