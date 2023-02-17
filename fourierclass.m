% fourier transform
j =sqrt(-1);
Ts =1/64;   % sampling time
T0 = 4;     % time on eperiod
N0 =T0 /Ts;   % number of samples in one period.

t=0:Ts:Ts*(N0-1);

g =Ts.*exp(-2*t).*Unitstep(t);   % to conert to digital

g(1) =Ts*0.5;

ff =fft(g);

ifg=ifft(ff); %apporximate

[GP , GM]=cart2pol(real(ff) , imag(ff));

k= 0:N0-1 ;

w =2*pi*1/T0;

vect = k/(N0*Ts);

subplot(211);
stem(vect(1:32),GM(1:32),'b');grid;
title('MAgnitude')
subplot(212);
stem(vect(1:32),GP(1:32),'b');grid;
title('Phase')


% calculating theoratical G(f)


hold on 

G =1./(g+j*2*pi*vect);

[G1 ,G2 ]=cart2pol(real(G) ,imag(G));
subplot(211);
stem(vect(1:32),G2(1:32),'b');grid;
subplot(212);
stem(vect(1:32),G1(1:32),'b');grid;