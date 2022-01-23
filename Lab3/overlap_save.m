function y = overlap_save(x, h, lc)
	x_length = length(x);
	h_length = length(h);
	nChunks = ceil(x_length/lc);
	size_y = x_length + h_length - 1;
	M = h_length - 1;
	xindex = 0;
	for i=1:nChunks
		if(i > 1)
			xindex = xindex + lc - M;
			yindex = xindex + M + 1;
		else
			xindex = 1;
			yindex = 1;
		end
		if(i == 1)
			if(nChunks == 1)%if the chunk is bigger than the convolution
				xchunk = zeros(1,lc);
				for j=xindex:x_length
					xchunk(j) = x(j);
				end
				ychunk = conv(xchunk,h);
				for j=1:size_y
					yout(j) = ychunk(j);
				end
				y = yout;
			else
				xchunk = x(xindex:xindex + lc - 1);
				ychunk = conv(xchunk,h);
				y(yindex:length(ychunk) - M) = ychunk(1:length(ychunk) - M);
			end
			xindex = 0;
		elseif(i < nChunks)
			xchunk = x(xindex + 1:xindex + lc);
			ychunk = conv(xchunk,h);
			y(yindex:yindex+length(ychunk) - 2*M - 1) = ychunk(M + 1:length(ychunk) - M);
		else
			xchunk = x(xindex + 1:x_length);
			ychunk = conv(xchunk,h);
			y(yindex:size_y) = ychunk(M + 1:length(ychunk));
		end
	end
end