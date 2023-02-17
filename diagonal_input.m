z =[9,8,7 ; 6,5,4 ; 3,2,1]

z2 =diag(z)
z3 =sum(diag(z))
z4 =diag(diag(z))
% for changin the diagonal elements

for x =1:length(z)
    for y =1:length(z)
        if x==y
            z(x,y) = 10
        else
            z(x,y)=999
        end
        
    end    
end

for a=1:length(z)
    for b=1:length(z)
     if a==1 & b==1
         z(a,b)=1
     elseif a==2 & b==2
             z(a,b)=2
     elseif a==3 & b==3 % note that wre dont use neted if loop instead we use elseif statment for this purpose
                 z(a,b)=3
      
end
end
end  


z

sum(diag(z))
x =input("Enter the value please ")