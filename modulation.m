ts=10^-4;  % sampling time

t=-0.04:ts:0.04;
Ta=0.01;

signal=triplesinc(t , Ta); % the function we defined vefore 
Lfft=length(t);
Lfft=2^ceil(log2(Lfft));

m_fre=fftshift(fft(signal , Lfft));
freqm=(-Lfft/2:Lfft/2-1)/(Lfft*ts)
     %%% double side band modulation       %%%
     
     
fc=300;
sig_dsb=signal.*cos(2*pi*fc*t);
Lfft=length(t);
Lfft=2^ceil(log2(Lfft)+1);
s_DSB =fftshift(fft(sig_dsb , Lfft));
freqs=(-Lfft/2:Lfft/2-1)/(Lfft*ts);

figure(1)
plot(t,signal)

figure(2)
plot(t, sig_dsb)

figure(3)
plot(freqm , abs(m_fre))

figure(4)
plot(freqs , abs(s_DSB))


        % demodulation
        
dem=sig_dsb.*cos(2*pi*fc*t)*2;
figure(5)
plot(t, dem);title("demodulation");