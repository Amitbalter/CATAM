function A = Sims(X)
n = size(X,1); %number of elements of X
k = size(X,2); %number of given generators
P = zeros(n^2,n); %Array of permutations
A = []; %Array of generators
for m  = 1:k %go through the permutations
    p = X(:,m);
    for i = 1:n %go through each element
        if p(i) ~= i
            if P(n*(i-1)+1,p(i)) == 0 %if entry is empty
                P(n*(i-1)+1:i*n,p(i)) = p;
                A = [A,p]; %add to list of generators
                break
            else
                g = P(n*(i-1)+1:i*n,p(i)); 
                p = transpose(Mul(Inv(g),p)); %change value of p 
            end
        end
    end
end