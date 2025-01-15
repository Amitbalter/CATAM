%This is a program to find the inverses of the integers mod p

function I = In(p)

I = zeros(p-1,1);
for a = 1:p-1
    for b = 1:p-1
        if mod(a*b,p)==1
            I(a) = b;
            %fprintf('%2g & %2g \\\\ \n',a ,b);
            break
        end
    end
end