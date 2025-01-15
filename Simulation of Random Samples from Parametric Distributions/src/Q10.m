mu = 0;
n= 10000;
s = 1;

a = rand(n,1);
b = rand(n,1);

phi = 2*pi*a;
v = -2*log(1-b);

x = mu + s*sqrt(v).*cos(phi);
y = mu + s*sqrt(v).*sin(phi);

h = histogram(x);
h.Normalization = 'probability';
print('histogram_Q10','-depsc2');
