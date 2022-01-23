function y = overlap_add(x, h, lc)
	x_length = length(x);
	h_length = length(h);
	nChunks = ceil(x_length/lc);
	size_y = x_length + h_length - 1;
	y = zeros(1,size_y);
	for i=1:nChunks
		xindex = lc *(i-1) + 1;
		yindex = xindex;
		if(i == 1)
			if(nChunks == 1) %if the chunk is bigger than the convolution
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
				xchunk = x(xindex:(xindex + lc - 1));
				ychunk = conv(xchunk,h);
				y(yindex:yindex+(length(ychunk)-1)) = y(yindex:yindex+(length(ychunk)-1)) + ychunk;
			end
		elseif(i < nChunks)
			xchunk = x(xindex:(xindex + lc - 1));
			ychunk = conv(xchunk,h);
			y(yindex:yindex+(length(ychunk)-1)) = y(yindex:yindex+(length(ychunk)-1)) + ychunk;
		else
			xleft = x_length - xindex + 1;
			xchunk = zeros(1,lc);
			for j=1:xleft %filling xchunk with the rest of x's numbers
				xchunk(j) = x(j+xindex-1);		
			end
			ychunk = conv(xchunk,h);
			sizeout = size_y - yindex + 1;
			for j=1:sizeout %making sure that the size will be correct
				yout(j) = ychunk(j);
			end
			y(yindex:size_y) = y(yindex:size_y) + yout;
		end
	end
end