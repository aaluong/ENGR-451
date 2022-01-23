function test_lab6c
% test separation of tones for star key

fs = 8000;
toneLength = 100; % msecs
nTone = toneLength * fs / 1000;
f = [941 1209]';
sf = cos(2 * pi * f * (0:nTone-1) / fs);
cf = cos(2 * pi * f * (0:nTone-1) / fs);
sstar = sum(sf);
[sr, sc] = separate(sstar, fs);

lsr = length(sr);
if (lsr ~= length(sc))
    disp('Order of your filters was not the same.');
end
lfilt = lsr - nTone + 1;
if (~mod(lfilt, 2))
    disp(['Warning: Order of your highpass filter (I''m guessing ', num2str(lfilt), ') may have been even']);
end

m = lsr - nTone;
if (m < 0)
    error('Output length is shorter than input length.');
end
m2 = fix(m / 2);
sr = sr(m2+1:m2+nTone);
sc = sc(m2+1:m2+nTone);

snrr = 10 * diff(log10((sr * sf').^2 + (sr * cf')));
snrc = 10 * diff(log10((sc * sf').^2 + (sc * cf')));

disp(['Signal to noise ratio of row tones: ' num2str(-snrr)]);
disp(['Signal to noise ratio of column tones: ' num2str(snrc)]);

return



    




