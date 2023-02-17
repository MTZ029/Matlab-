function y = boxfunction(t)
Ts=1/64; %sampling time 
y =exp(-2*t).*Unitstep(t);
To =4 ; %sampling time 
No =To/Ts;
t=0:Ts:Ts*(No-1);



end