a =2;
b=-2;
T=b-a;
t=[-10:0.001:10];
%H @t(triangle(t));
H =@(t)(Triangle(t/2));
D0 = (1/T).*integral(H , a, b);
y=D0;