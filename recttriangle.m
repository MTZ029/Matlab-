ts =0.0001;
t=-.08:ts:.08;

fc =500; %carreir frequency
%y =plot(Rect((t-0.02)/0.02) + tri((t + 0.02)/0.02));

Lfft=length(t);
Lfft=2^ceil(log2(Lfft));

my_sig =Rect((t-0.02)/0.02) + tri((t + 0.02)/0.02);

L=length(my_sig);

F_signal=fftshift(fft(my_sig,Lfft));

freqm=(-Lfft/2:Lfft/2-1)/(Lfft*0.001); % Defining the frequency axis for the frequency domain DSB modulated signal

%plot(F_signal , freqm);
%plot(freqm , abs(F_signal));title("Frequency responce");

% now working on modulated signal 
% amplitude modulation
s_am =(1+my_sig).*cos(2*pi*fc*t);
Lfft =length(t);
Lfft=2^ceil(log2(Lfft));
S_am=fftshift(fft(s_am,Lfft ));
freqs=(-Lfft/2 :Lfft/2-1)/(Lfft*ts);
subplot(2,1,1);
plot(s_am)
subplot(2,1,2);
plot(freqs,abs(S_am));

% amplitude demodulation
h =fir1()
s_dem =filter(h,l,s_dem);
%Lfft =length(t);
%Lfft=2^ceil(log2(LFFT)+1);


