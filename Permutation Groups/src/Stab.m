function S = Stab(a,A)
O = Orb(a,A); %Orbit of a with the witnesses
Y = Sims(A); %Generating set for the group
T = O(2:end,:); %Set of witnesses/representatives
Sg = []; %Set of stabilisers
for i = 1:size(T,2) %iterating through witnesses
    for j = 1:size(Y,2) %iterating through generators
        t = T(:,i); %witness
        y = Y(:,j); %generator
        z = Inv(Phi(a,Mul(y,t),A)); 
        s = transpose(Mul(Mul(z,y),t)); %using schreier's theorem
        Sg = [Sg,s];%concatenate s to S
    end 
end
S = Sims(Sg);