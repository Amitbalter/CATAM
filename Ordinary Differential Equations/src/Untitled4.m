fprintf('%10g, %5g', E(n+1), x(n+1));
z = log (abs(E));
g = gradient(z,h);
fprintf('%15g %3g', g(n+1), h 
plot(x,y);
hold on
plot(x,w);
plot(x,z)
