Ta=0.01;
Ts=10^(-4);
t=-0.5:Ts:0.5;
m1=triplesinc(t,Ta);
m2=tri((t-0.1)/0.1)+tri((t+0.1)/0.1);
figure(1);
plot(t,m1);title("original plot of m1 ");grid on ;
figure(2);
plot(t,m2);title("original plot of m2 ");grid on ;

A=length(t);

A=2^ceil(log2(A));
M3=fftshift(fft(m1,A));                       
freqm=(-A/2:(A/2)-1)/(A*ts)
figure(3)
plot(freqm , M3)


A=2^ceil(log2(A));
M4=fftshift(fft(m2,A));                       
freqs=(-A/2:(A/2)-1)/(A*ts);
figure(4)
plot(freqs , M4);

fc=300;

Quad=(m1.*cos(2*pi*fc*t)+m2.*sin(2*pi*fc*t))
figure(5)
plot(t , Quad);title("    QUADRATURE AMPLITUDE MODULATION     ");grid on;

A=2^ceil(log2(A));
M5=fftshift(fft(Quad,A));                       
freqa=(-A/2:(A/2)-1)/(A*ts);
figure(6)
plot(freqa , M5);title("   FOURIER OF QUADRATUR      ");


%%%%%           DEMODULATION            %%%%%%%
Dem_m1=Quad*2.*cos(2*pi*fc*t);
B_m=150; %%%% cut offf frequency 

h=fir1(40,[B_m.*Ts]);


Dem_m2=Quad*2.*sin(2*pi*fc*t);



M11=filter(h,1,Dem_m1);
M22=fftshift(fft(M11,A));     % fourier transfrom

figure(7)
plot(t , M11);title(" DEM_____! ")

figure(8)
plot(freqm , M22);title("Fourier of Demodualtion  ");



%%%%%                     cut off frequency of 100  and fc 
B=150; %%%% cut offf frequency 
Fc=100;    %carrier frequency
h=fir1(40,[B.*Ts]);


Dem_m2=Quad*2.*sin(2*pi*Fc*t);



M12=filter(h,1,Dem_m1);
M33=fftshift(fft(M12,A));     % fourier transfrom

figure(9)
plot(t , 12);title(" DEM   for the variable cut frequency _____! ")

figure(10)
plot(freqm , M33);title("Fourier of Demodualtion of the cut frequency  ");