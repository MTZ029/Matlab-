Ta=0.01;
Ts=10^(-4);
t=-0.04:Ts:0.04;
m1=Rect((t-0.1)/0.1)+Rect((t+0.1)/0.1);
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

Quad=(m1.*cos(2*pi*fc*t))+(m2.*sin(2*pi*fc*t));
figure(5)
plot(t , Quad);title("    QUADRATURE AMPLITUDE MODULATION     ");grid on;

A=2^ceil(log2(A));
M5=fftshift(fft(Quad,A));                       
freqa=(-A/2:(A/2)-1)/(A*ts);
figure(6)
plot(freqa , M5);title("   FOURIER OF QUADRATUR      ");


%%%     filter being applied  %%
B=150;
H=fir1(40,2*[B.*Ts]);
app=filter(H  , 1 , Quad);
plot(t , app);title("    FILLTER APPLIED OF 2B   ");grid on;

%%%%%           DEMODULATION            %%%%%%%
Dem_m1=Quad*2.*cos(2*pi*fc*t);
B_m=150; %%%% cut offf frequency 

h=fir1(40,[B_m.*Ts]);


Dem_m2=Quad*2.*sin(2*pi*fc*t);



M11=filter(h,1,Dem_m1);
M22=fftshift(fft(M11,A));     % fourier transfrom

figure(7)
plot(t , M11);title(" FILTER 1_____! ")

figure(8)
plot(freqm , M22);title("Fourier of Demodualtion  ");



%%%%%                     cut off frequency of 100  and fc 
B=150; %%%% cut offf frequency 
Fc=300;    %carrier frequency
h=fir1(40,[B.*Ts]);


Dem_m2=Quad*2.*sin(2*pi*Fc*t);


M12=filter(h,1,Dem_m1);
M33=fftshift(fft(M12,A));     % fourier transfrom

figure(9)
plot(t , M12);title(" filter 2 _____! ")

figure(10)
plot(freqm , M33);title("Fourier of Demodualtion of the cut frequency  ");
