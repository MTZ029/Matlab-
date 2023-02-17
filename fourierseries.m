function y=fourierseries
% bases vector -> multiple indpendent vectors 
% inline functoipon definiiton like python Func @ t(Trinagle(t/2)); % Func
% ka naam koi b rakh sktai hain
%g =Triangle(t/2);
a =2;
b=-2;
T=b-a;
t=[-10:0.001:10];
%H @t(triangle(t));
H =@(t)(Triangle(t/2));
D0 = (1/T).*integral(H , a, b);
y=D0;
end