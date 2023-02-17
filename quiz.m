T =7;
Dt=0.01;
m=3;
t =0:Dt:T-Dt;
y =-1*exp(t/2).*sin(2*pi*t).*(Unitstep(t)-Unitstep(t-4));

E1 =sum(y.*conj(y))*Dt;
time=[];
y_periodic=[];
for i =-m:m
    time=[time i*T+t];    % concatenate
    y_periodic=[y_periodic y];
end

p=1/(max(time)-min(time))*sum(y_periodic*y_periodic')*Dt;
