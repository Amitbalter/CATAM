function [f] = func3(x1,x2,x3)
d = 3;%delta
f = zeros(2,1);
f(1) = x3;
f(2) = sin(x1)-x2-(d^3)*(x2)^2*x3;
end