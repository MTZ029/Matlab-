% fourier transform
Ts =1/64;   % sampling time
T0 = 4;
N0 =T0 /Ts;

t=0:Ts:Ts*(N0-1);

g =Ts.*exp(-2*t);   % origianl

ff =fft(g);

ifg=ifft(ff); %apporximate

subplot(221);
plot(g , t);
title("ORIGINAL")

subplot(222);
plot(ifg , t);
title("FOURIER TRANSFORM")