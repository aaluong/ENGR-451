function [sr, sc] = separate(s, fs)
%    t = 1/fs;
%    n = ceil(length(s)/t);
%    if(n/2 == 0)
%        n = n + 1;
%    end
%    for i=1:n
%        sampled(i) = s(i*t);
%    end
   lp = kaiserfilt(length(s),2*pi*fs/1000,10);
   hp = 1 - lp;
   sr = conv(s, lp);
   sc = conv(s, hp);
end