function q =impulse(t)

q =exp(-abs(t)/4).*(u(t)-u(t-4));

end
function Q=u(t)
Q =(t>=0);
en