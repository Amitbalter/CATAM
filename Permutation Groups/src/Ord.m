function O = Ord(A)
O = 1; %To start off the product
n = size(A,1); 
G = A; %The initial group
for i = 1:n
    Gs = Sims(G);
%   DM(Gs)
    orb = Orb(i,Gs);
%   size(orb,2)
    O = O*size(orb,2);
    if isempty(Stab(i,Gs))
        break
    else
        G = Stab(i,Gs); %Look at orbit of element i+1 under group of stabiliser of i
%       DM(G)
    end
end