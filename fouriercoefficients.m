t=-15:0.0001:15;
a=-2;
b=2
T0=(b-a);

j=sqrt(-1);
 
func=@(t)(tri(t/2));   % definig the funcitionm
D0=1/T0.*integral(func , a , b);

func1=@(t)(tri(t/2)).*exp(-j*1*2*3.142*(1/T0)*t);
D1=1/T0.*integral(func1 ,a , b);

func2=@(t)(tri(t/2)).*exp(-j*2*2*3.142*(1/T0)*t);
D2=1/T0.*integral(func2 ,a , b);

func3=@(t)(tri(t/2)).*exp(-j*3*2*3.142*(1/T0)*t);
D3=1/T0.*integral(func3 ,a , b);

func4=@(t)(tri(t/2)).*exp(-j*-1*2*3.142*(1/T0)*t);
D1con=1/T0.*integral(func4 ,a , b);

func5=@(t)(tri(t/2)).*exp(-j*-2*2*3.142*(1/T0)*t);
D2con=1/T0.*integral(func5 ,a , b);

func6=@(t)(tri(t/2)).*exp(-j*-3*2*3.142*(1/T0)*t);
D3con=1/T0.*integral(func6 ,a , b);

X=[D3con D2con D1con D0 D1 D2 D3];

n=-3:1:3;

figure(1)
stem(n, abs(X));title("absolute of X");

figure(2)
stem(n, angle(X));title("angle of X");

figure(3)
plot(n, abs(X));title("original signal from the coefficeints" );
