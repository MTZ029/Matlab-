T =6;
Dt =0.005;
t=0:Dt:T-Dt;
g=exp(-abs(t/2)).*sin(2*pi*t).*(Unitstep(t)-Unitstep(t-4));
x=-(Unitstep(t)-Unitstep(t-5));

E1 =sum(g.*conj(g))*Dt; % -> energy of g1
E2 =sum(x.*conj(x))*Dt;  % -> enerdy of x1
W =(1/E1*E2)*sum(g.*conj(x))*Dt;

G=exp(-t).*(Unitstep(t)-Unitstep(t-5));
X=sin(2*pi*t).*(Unitstep(t)-Unitstep(t-5));
E3 =sum(G.*conj(G))*Dt;
E4 =sum(X.*conj(X))*Dt;
W1 =(1/E3*E4)*sum(G.*conj(X))*Dt;

%p=1/(max(time)-min(time))*sum(y_per*y_per')*Dt
