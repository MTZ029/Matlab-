Dt=0.0001;  % samoling time 
T0= 4;
M=4;

t=-T0:Dt:T0;

y=exp(-t).*sin(10*pi*t).*[Unitstep(t)-Unitstep(t-4)];

time=[ ];
y_per=[ ];

for i=-M:M
    time=[time i*T0*t];
    y_per=[y_per y];
end

energy=sum(y.*conj(y)).*Dt;

powar1=(sum(y_per.*conj(y_per))*Dt)/max(time)-min(time);

figure(1)
plot(t,y(t));grid;
figure(2)
plot(time , y_per);grid;

ramp=t.*Unitstep(t);
figure(3)
plot(t,ramp);grid;


function u=powar

 u = t==0;
end