function  O  = Orb(x,S)
A = Sims(S);
n = size(A,1); %number of elements of X
O = [x;transpose(1:n)]; %top row orbit elements, under each a witness
m = size(O,2); %number of elements in orbit
k = size(A,2); %number of generators
i = 1; 
while i <= m %to run through the elements in the orbit
    for j = 1:k %to run through the generators
        d = A(O(1,i),j); %element in orbit
        if ~ismember(d,O(1,:)) 
           p2 = A(:,j); %Perm to get from x to the intermediate
           p1 = O(2:end,i); %Perm to get from the intermediate to d
           p = transpose(Mul(p2,p1)); %Perm to get from x to d
           c = [d;p]; %create column of element and witness
           O = [O,c]; %concatenate to O
           m = m+1; %increment size of orbit
        end
    end
    i = i+1; %go onto the next element in orbit
end