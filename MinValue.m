function [min , index] = MinValue(arr)
min =arr(1);
index =1;  % simply saying that the 1st thing in the array is the smallest 
for i=2:length(arr)
    if (min>arr(i))
        min =arr(i)
        index = i
    end

    
    
end


end