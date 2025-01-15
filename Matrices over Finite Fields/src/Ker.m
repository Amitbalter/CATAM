%Finds the annhilator of a vector space

function Uo = Ker(M,p)

[Mp,l] = REF(M,p);
r = rk(Mp,p);%rank
m = size(Mp,1);%rows
n = size(Mp,2);%columns

g = []; %array of non-pivot columns
for j = 1:n
    if ~ismember(j,l)
        g = [g,j];
    end
end

L = [];%array of pivot columns without zeros
for h = l
    if h ~=0
        L = [L,h];
    end
end

Mpt = zeros(r,n);%last n-r rows of zeros removed off Mp Matrix
for i = 1:m
    if any(Mp(i,:))
        Mpt(i,:) = Mp(i,:);
    end
end

Uo = zeros(n-r,n);
h=1;%counter 
for i = g 
     x = zeros(1,n);
     for j = g
         x(j) = 0;
     end
     x(i) = -1;
     x(L) = Mpt(:,i);
     Uo(h,:) = x;
     h = h+1;
end