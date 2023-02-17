% this is the code for the f requency modulation of a signal 
kf=160*pi;   % thios is the frequency constanct
fc=300;
t=-0.5:0.0001:0.5;
ts=10^(-4);
m=Rect((t-0.01)/0.01)+Rect((t+0.01)/0.01); % message signal 

figure(1)
plot(t , m);grid on;title("ORIGIANAL MESSAGE SIGNAL ");

A=length(t); % lfft function

A=2^ceil(log2(A));
F=fftshift(fft(m,A));                       
freqm=(-A/2:(A/2)-1)/(A*ts);
figure(2)
plot(freqm , F);grid on; title("FOURIER TRANSFORM ");

m_integral=kf*ts*cumsum(m);     % we use commulated sum for integral function;
fm_signal=cos(2*pi*fc*t + m_integral); % freqency modualated signal 

figure(3)
plot(t, fm_signal);grid on; title("  FREQUENCY MODULATED SIGNAL     ");%axis([-0.2 0.2 0 1.1]);

A=2^ceil(log2(A));
F1=fftshift(fft(fm_signal,A));                       
freqm=(-A/2:(A/2)-1)/(A*ts);
figure(4)
plot(freqm , F1);grid on;title("  FOURIER OF THE FREQUENCY MODUALTED SIGNAL ");