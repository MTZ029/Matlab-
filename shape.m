
function y=shape(t)

%y=-1*(t<-0.5 & t>-2)+2*(t>2 & t<2.5);

y=(1-abs(t)).*(t>-2).*(t<-0.5)
end