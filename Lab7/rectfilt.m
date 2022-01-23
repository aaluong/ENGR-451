function h = rectfilt(N, wc)
%     n = ceil(N/2);
%     if (n/2 ~= 0)
%         n = n - 1;
%     end
%     j = -n:n;
%     h = wc*sinc(wc*j);
h = fir1(N-1,wc,rectwin(N));
end