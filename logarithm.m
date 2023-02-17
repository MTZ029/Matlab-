% a =0 : 0.1 : 1
% 
% b =exp(a)
% b1 =exp(a*2)
% b2 =exp(a*3)
% plot(a , b) 
% hold on 
% plot(a , b1)
% hold on
% plot(a ,b2)
% legend('exponential' , 'square' , 'Cube')
% xlabel('X-Axis')
% ylabel('Y-axis')
% title('My Grapgh')



% now taking the logarithmic function
% loglog(a)
 c =logspace(5,10,11) % Space for logarithm
 c1 =logspace(0,10,11)
% grid on
% loglog(c , exp(c))

% what if we want to set the logarithmic values in x or y asxis we can do
% that as follows:

%semilogx(c , c1)  %logarithmic values in x-axis
%semilogy(c , c1)

d =logspace(1,4,10)
e=logspace(5,9,10)
%semilogy(d,e)
semilogx(d,e) % simple
grid on

f=linspace(1,4,9)
g =linspace(5,10,9); %Not printed in the command value 

print("The value is")

