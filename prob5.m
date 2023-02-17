Ts=1/64;
T0=4 ; % rattta
N0=T0/Ts;
t=0:Ts:Ts*(N0-1);
y=exp(-2*t).*Unitstep(t);
d=0.5*Ts;   % discountinuity point
d1=y*Ts;    % to store the aues in hte  array   
D1=[d,d1];
f=fft( D1 );
i=ifft(f);
figure(1);plot(t, y);title("  original signal  ");

j=sqrt(-1);
k=0:N0-1;
w=2*pi*k/T0;


[h, g]=cart2pol(real(f) , imag(f));


figure(4);stem(w(1:32),h(1:32));
figure(3);stem(w(1:32)   ,   g(1:32));title(" Imaginary ");
% manually caluclating the fourier transform
d=1./(j*w+2);   % as the foureire of given sigfnal is this 
[ga,gb]=cart2pol(real(d),imag(d));
figure(2);stem(w(1:32)   ,     h(1:32));title("  REAL  ");
hold on
plot(w(1:32),ga(1:32));
