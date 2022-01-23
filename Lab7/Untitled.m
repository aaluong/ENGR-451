n = -10:10;
wc = 0.5;
%window filter
hideal = wc*sinc(wc*n);
n = 0:20;
%hamming filter
w = 0.54-0.46*cos(2*pi*n/20);
h = hideal.*w;
%kasier filter


