
Dt=0.001;   %time interval
T=6;  % timer period
M=3;
t=0:Dt:T-Dt;
y=exp(-abs(t)/2).*sin(2*pi*t).*(Unitstep(t)-Unitstep(t-4));
time=[];
y_per=[];
for i=-M:M-1
    time=[time i*T+t];
    y_per=[y_per y];
end

figure(1)
plot(time , y_per);title("energy")

poweer=sum(y_per*y_per')*Dt/(max(time)-min(time)) % same as conjugate 

energy=sum(y.*conj(y))*Dt