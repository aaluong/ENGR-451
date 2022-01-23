function ph = magdb(h)
    H = fft(h, 1024);
    Hlength = 1024;
    w = linspace(0, 1, 513);
    ph = plot(w, db(abs(H(1:Hlength/2+1))));
    xlabel('\omega(rads/s)');
    ylabel('|H(w)|');
    set(gca, 'XTick', 0:0.1:1); 
end