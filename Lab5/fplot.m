function fplot(b, a)
	H = fft(b, 16)./fft(a, 16); %./ so that you get back an array and not just the first value
	for i=1:16
		w(i) = (2*pi*(i-1))/16;
	end
	subplot(2, 1, 1); %top plot
	plot(w/pi,abs(H(1:16)),'b');
	ylabel('\midX(\omega)\mid');
	set(gca,'XTick', []);
	xlim([0 1]);
	subplot(2, 1, 2); %bottom plot
	plot(w/pi, angle(H(1:16))/pi, 'b');
	hold on;
	plot(xlim, [0 0], 'k');
	xlim([0 1]);
	ylim([-1 1]);
	xlabel('\omega (fraction of k)');
	ylabel('\angleX(\omega)');
	hold off;
end