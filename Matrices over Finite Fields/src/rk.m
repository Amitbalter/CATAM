%Finds the rank of a vector space

function rank = rk(M,p)
M = REF(M,p);
rank = 0;
for i = 1:size(M,1)
    if ~all(M(i,:) == 0)
        rank = rank +1;
    end
end