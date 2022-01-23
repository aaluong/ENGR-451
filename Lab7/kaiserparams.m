function [N, beta] = kaiserparams(deltaOmega, delta)
    A = -20*log10(delta);
    if(A > 50)
        beta = 0.1102*(A-8.7);
    elseif(A < 21)
        beta = 0;
    elseif(A >= 21 && A <= 50)
        beta = 0.5842* (A-21)^(0.4)+0.07886*(A-21);
    end
    N = ceil((A-8)/(2.285*deltaOmega));
end