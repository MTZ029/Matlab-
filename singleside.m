ts=10^-4;

t=-0.04:ts:0.04;

fc=300; % carreir frequency 

m_sig=tri((t+0.01)/0.01)-tri((t-0.01)/0.01);

lm=length(m_sig);      %  lenght of the signal 

Lfft=length(t);
Lfft=2^ceil(log2(Lfft));
m_fre=fftshift(fft(m_sig , Lfft));
freqm= [-Lfft/2 :Lfft/2-1 ]/(Lfft*ts);
b_m=150 ; 

h=fir1(40 , [B_m*ts]);

figure(1)
plot(t , m_sig);title("original signal ");grid on;
                           % modulation
s_mod=m_sig.*cos(2*pi*fc*t);


S_MOD=fftshift(fft(s_mod , Lfft));



                           % ssc 
                          
L_isb=floor(fc*ts*Lfft);     % lower side band 
ssbfilt=ones(1 ,Lfft);

ssbfilt(Lfft/2-L_isb+1:Lfft/2+L_isb)=zeros(1 , 2*L_isb);
S_ssb=S_MOD.*ssbfilt;        % the fourier transform is checked!
s_ssb=real(ifft(fftshift(S_ssb)));     % inversoe

s_ssb=s_ssb(1:lm);       % we would convert this signal to demodulation


                           %demodulation
                           
s_dem=s_ssb.*cos(2*pi*fc*t)*2;
S_dem=fftshift(fft(s_dem , Lfft));




% filter

S_fil=filter(h,1,s_dem);
F1=fftshift(fft(S_fil  , Lfft));


figure(2)
plot(t, s_ssb);title("   single side band modulation      " );grid on;

figure(3)
plot(t ,s_dem );title("   Demodulated signal "); grid on;

figure(4)
plot(t ,S_fil);title("Filtered signal in time domain"); grid on %;axis([-0.005  0.005  0 inf ]);

figure(5)
plot(freqm , abs(m_fre));title("  message spectrum " );grid on;

figure(6)
plot(freqm , abs(S_ssb));title("  single side band spectrum");grid on;


figure(7)
plot(freqm , abs(S_dem));title("Demodualted signal ");grid on;

figure(8)
plot(freqm ,abs(F1) );title("After applying filter " );grid on;
