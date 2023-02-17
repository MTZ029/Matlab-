t= -8:0.01:8;
y=exp(-abs(2*t)/4).*(Unitstep(2*t)-Unitstep(2*t-4));

plot(t , y); 
xlabel("time axis")

