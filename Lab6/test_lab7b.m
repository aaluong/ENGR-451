function test_lab7b
% test

delete(get(0, 'Child'));
filt = {@rectfilt @hammingfilt @kaiserfilt};
str = {'Rectangular' 'Hamming' 'Kaiser'};
beta = 5;
col = 'brk';
N = 21:10:41;
wc = 0.2:0.2:0.6;
for i = 1:length(filt)
	set(figure, 'Color', 'w');
	for n = 1:3
		if (i == 3)
			h = feval(filt{i}, N(n), 0.5, beta);
		else
			h = feval(filt{i}, N(n), 0.5);
		end
		ph = magdb(h);
		set(ph, 'LineWidth', 2, ...
				'Color', col(n));
		hold on;
	end
	legend(char([[1;1;1]*'N = ' num2str(N')]))
	axis([0 1 -80 5]);
	title(str{i});
	set(gca, 'XTick', 0:0.25:1)
	%pilabel('x', 0.25)
	
	set(figure, 'Color', 'w');
	NN = 31;
	for n = 1:3
		if (i == 3)
			h = feval(filt{i}, NN, wc(n), beta);
		else
			h = feval(filt{i}, NN, wc(n));
		end
		ph = magdb(h);
		set(ph, 'LineWidth', 2, ...
			'Color', col(n));
		hold on;
	end
	legend(char([[1;1;1]*'wc = ' num2str(wc') [1;1;1]*'\pi']))
	axis([0 1 -80 5]);
	title(str{i});
	set(gca, 'XTick', 0:0.25:1)
	%pilabel('x', 0.25)
end

set(figure, 'Color', 'w');
ph = magdb(hammingfilt(21, 0.5));
set(ph, 'LineWidth', 2, ...
	'Color', 'b');
hold on;
ph = magdb(rectfilt(21, 0.5));
set(ph, 'LineWidth', 2, ...
	'Color', 'r');
legend({'Hamming' 'Rectangular'})
axis([0 1 -80 5]);
title('Hamming vs. Rectangular N=21');
set(gca, 'XTick', 0:0.25:1)
%pilabel('x', 0.25)

set(figure, 'Color', 'w');
beta = 2:2:6;
for n = 1:3
	ph = magdb(kaiserfilt(21, 0.5, beta(n)));
	set(ph, 'LineWidth', 2, ...
		'Color', col(n));
	hold on;
end
legend(char([[1;1;1]*'\beta = ' num2str(beta')]))
axis([0 1 -80 5]);
title('Kaiser as a function of \beta');
set(gca, 'XTick', 0:0.25:1)
%pilabel('x', 0.25)

[N, beta] = kaiserparams(0.2, 0.001);
N = 2*floor(N/2)+1; % make sure it's odd
h = kaiserfilt(N, 0.4, beta);
h((N+1)/2) = h((N+1)/2) - 1;
h = -h;
set(figure, 'Color', 'w');
ph = magdb(h);
set(ph, 'LineWidth', 2, ...
	'Color', 'b');
axis([0 1 -80 5]);
hold on
plot([0.4 0.4], ylim, 'k:')
title('Kaiser highpass');
set(gca, 'XTick', 0:0.25:1)
%pilabel('xfrac=0', 0.2)

