j =sqrt(-1);
a =-2;
b=2;
T = b-a;
t = -10:0.01:10;

myfun= @(t)(Triangle(t/2).*exp(-j*2*pi*(1/T)*t*0)); % using the function within a function.
D0 =(1/T)*integral(myfun , a  , b);

myfun1= @(t)(Triangle(t/2).*exp(-j*2*pi*(1/T)*t*1));
D1 =(1/T)*integral(myfun1 , a  , b);

myfun2= @(t)(Triangle(t/2).*exp(-j*2*pi*(1/T)*t*2));
D2 =(1/T)*integral(myfun2 , a  , b);

myfun3= @(t)(Triangle(t/2).*exp(-j*2*pi*(1/T)*t*-1));
D3 =(1/T)*integral(myfun3 , a  , b);

myfun4= @(t)(Triangle(t/2).*exp(-j*2*pi*(1/T)*t*-2));
D4 =(1/T)*integral(myfun4 , a  , b);

% omega summ
w =D0 +D1 +D2 +D3 +D4;