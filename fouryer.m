% fourier transform
Ts =1/64;   % sampling time
T0 = 4;     % time on eperiod
N0 =T0 /Ts;   % number of samples in one period.

t=0:Ts:Ts*(N0-1);

g =Ts.*exp(-2*t).*Unitstep(t);   % to conert to digital

ff =fft(g);

ifg=ifft(ff); %apporximate


%subplot(221);
%stem(g , t);
title("ORIGINAL")


%subplot(222);
%stem(ifg , t);
title("FOURIER TRANSFORM")


%  Ts <= 1/2B -> B= bandwidth.    reconstration rate




% now checking for phase and magnitude 
[ff , ifg]=cart2pol(real(ff) , imag(ifg));

w =2*pi*1/T0;
