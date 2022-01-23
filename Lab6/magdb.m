function ph = magdb(h)
    H = fft(h, 1024);
    for i=1:length(H)
        w(i) = (2*pi*(i-1))/1024;
    end
    mag = 20*log10(H);
    max = mag(1);
    for i=1:length(mag)
        mag(i) = mag(i) - max;
    end
    ph = plot(w/pi, mag);
    xlabel('\omega(rads/s)');
    ylabel('|H(w)|');
    xlim([0 1]);
end