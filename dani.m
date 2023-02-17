%PM modulation
ts=10^(-4);
t=-5:ts:5;
Ta=0.001;
m=triplesinc(t , Ta);
figure(1)
plot(t,m);grid on;title("original signal");
Lfft=length(t);
Lfft=2^ceil(log2(Lfft));
m_freq=fftshift(fft(m , Lfft));
freqm=[-Lfft/2:Lfft/2-1]/(Lfft*ts);
figure(2)
plot(freqm , abs(m_freq));grid on;title("Fourier");
fc=300;
%m_t=ts*kf*cumsum(m);
m_t1=pi*m;
pm_signal=cos(2*pi*fc*t+m_t1);
Lfft=length(t);
Lfft=2^ceil(log2(Lfft));
m_freq1=fftshift(fft(pm_signal , Lfft));
figure(3)
plot(t , pm_signal);grid on; title("PULSE")
figure(4)
plot(freqm ,abs(m_freq1));grid on;title("Pulse fourier");
Bm=150;
h=fir1(40 , [Bm *ts]);
%PM code end here


%demodulation of a signal (FM)
s_dem=[pm_signal(1) pm_signal]/ts/kf;
s_rec=pm_signal.*(pm_signal);
s_det=filter(h , 1 , s_rec);
