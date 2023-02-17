function [pow, energy]=power
% energy can only be caluclated of periodic function


Dt=0.0001; % sampling time 
T0=4;
M=4;

t=[-T0:Dt:T0]; % time period
y= 0.5*Rect(t);
time =[]; % empty array
t_period=[]; % using another array


for i=-M:M
    time=[time i*T0+t]; 
    t_period=[t_period y];
end



pow= ((sum(t_period.*conj(t_period))*Dt))/max(time)-min(time);
%energy=sum(y.*(y')).*Dt;
energy = sum(y.*conj(y)).*Dt;
figure(1);
plot(t , y);
    
figure(2);
plot(time , t_period);
axis([-20 20 0 1])




%y=exp(-abs(t)/4).*(Unitstep(t)-Unitstep(t-4));

% use the command window to change the valuye of t to 2*t and 2-2*t 

 
%xlabel("time axis")

end