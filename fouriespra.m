function x=fouriespra(t)
Ts=1/64;
T0=4;
N0=T0/Ts;
t=0:Ts:Ts*(N0-1);
y=exp(-2*t).*Unitstep(t);
f =fft(y);
i=ifft(f);

j=sqrt(-1);
k=0:N0-1;
w=2*pi*k/T0;   %frequency

Gf=(1./2+w*j);% this is the manual fourieer transform 

y1 =0.5*Ts;

G=[y y1];   % discountinuity point
m=fft(G);
n=ifft(m);

[P ,Q]=cart2pol(real(G), imag(G));
[R, S ]=cart2pol(real(Gf),imag(Gf));


figure(1)
plot(t,y);title("  original Signal  ");
hold on 

figure(2)
stem(w(1:32) , P(1:32));
hold on 

figure(3)
stem(w(1:32) , Q(1:32));
hold on 

figure(4)
stem(w(1:32) , R(1:32));
hold on 

figure(5)
stem(t(1:32) , n(1:32));
hold on 



end

function L=U(T)
L = (T>=0);
T=0:0.005:5;
figure(6)
plot(T , U(T))
end

function L1 =R(t)
L1=(t>=-0.5 & t<=0.5);
plot(t, L1(t));
end