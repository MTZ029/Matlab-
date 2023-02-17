clear all  % to run the values smaller than 11, we use clear all to get the indices ready.
j =sqrt(-1);
a =-2;
b=2;
T = b-a;
N=3;
%t=-2:0.01:2; 

Func =@(t)(Triangle(t/2));
D(N+1)=(1/T)*integral(Func , a, b);
for i=1:N
    Func =@(t)(exp(-j*2*pi*t*(i/T))).*Triangle(t/2);
    D(i+N+1)=(1/T)*integral(Func ,a ,b);
    Func =@(t)(exp(j*2*pi*t*((N+1-i)/T))).*Triangle(t/2); % do on th enotebeook
   
    D(i)=(1/T)*integral(Func,a,b);
end
figure(1);
subplot(211);s1=stem([-N:N],abs(D));
set(s1,'Linewidth',2);
ylabel('|{\it D}_{\it n}|');
title('Amplitude of {\it D}_{\it n}') 
subplot(212);s2=stem([-N:N],angle(D));
set(s2,'Linewidth',2); 
ylabel('<{\it D}_{\it n}');
title('Angle of {\it D}_{\it n}');

n =-N:N;
k =0;

for t=-2:0.01:2
    k=k+1;
    fapprox(k)=sum(D.*exp(j*n*2*pi*t/T))
end

t=-2:0.01:2;

figure(2);
plot(t,fapprox,t,Triangle(t/2));

fft(Triangle(t/2));
plot(fft(Triangle(t/2)),ifft(Triangle(t/2)));