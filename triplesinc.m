

function x=triplesinc(t,Ta)
%t=-0.4:0.00001:0.4;
%Ta=0.01;
sinc_1=sinc(2*t/(Ta));

sinc_2=sinc(2*t/(Ta-1));

sinc_3=sinc(2*t/(Ta+1));

x=sinc_1+sinc_2+sinc_3;

%plot(t  , y ); grid on;
end