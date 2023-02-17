ts =1*10^(-4);

t =-0.5:ts:0.5;
Ta= 0.01;

mysig=sinc(2*t/Ta)+sinc(2*(t/Ta)-1)+sinc(2*(t/Ta)+1);


subplot(221); plot(t ,mysig);
axis(Trange)
title('original')

% wokring on the modulation of the amplitude 
Lfft =length(t);
Len_mysig=length(mysig);

%Now working on the speed of algorithm
Lfft =2^ceil(log2(Lfft));

% definning the frequency axis 
fre =(-Lfft/2:(Lfft/2)-1)/(Lfft*ts);  % frequncy axius 
cFre= 300; % cut off frequency

% making a filter 
h = fir1(40 ,(cFre*ts)); %LPF 


% Double side band modulation
fc =200; % carrier frequency 
A =mysig.*cos(2*pi*fc*t);
Lfft=length(t);
Lfft=2^ceil(log2(Lfft)+1);  % speeding factor  -> increasing the fft size by 2 
a =fftshift(fft(A , Lfft)); % fft shift to cnetralize the function
%frequncy
F=(-Lfft/2:(Lfft/2)-1)/(Lfft*ts);
subplot(222); plot(t ,A);
axis(Trange)
title('MOdulated')

%demodulation
A=mysig.*cos(2*pi*fc*t)*2 % Demodulationb begins by multiplying with the carrier
a=fftshift(fft(A,Lfft)); % Demodulatede signal in frequency domain

senator=filter(h,1,A)       % defining a filter 
Sen=fftshift(fft(senator,Lfft));  


subplot(223); plot(F,abs(a)); % frequcny

