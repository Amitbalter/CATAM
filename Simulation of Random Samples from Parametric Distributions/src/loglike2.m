function [L] = loglike2(x,t,n)
L = 2*n*log(t)+log(prod(x))-t*sum(x);
end