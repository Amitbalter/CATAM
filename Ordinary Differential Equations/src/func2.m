function [f] = func2(x1,x2,x3)
w = ;%omega
g = ;%gamma
f = zeros(2,1);
f(1) = x3;
f(2) = sin(w*x1)-x2-g*x3;
end
