function y=fourierseries1234

t=-11:0.001:11; 
a= -2;
b= 2;
T0=(b-a); % calculating  the total time period 
j =sqrt(-1);


func=@(t)(tri(t/2));
D0= 1/T0.*integral(func , a , b );

func1=@(t)(tri(t/2)).*exp(-j*2*3.142*(1/T0)*t);
D1= (1/T0).*integral(func1 , a , b );

func2=@(t)(tri(t/2)).*exp(-j*2*2*3.142*(1/T0)*t); % jn2pift
D2= 1/T0.*integral(func2 , a , b );

func3=@(t)(tri(t/2)).*exp(-j*3*2*3.142*(1/T0)*t); % jn2pift
D3=1/T0.*integral(func3 , a , b );

func4=@(t)(tri(t/2)).*exp(-j*4*2*3.142*(1/T0)*t); % jn2pift
D4=1/T0.*integral(func4 , a , b );

func5=@(t)(tri(t/2)).*exp(-j*5*2*3.142*(1/T0)*t); % jn2pift
D5=1/T0.*integral(func5 , a , b );

func6=@(t)(tri(t/2)).*exp(-j*6*2*3.142*(1/T0)*t); % jn2pift
D6=1/T0.*integral(func6 , a , b );

func7=@(t)(tri(t/2)).*exp(-j*-1*3.142*(1/T0)*t);
D1conj= 1/T0.*integral(func7 , a , b );

func8=@(t)(tri(t/2)).*exp(-j*-2*3.142*(1/T0)*t);
D2conj= 1/T0.*integral(func8 , a , b );

func9=@(t)(tri(t/2)).*exp(-j*-1*3.142*(1/T0)*t);
D3conj= 1/T0.*integral(func9 , a , b );

func10=@(t)(tri(t/2)).*exp(-j*-3*3.142*(1/T0)*t);
D4conj= 1/T0.*integral(func10 , a , b );

func11=@(t)(tri(t/2)).*exp(-j*-4*3.142*(1/T0)*t);
D5conj= 1/T0.*integral(func11 , a , b );

func12=@(t)(tri(t/2)).*exp(-j*-5*3.142*(1/T0)*t);
D6conj= 1/T0.*integral(func12 , a , b );

L =[D6conj D5conj D4conj D3conj D2conj D1conj D0 D1 D2 D3  D4  D5  D6 ] ; % storing all the elements in the array  -> take care of the fact explained below 
% as I have defined only twelve functions so we would get 13 values and the
% values should be increasing from negative to postivie 

n=-6:1:6;


figure(1)
stem(n , abs(L));
title("    absolute of L   ");
figure(2)
stem(n , angle(L));% calculates the angle theeta of the complex number 
title("    angle function   ");
end