function y=prob4(t)
t=-5:0.1:5;
y = 0.81*square(t);
y1=0.81*(square(-t));
subplot(221);plot(t, y);
subplot(222);plot(t,y1)
end
