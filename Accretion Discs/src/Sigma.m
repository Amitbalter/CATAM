X1 = 0.02; Xm = 2; dX = X1; nX = (Xm - X1)/dX +1;
X = (X1:dX:Xm);
T1 = 0; Tm = 1; dT = 0.0000005; nT = round((Tm-T1)/dT+1);
T = (T1:dT:Tm);
eta = 1;
sig = zeros(nT, nX);
sig(:,1) = zeros(nT,1);
sig(:,nX) = zeros(nT,1);
sig(1,:) = exp(-1000*(X-1).^2);
f = 4*sig.*X.^3.;
g = 3*eta*sig.*X;
D = dT/((dX)^2);
for i = 1:nT-1
    for j  = 2:nX-1
       f(i+1,j) = f(i,j)+ D*(g(i,j+1)-2*g(i,j)+g(i,j-1));%difference equation
       g(i+1,j) = 3*eta*f(i+1,j)/(4*X(j)^2);
       sig(i+1,j) = f(i+1,j)/(4*(X(j))^3);
    end
end