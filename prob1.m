function y=new(t)
y=exp(-abs(t)/4).*(Unitstep(t)-Unitstep(t-4));

end