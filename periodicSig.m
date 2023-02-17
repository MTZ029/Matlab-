Dt =0.00001;
T=4;
M =6;
t=[-T/2:Dt:T/2-Dt];

y=0.25*Rect(t);

time =[];
y_per =[];
for i=-M:M
    time =[time i*T+t];
    y_per =[y_per y];
end
