ts=10^(-4);   % sampling time
t=-0.05:ts:0.05;
Ta=0.01;      % variable 
m_sig=tri((t+0.01)/0.01)-tri((t-0.01)/0.01);
Lm_sig=length(m_sig);
A=length(t);   

A=2^ceil(log2(A));
M_sig=fftshift(fft(m_sig,A)); 
                                 
                                 
freqm=(-A/2:(A/2)-1)/(A*ts); % Defining the frequency axis for the frequency domain DSB modulated signal  -> normalize krne k lyai FFT use krte hain 
B_m=150;
h=fir1(40,[B_m*ts]); % defining a FIR filter of order 40 and cutoff frequency B_m*ts




%%% DSB modulation
fc=300; % carrier frequency
s_dsb=m_sig.*cos(2*pi*fc*t); % recall DSB modulation works by multiplying message signal by a cos function at the carrier frequency
A=length(t);
A=2^ceil(log2(A)+1); % increasing fft size by another factor of 2
S_dsb=fftshift(fft(s_dsb,A)); % obtaining frequency domain modulated signal
freqs=(-A/2:A/2-1)/(A*ts); % Defining the frequency axis for the frequency domain DSB modulated signal


%%% DSB Demodulation
s_dem=s_dsb.*cos(2*pi*fc*t)*2; % Demodulationb begins by multiplying with the carrier
S_dem=fftshift(fft(s_dem,A)); % Demodulatede signal in frequency domain

% Using an ideal low pass filter with bandwidth 150 Hz
s_rec=filter(h,1,s_dem)
S_rec=fftshift(fft(s_rec,A)); % Demodulatede signal in frequency domain
 

LSB = floor(A * fc *ts);


Filter =ones(1,A);
%Filter(A/2 -LB-1:A/2 + LSB)=zeros(1,2*LSB);
Filter(963:1084)=zeros(1,2*LSB);
x=S_dsb.*Filter;

P=length(m_sig)
figure(3)
plot(freqs , x)
S_ssb=real(ifft(fftshift(x)));
S_ssb=S_ssb(1:P);
%%% DSB Demodulation
s_dem1=S_ssb.*cos(2*pi*fc*t)*2; % Demodulationb begins by multiplying with the carrier
S_dem1=fftshift(fft(s_dem1,A)); % Demodulatede signal in frequency domain

figure(4)
plot(freqs  , S_dem1 );title('    demodulated sig     %%')
s_rec1=filter(h,1,s_dem1)
S_rec1=fftshift(fft(s_rec1,A)); % Demodulatede signal in frequency domain

figure(5)
plot(freqs , S_rec1);title("FILTER APPLIED ")

figure(1)
subplot(221)
plot(t,m_sig)
title('      original Signal     ')

subplot(222); plot(t,s_dsb)
title('     Signal Multiplied with cos for modulation     ')

subplot(223); plot(t, s_dem)
title('     Signal multiplied with cos again for demodulation     ')



figure(2)
subplot(221); plot(freqm,abs(M_sig))
title('     my signal in frequency domain   ')

subplot(222); plot(freqs,abs(S_dsb))
title('     MODULATED SIGNAL fftshift     ')

subplot(223); plot(freqs, abs(S_dem))
title('     DEMODULATED SIGNAL fftshift   ')