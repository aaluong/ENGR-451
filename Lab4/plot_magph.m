function plot_magph(x,w)
	assert(isa(x,'sequence'),'plot_magph error, x is not a sequence',class(x));%needed to be able to use magnitude and phase properties
	z = dtft2(x,w);
	y = mag_phase(z);
	subplot(2, 1, 1); %top plot
	plot(w/pi,y.mag);
	subplot(2, 1, 2); %bottom plot
	plot(w/pi,y.phase/pi);
	ylim([-1, 1]);
	xlabel('\omega (rads/\pi)');
	ylabel('\angleX(\omega)');
end