function h = rectfilt(N, wc)
%     for i=1:N %ideal
%         if(i <= wc*N)
%             hideal(i) = 1;
%         else
%             hideal(i) = 0;
%         end
%     end
%     for i=1:N %window filter
%         if(i<= wc*N)
%             wind(i) = 1;
%         else
%             wind(i) = N*(sinc(i*N/2)/sinc(i/2));
%         end
%     end
%     h = hideal.*wind;
h = fir1(N-1, wc, rectwin(N));
end