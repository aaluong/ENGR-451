function y = conv_rt(x,h)
	size_x = length(x);
	size_h = length(h);
	if(size_x < size_h)
		first = x;
		second = h;
	else
		first = h;
		second = x;
	end
	outputlength = size_x + size_h - 1;
	temp = zeros(1,length(first));
	index = 1;
	shift = length(temp);
	output = length(outputlength);
	while(index < outputlength + 1)
		for i=1:length(temp) %shifts the elements of temp
			if(i == length(temp))
				if(index > length(second)) %if second is out of elements add 0
					shift(1) = 0;
				else
					shift(1) = second(index);
				end
			else
				shift(i+1) = temp(i);
			end
		end
		temp = shift; %putting the shifted array back to the temp array
		y1 = 0;
		for i=1:length(first)
			value = first(i)*temp(i);
			y1 = y1 + value;
		end
		output(index) = y1;
		index = index + 1;
	end
	y = output;
end