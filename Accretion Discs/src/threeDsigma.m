n = 50;
S = zeros(n,n);
Ti = zeros(1,n);
Xne = zeros(1,n);
for i = 0:n-1
   for j = 0:n-1
       S(i+1,j+1) = sig(i*(nT-1)/(2*n)+1,2*j+1);
   end
   Ti(i+1) = T(i*(nT-1)/(2*n)+1);
   Xne(i+1) = X(2*i+1);
end
[X2,X1] = meshgrid(Xne,Ti);
surf(X2,X1,S)