function T = Triangle(t)
%a =input("enter the amplitude ");
%T =a.*((1+t)&(1-t));
%T =(1-abs(t));
T =(1-abs(t)).*(t<2).*(t>-2);

end

% periodicity -> The periodic function is used for the larger instances.
% second thing we need is sampling time.
% plot a periodic function -> T -> time period
% -> M=-> Number of samples (-m,m)
%-> Dt -> sampling
 