function h = hammingfilt(N, wc)
%     n = ceil(N/2);
%     if (n/2 ~= 0)
%         n = n - 1;
%     end
%     j = -n:n;
%     k = 0:n*2;
%     w = 0.54-0.46*cos(2*pi*k/(n*2));
%     hideal = wc*sinc(wc*j);
%     h = hideal.*w;
h = fir1(N-1, wc, hamming(N));
end