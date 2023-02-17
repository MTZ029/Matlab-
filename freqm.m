kf=160*pi;
fc=350;
ts=10^(-4);
t=-0.5:ts:0.5;

m=tri((t+0.01)/0.01)+tri((t-0.01)/0.01);

figure(1)
plot(t, m);grid on;title("Original signal");

Lfft=length(t);
Lfft=2^ceil(log2(Lfft));
m_freqm=fftshift(fft(m , Lfft));
freqm1=[-Lfft/2:Lfft/2-1]/(Lfft*ts);
plot(freqm1 , abs(m_freqm));grid on;title("fourieir transform" );

m_integral=kf*ts*cumsum(m);
fm_signal=cos(2*pi*fc*t+m_integral);

figure(3)
plot(t , fm_signal);grid on;title("FM");

Lfft=length(t);
Lfft=2^ceil(log2(Lfft));
m1_freq=fftshift(fft(fm_signal , Lfft));
frqm2=[-Lfft/2:Lfft/2-1]/(Lfft*ts);
figure(4)
plot(frqm2 , m1_freq);grid on;title("Fourier of fm");



b_m=150;
h=fir1(80 , [b_m*ts]);
% demodulation
s_dem=diff([fm_signal(1) fm_signal])/ts/kf;     % ratta
% signal ractification
s_rec=s_dem.*(s_dem>0);
%  filter (detection of envalop)
s_det=filter(h , 1 , s_rec);

figure(5)
plot(t , s_det);grid on;title("  demodulated signal   ");

figure(6)
plot(t , s_dem);grid on;title("  Fm derivative  ");

figure(7)
plot(t , s_rec);grid on;title("ractified signal");

