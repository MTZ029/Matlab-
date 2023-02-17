a =[1,2,3,4 ; 5,6,7,8 ; 9,10,11,12 ;13,14,15,16]
b =[1,2,3  ;  4,5,6 ;2, 9 , 0]
a1 =[1,2,3,4,5,6,7,8,9,10]
a2 =[1+2j , 2+2j ; 3+2j , 4+2j ;5+2j ,6+2j ; 7+2j,8+2j; 9+2j, 10+2j]
% we can also access the elements of the matrices.

a(1,1)=100
a(4,4)=4000
a(3,2) = 2200

% just remeber the indexes of the matrices with a11 ,a12 , a13 , a14 etc

% generalization can be also done with -> : mean all rows/ columns

% we want to change the elements of b into [100 , 180 , 900 ; 100 , 180 , 720 ; 100 , 180 ,140]
b(: , 1) = 900
b(: , 2)= 720
b(: , 3)= 140
b(1 , : )=100
b(2 , : )=180

% generating the random numbers with 4x4 mtrix
c =rand(4,4)
who
help whose
% This is the use of whos method that are useful in geting further
% information about any variable used/declared by us in the code

whos a

d =diag(a)
% simple sum of all the elements of the diagonality
e =sum(diag(a))

% f =diag(b) =200 -> error
f= randi(10 , 4)
 
g=diag(diag(a)) % simply prints the elements of the diagonality

b'

triu( a )
tril( b )

% simple size reduction
a
size(a)
a(: , 1)=[]
size(a)

% identity matrix
% same as python
h =eye(5 ,7)
j =ones(3,3)
i =zeros(2,2)

% simple log
k =log(a1)
k1 =log10(a1)  %  simple log with base 10

% default set of list 
l =0:0.1:5  % starting point:difference:ending point
L =linspace(0,5 ,0.01)   % why ?

abs(a1)
angle(a1)

% complex elements
a2

plot(a2)

% solving the equation -> y=x^2 +x+12
x =0:0.1:1
y=x.^2+x+12
y
