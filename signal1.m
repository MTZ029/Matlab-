function y=signal1(t)
Dt=0.001; % sampling time 
T0= 4;
M=6;

t=-T0:Dt:T0; % time period
y= 0.5*Rect(t);
time =[]; % empty array
t_period=[]; % using another array


for i=-M:M
    time=[time i*T0+t]; 
    t_period=[t_period y];
end

figure(1);
plot(t , y);

figure(2);
plot(time , t_period);
axis([-20 20 0 1])


legend("simple" , "time axis ")


%y=exp(-abs(t)/4).*(Unitstep(t)-Unitstep(t-4));

% use the command window to change the valuye of t to 2*t and 2-2*t 

 
%xlabel("time axis")

end