j=sqrt(-1);
a =2;
b=-2;
T=b-a;
t=[-10:0.001:10];
%H @t(triangle(t));
H =@(t)(Triangle(t/2));
D0 = (1/T).*integral(H , a, b);

% valyue for D1


H1 =@(t)(Triangle(t/2).*exp(-j*2*pi*1/T*t*1));
D1 =(1/T)*integral(H1 , a, b);

H2 =@(t)(Triangle(t/2).*exp(-j*2*pi*1/T*t*2));
D2 =(1/T).*integral(H2 , a, b);

H12 =@(t)(Triangle(t/2).*exp(-j*2*pi*1/T*t*-2));
D12 =(1/T).*integral(H12 , a, b);


H3 =@(t)(Triangle(t/2).*exp(-j*2*pi*1/T*t*3));
D3 =(1/T).*integral(H3 , a, b);

H13 =@(t)(Triangle(t/2).*exp(-j*2*pi*1/T*t*-3));
D13 =(1/T).*integral(H13 , a, b);


% put the valkues in the sum(Dn)exp(jn2pif0t)