function I = Inv(X)
n = length(X);
I = zeros(1,n);
for i = 1:n
    for j = 1:n
        if X(j) == i 
            I(i) = j;
            break
        end
    end  
end