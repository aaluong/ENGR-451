function test_lab6a
% TEST_LAB6a Checks functionality of FIR window design
%      Place this file in same directory as your
%      rectfilt, hammingfilt and kaiserfilt functions.

% Check filter design

wc = [0.25 0.5 0.75];
N = [21 31 41];
beta = 5;
filt = {'rect', 'hamming'};
wind = {'rectwin', 'hamming'};
cor = {'correct' 'incorrect'};
tol = 1e-4;

for ifilt = 1:length(filt)
    f = filt{ifilt};
    wi = wind{ifilt};
    for iwc = 1:length(wc)
        w = wc(iwc);
        for iN = 1:length(N)
            n = N(iN);
            str = eval(['check(' f 'filt(n, w), fir1(n - 1, w, ' wi '(n)))']);
            fprintf(1, 'Testing ''%sfilt'' with N=%d and wc=%3.2f: %s\n', f, n, w, str);
        end
    end
    fprintf(1, '\n');
end

domega = [0.1 0.2];
delta = [0.01 0.00097 0.000097];
stop = 0;
for idomega = 1:length(domega)
    do = domega(idomega);
    for idelta = 1:length(delta)
        d = delta(idelta);
        [N, beta] = kaiserparams(do, d);
        [myN, myBeta] = mykaiserparams(do, d);
        c = abs([myN-N myBeta-beta]) > tol*[0 1];
        fprintf(1, 'Testing ''kaiserfilt'' with deltaOmega=%2.1f, delta=%g:\n\tN (%d) is %s, beta (%g) is %s\n', ...
            do, d, N, cor{c(1)+1}, beta, cor{c(1)+1});
        stop = stop | any(c);
        if (stop)
            break;
        end
        for iwc = 1:length(wc)
            w = wc(iwc);
            str = check(kaiserfilt(N, w, beta), fir1(N-1, w, kaiser(N, beta)));
            fprintf(1, '\tChecking wc=%3.2f: %s\n', w, str);
        end
    end
end
return

function str = check(h1, h2)
h1 = h1(:);
h2 = h2(:);
tol = 1e-4;
if (length(h1) ~= length(h2))
    str = 'length wrong';
elseif (any(abs(h1 - h2) > tol))
    str = 'data wrong';
else
    str = 'O.K.';
end
return

function [N, beta] = mykaiserparams(do, d);
A = -20 * log10(d);
if (A > 50)
    beta = 0.1102 * (A - 8.7);
elseif (A > 20)
    beta = 0.5842 * (A - 21)^0.4 + 0.07886 * (A - 21);
else
    beta = 0;
end

N = ceil((A - 8) / (2.285 * do * pi));
return


