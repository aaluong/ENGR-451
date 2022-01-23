function [sr,sc] = separate(s,fs)
    w = 2/(fs/1000);
    lp = kaiserfilt(101, w, 20);
    for i=1:length(lp)
        if(i == 1)
            impulse(i) = 1;
        else
            impulse(i) = 0;
        end
    end
    hp = impulse - lp;
    sr = conv(lp,s);
    sc = conv(hp,s);
    %figure out the parameters for the kaiser filter then convolve the
    %filter and s
end