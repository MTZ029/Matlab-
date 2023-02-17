Dt =0.0001;
T=4;
M =12;
t=[-T/2:Dt:T/2-Dt];

y=Triangle(t);

time =[];
y_per =[];
for i=-M:M
    time =[time i*T+t];
    y_per =[y_per y];
end
