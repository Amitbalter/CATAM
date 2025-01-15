%This is a program to convert a matrix into Reduced Row Echelon Form 

function [Mp,l] = REF(M,p)

Mp = mod(M,p);
m = size(Mp,1);%rows
n = size(Mp,2);%columns
I = In(p);%Inverses
l = zeros(1,m);

for i = 1:m
    for j = 1:n %Reorders rows
        if all(Mp(i:m,j) == 0) %checks if the column j from row i to m is zero
            continue
        else
            l(i) = j; %constructs vector l, the array of pivot columns
            for k = i:m
                if Mp(k,j) ~= 0 %finds a non-zero entry
                    Mp([i,k],:) = Mp([k,i],:); %swaps rows k and i
                    break
                end
            end    
            break
        end
    end  
    if l(i) == 0 %checks if process has finished
        break
    end
    Mp(i,:) = mod(I(Mp(i,l(i)))*Mp(i,:),p); %makes leading entry 1
    for h = i+1:m
        Mp(h,:) = mod(-1*Mp(h,l(i))*Mp(i,:)+Mp(h,:),p); %cancels out rows below leading entry
    end
end
for i = 2:m %cancels out rows above leading entry
    if l(i) ~= 0
        for k = 1:i-1
            Mp(k,:) = mod(-1*Mp(k,l(i))*Mp(i,:)+Mp(k,:),p);
        end
    else
        continue
    end
end

