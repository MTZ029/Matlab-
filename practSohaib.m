t=[-0.5:0.0001:0.5];
m=Rect((t-0.02)/0.02)+tri((t+0.02)/0.02);
figure(1);subplot(221);plot(t,m);title('MESSAGE SIGNAL');axis([-0.3,0.3 , 0, 1.5]);
Trange=[-0.025 0.025 -2 2];
Frange=[-700 700 0 200];
Lm_sig=length(m);
Lfft=length(t);
Lfft=2^ceil(log2(Lfft));
M=fftshift(fft(m,Lfft));
freqm=(-Lfft/2:Lfft/2-1)/(Lfft*0.0001);
subplot(222);plot(freqm,abs(M));axis(Frange);
B_m=150;
h=fir1(40,[B_m*0.0001]);
%Modulation
fc=30;
s_dsb=(1+m).*cos(2*3.14*fc*t);
Lfft=length(t);
Lfft=2^ceil(log2(Lfft));
S_dsb=fftshift(fft(s_dsb,Lfft));
freqs=(-Lfft/2:Lfft/2-1)/(Lfft*0.0001);
figure(2);
subplot(221);plot(t,s_dsb);title('MODULATED Signal');axis([-0.3,0.3 , 0, 1.5]);
subplot(222);plot(freqs,abs(S_dsb));axis(Frange);
%demodulation
s_dem=s_dsb.*(s_dsb>0);
S_dem=fftshift(fft(s_dem,Lfft));
subplot(223);plot(t,s_dem);axis([-0.3,0.3 , 0, 1.5]);
subplot(224);plot(freqs,abs(S_dem));axis(Frange);
%Filtered signal
s_rec=filter(h,1,s_dem);
S_rec=fftshift(fft(s_rec,Lfft));
figure(3);
subplot(221);plot(t,s_rec);title('FILTER APPLIED');axis([-0.3,0.3 , 0, 1.5]);
subplot(222);plot(freqs,abs(S_rec));('FOURIER OF FILTERED');axis(Frange);