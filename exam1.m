function y=exam1(t)



y=exp(-abs(t)/4).*(Unitstep(t)-Unitstep(t-4)); % note that we are required to check for the sampling time in the command window 


end