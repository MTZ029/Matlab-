Ts=1/64;
T0=4;
N0=T0/Ts;
t=0:Ts:Ts*(N0-1);

signal=exp(-2*t).*Unitstep(t);


                     %%%   discounitnuity point   %%%
                     
d=0.5*Ts;
d1=y*Ts; %storing the values in a simple variable 
D1=[d,d1];
f=fft(D1);
i=ifft(f);

figure(1)
plot(t, signal );grid on;title("origianl sigal ");
j=sqrt(-1);
k=0:N0-1; % this is sort of a time 
w=2*pi*k/T0;   %2pifct

[alpha beta]=cart2pol(real(f) ,imag(f));       % this is the fouerier transform of the signal D1.

figure(2)
stem(w(1:32),alpha(1:32));title("    real part of  f   ");

figure(3)
stem(w(1:32),beta(1:32));title("   imaginary part of f");
