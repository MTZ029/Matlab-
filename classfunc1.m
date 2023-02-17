dt =0.004;
T=2;
m =5;
t=[-T/2:dt:T/2-dt];

y =Unitstep(t);

time=[];
y_periodic=[];

for i =-m:m
    time=[time i*T+t];
    y_periodic=[y_periodic y];
end