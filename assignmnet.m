ts=10^(-4);
ct=-0.04:ts:0.04;
Ta=0.01;      % variable 
m_sig=sinc(2*(t/Ta))+sinc(2*(t/Ta)-1)+sinc(2*(t/Ta)+1);
Lm_sig=length(m_sig);
A=length(t);   % defining DFT (or FFT) size
A=2^ceil(log2(A))  % making A a power of 2 since this makes the fft algorithm work fast
M_sig=fftshift(fft(m_sig,A))  % i.e. calculating the frequency domain message signal,
                                 % fft algorithm calculates points from ) to A-1, hence we use fftshift on this
                                 % result to order samples from -A/2 to A/2 -1 
                                                                  
freqm=(-A/2:(A/2)-1)/(A*ts) % Defining the frequency axis for the frequency domain DSB modulated signal  -> normalize krne k lyai FFT use krte hain 
B_m=150;
h=fir1(40,[B_m*ts]) % defining a FIR filter of order 40 and cutoff frequency B_m*ts



%%% DSB modulation
fc=300; % carrier frequency
s_dsb=m_sig.*cos(2*pi*fc*t) % recall DSB modulation works by multiplying message signal by a cos function at the carrier frequency
A=length(t)
A=2^ceil(log2(A)+1) % increasing fft size by another factor of 2
S_dsb=fftshift(fft(s_dsb,A)); % obtaining frequency domain modulated signal
freqs=(-A/2:A/2-1)/(A*ts) % Defining the frequency axis for the frequency domain DSB modulated signal


%%% DSB Demodulation
s_dem=s_dsb.*cos(2*pi*fc*t)*2 % Demodulationb begins by multiplying with the carrier
S_dem=fftshift(fft(s_dem,A)); % Demodulatede signal in frequency domain

% Using an ideal low pass filter with bandwidth 150 Hz
s_rec=filter(h,1,s_dem)
S_rec=fftshift(fft(s_rec,A)); % Demodulatede signal in frequency domain
 


Trange=[-0.025 0.025 -2 2] % This specifies the range of axis for the plot, the first two parameters are range limits for x-axis, and last two parameters are for y-axis
Frange=[-700 700 0 200] % axis range for frequency domain plots

figure(1)
subplot(221); plot(t,m_sig)
axis(Trange) % set x-axis and y-axis limits 
title('      original Signal     ')

subplot(222); plot(t,s_dsb)
axis(Trange)
title('     Signal Multiplied with cos for modulation     ')

subplot(223); plot(t, s_dem)
axis(Trange) % set x-axis and y-axis limits 
title('     Signal multiplied with cos again for demodulation     ')

subplot(224); plot(t,s_rec)
axis(Trange)
title('     Filtered signal     ')


figure(2)
subplot(221); plot(freqm,abs(M_sig))
axis(Frange) % set x-axis and y-axis limits 
title('     my signal in frequency domain   ')

subplot(222); plot(freqs,abs(S_dsb))
axis(Frange)
title('     MODULATED SIGNAL fftshift     ')

subplot(223); plot(freqs, abs(S_dem))
axis(Frange) % set x-axis and y-axis limits 
title('     DEMODULATED SIGNAL fftshift   ')

subplot(224); plot(freqs,abs(S_rec))
axis(Frange)
title('   Filter in frequancy domain   ')

