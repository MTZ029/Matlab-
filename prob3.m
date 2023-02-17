t=-20:0.0001:20
a =-2;
b=2;
To=(b-a);
j=sqrt(-1);

func =@(t)(tri(t/2));
D0=1/To.*integral(func ,a ,b);

func1 =@(t)(tri(t/2)).*exp(-j*2*pi*1/To*t);
D1=1/To.*integral(func1  , a , b)

func2 =@(t)(tri(t/2)).*exp(-j*2*2*pi*1/To*t);
D2=1/To.*integral(func2 , a , b)

func3 =@(t)(tri(t/2)).*exp(-j*3*2*pi*1/To*t);
D3=1/To.*integral(func3  , a , b);

func4 =@(t)(tri(t/2)).*exp(-j*4*2*pi*1/To*t);
D4=1/To.*integral(func4  , a , b);

func5 =@(t)(tri(t/2)).*exp(-j*5*2*pi*1/To*t);
D5=1/To.*integral(func5  , a , b);

func6 =@(t)(tri(t/2)).*exp(-j*6*pi*1/To*t);
D6=1/To.*integral(func6  , a , b)

func7=@(t)(tri(t/2)).*exp(-j*-1*2*pi*1/To*t);
Dcon1=1/To.*integral(func7 , a ,b );

func8=@(t)(tri(t/2)).*exp(-j*-2*2*pi*1/To*t);
Dcon2=1/To.*integral(func8 , a ,b );


func9=@(t)(tri(t/2)).*exp(-j*-3*2*pi*1/To*t);
Dcon3=1/To.*integral(func9 , a ,b );

func10=@(t)(tri(t/2)).*exp(-j*-4*2*pi*1/To*t);
Dcon4=1/To.*integral(func10 , a ,b );

func11=@(t)(tri(t/2)).*exp(-j*-5*2*pi*1/To*t);
Dcon5=1/To.*integral(func11 , a ,b );

func12=@(t)(tri(t/2)).*exp(-j*-6*2*pi*1/To*t);
Dcon6=1/To.*integral(func12 , a ,b );

talha=[ Dcon6 ,     Dcon5 , Dcon4    , Dcon3  , Dcon2  ,Dcon1 ,D0 ,D1, D2, D3 ,D4 D5, D6 ]
n=-12:2:12;


figure(1);stem(n , abs(talha));grid;
figure(2);stem(n, angle(talha));grid;