a1
% ploting  grapghs for cos(x) ,cos(2x), sin(2x),sin(x) respectively

q1 =cos(a1)
q5 =log(q1)

q2 =cos(2*a1)
q6=log(q2)

q3 =sin(a1)
q7=log(q3)

q4 =sin(2*a1)
q8=log(q4)
%subplot(rows,cloumns , plotnumber)


subplot(2,2,1)
title("1st plot of matlab")
plot(a1,q1)
xlabel("simple Values")
ylabel("Cosine")
axis([0,pi,-2.5,2.5]) % axis -> 0 and one is the value in y axis
hold on
plot(a1,q5)
legend("Cosine","Logarith")

subplot(2,2,2)
title("2nd plot of matlab")
plot(a1,q2)
xlabel("simple Values")
ylabel("Cosine2*x")
axis([0,pi,-2.5,2.5]) % axis -> 0 and one is the value in y axis
hold on
plot(a1,q6)
legend("Cosine2*x","Logarith")

subplot(2,2,3)
title("3rd plot of matlab")
plot(a1,q3)
xlabel("simple Values")
ylabel("Sine")
axis([0,pi,-2.5,2.5]) % axis -> 0 and one is the value in y axis
hold on
plot(a1,q7)
legend("Sine","Logarith")

subplot(2,2,4)
title("4th plot of matlab")
plot(a1,q4)
xlabel("simple Values")
ylabel("Sine*2x")
axis([0,pi,-2.5,2.5]) % axis -> 0 and one is the value in y axis
hold on
plot(a1,q5)
legend("Sine*2x","Logarith")
