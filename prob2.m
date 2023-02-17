y=exp(-abs(t)/2).*sin(2*pi*t).*(Unitstep(t)-Unitstep(t-4));
T=6;
dt=0.0001;
M=3;
t =[0:dt:T-dt];
time =[];
y_per =[];

for i=-M:M
    time=[time i*T+t];
    y_per=[y_per y];
end
figure(1);
plot(time , y_per);grid;

energy=sum(y.*conj(y))*dt;

power=sum(y_per.*conj(y_per).*dt)/(max(time)-min(time));

work=1/(max(time)-min(time)).*sum(y_per.*conj(y_per)).*dt;          % work done of the signal 