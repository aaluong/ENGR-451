function test_lab2b(y, h)

persistent n;

tol = 1e-5;

if (~nargin)
    n = 0;
    return
elseif (isempty(n))
    n = 0;
end

response = {'correct' 'wrong'};
n = n + 1;

x = deconv(y, h);
x2 = deconv(y.data, h.data);
fprintf('Deconvolution problem #%d\n', n);
if (~isa(x, 'sequence'))
	fprintf('   Output is not a sequence');
	return
end

diff = any((abs(x.data - x2) - tol) > 0);

fprintf('   Your data are %s\n', response{diff+1});
fprintf('   Your offset is %s\n\n', response{(x.offset~=(y.offset-h.offset))+1});

	function x = deconv_th(y, h)
		% DECONV
		ly = length(y.data);
		lh = length(h.data);
		lx = ly-lh+1;
		warning off
		H = toeplitz([h.data zeros(lx-lh)], zeros(1, lx))';
		warning on
		x.data = y.data(1:lx)/H;
		x.offset = y.offset - h.offset;
	end
end
