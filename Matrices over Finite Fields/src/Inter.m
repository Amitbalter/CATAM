%Finds the intersection of two vector spaces

function I = Inter(V,W,p)
Vo = Ker(V,p);
Wo = Ker(W,p);
Intero = Sum(Wo,Vo,p);
I = REF(Ker(Intero,p),p);