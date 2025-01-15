%Finds the sum of two vector spaces

function S = Sum(V,W,p)
D = [V;W];
S = REF(D,p);
