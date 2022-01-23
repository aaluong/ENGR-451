function h = kaiserfilt(N, wc, beta)
%     n = ceil(N/2);
%     if (n/2 ~= 0)
%         n = n - 1;
%     end
%     j = -n:n;
%     k = 0:n*2;
%     w = besseli(0, beta*(1-((2*(j-(k-1)/2)/(k-1))^2)^(1/2)))/besseli(0, beta);
%     hideal = wc*sinc(wc*j);
%     h = hideal.*w;
h = fir1(N-1,wc,kaiser(N, beta));
end