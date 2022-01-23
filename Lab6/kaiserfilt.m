function h = kaiserfilt(N, wc, beta)
    den = besseli(1, beta);
    for i=1:N
        if(i<=wc)
            h(i) = 1;
        else
            h(i) = besseli(1,beta*(1-((2*(i-(N-1)/2))/(N-1))^2)^.5)/den;
        end
    end
end