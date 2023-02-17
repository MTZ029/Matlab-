ts=10^(-4);
t=-0.04:ts:0.04;
Ta=0.01;      % variable 
m_sig=sinc(2*(t/Ta))+sinc(2*(t/Ta)-1)+sinc(2*(t/Ta)+1);
m_sig2=tri(t/2)-tri(t/2-1);
Lm_sig=length(m_sig);
A=length(t);   % defining DFT (or FFT) size
A=2^ceil(log2(A)) ; % making A a power of 2 since this makes the fft algorithm work fast
M_sig=fftshift(fft(m_sig,A));  % i.e. calculating the frequency domain message signal,
M_sig1=fftshift(fft(m_sig2,A));

 
 
 % fft algorithm calculates points from ) to A-1, hence we use fftshift on this
                                 % result to order samples from -A/2 to A/2 -1 
                                                                  
freqm=(-A/2:(A/2)-1)/(A*ts); % Defining the frequency axis for the frequency domain DSB modulated signal  -> normalize krne k lyai FFT use krte hain 
B_m=150;
h=fir1(40,[B_m*ts]); % defining a FIR filter of order 40 and cutoff frequency B_m*ts



%%% DSB modulation
fc=300;
mod1=m_sig.*cos(2*3.14*fc*t);
mod2=m_sig2.*cos(2*3.14*fc*t);
Mod1=fftshift(fft(mod1,A));  
Mod2=fftshift(fft(mod2,A));
Add=Mod1+Mod2;
plot(freqm,abs(Add));

