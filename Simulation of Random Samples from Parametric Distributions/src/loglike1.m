function [L] = loglike1(x,m,n)
L = log(((log(2)./m).^n).*exp((-log(2)*sum(x)./m)));
end