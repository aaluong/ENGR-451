function zplot(b,a)
	rb = roots(b);
	ra = roots(a);
	plot(real(rb), imag(rb), 'bo'); %ploting zeros
	hold on;
	plot(real(ra), imag(ra), 'rx'); %ploting poles
	x1 = 0;
	y1 = 0j;
	x2 = 0;
	y2 = 0j;
	for i = 1:length(rb) %finding outer most points
		if(abs(real(rb(i)))) > x1
			x1 = abs(real(rb(i)));
		end
		if(abs(imag(rb(i)))) > y1
			y1 = abs(imag(rb(i)));
		end
	end
	for i = 1:length(ra)
		if(abs(real(ra(i)))) > x2
			x2 = abs(real(ra(i)));
		end
		if(abs(imag(ra(i)))) > y2
			y2 = abs(imag(ra(i)));
		end
	end
	if(x1 > x2)
		if(x1 > 1)
			xaxis = x1;
		else
			xaxis = 1;
		end
	elseif(x2 > 1)
		xaxis = x2;
	else
		xaxis = 1;
	end
	if(y1 > y2)
		if(y1 > 1)
			yaxis = y1;
		else
			yaxis = 1;
		end
	elseif(y2 > 1)
		yaxis = y2;
	else
		yaxis = 1;
	end
	rectangle('Position', [-1 -1 2 2], 'Curvature', [1 1]);
	axis equal;
	axis(1.1*[(xaxis*-1) xaxis (-1*yaxis) yaxis]);
	plot(xlim, [0 0], 'k');
	plot([0 0], ylim, 'k');
	hold off;
end