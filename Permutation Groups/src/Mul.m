function M = Mul(X1,X2)
n = length(X1);
M = zeros(1,n);
for i = 1:n
    k = X2(i);
    M(i) = X1(k);
end