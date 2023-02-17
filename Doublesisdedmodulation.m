% note that the acuraccy is trade of with the limit
% fftshift -> fft ko cetralized honai k lyai
% COS (2*PI*FC*t)
% double side band modulation
ts =10^(-4);     % sampling time 
t =-0.04:ts:0.04;

Ta =0.01;       
sig1=tri((t+0.01)/0.01)-tri((t-0.01)/0.01);

Lm_sig =length(sig1);
Lfft =length(t);

Lfft =2^ceil(log2(Lfft))

sig1 =fftshift(fft(sig1, Lfft);

B= 150; % 150 hz domain

h= fir1(40 ,[B*ts]);

fc= 300;

dsb =sig1.*cos(2*pi*fc*t)

Lfft =length(t);
Lfft=2 ^ceil(log2(Lfft)+1)
dsb =fftshift(fft(dsb, Lfft));


dem =dsb.*cos(2*pi*fc*t)*2;
dem1=fftshift