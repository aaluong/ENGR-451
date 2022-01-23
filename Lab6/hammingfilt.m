function h = hammingfilt(N, wc)
%     for i=1:N
%         if(i <= wc*N)
%             h(i) = 1;
%         else
%             h(i) = (.54-.46*(cos((2*pi*i)/(N-1))));
%         end
%     end
 h = fir1(N-1,wc,hamming(N)); 
end