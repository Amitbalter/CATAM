mu = 4;
n= 50;
s = 1;
N = 25;
j = zeros(N,1);

for k = 1:N
    a = rand(n,1);
    b = rand(n,1);

    phi = 2*pi*a;
    v = -2*log(1-b);

    x = mu + s*sqrt(v).*cos(phi);

    xbar = sum(x)/n;
    I1 = xbar - 1.28/sqrt(n);
    I2 = xbar + 1.28/sqrt(n);
    if (I1 <= mu) && (mu<= I2)
        j(k) = 1;
    end
    fprintf('%.4f & %.4f & %.4f & %1g \\\\ \n', xbar, I1,I2, j(k));
end

sum(j)
    