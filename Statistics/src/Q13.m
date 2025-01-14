%Program to generate a chi-squared distribution, defined as the sum of df
%normal squared variables

n = 100000;%sample size
df = 1000;%degrees of freedom
mu = 0;%mu
s = 1;%sigma

A = zeros(n,df);
for k = 1:df
    a = rand(n,1);
    b = rand(n,1);

    phi = 2*pi*a;
    v = -2*log(1-b);

    A(:,k) = mu + s*sqrt(v).*cos(phi);%normal distribution
end
A2 = A.^2;
X = zeros(n,1);
for k = 1:n
    X(k) = sum(A2(k,:));%Chi squared distribution
end

% subplot(1,3,3);
h3 = histogram(X,100);
h3.Normalization = 'probability';
% print('histogram_Q13_40','-depsc2');
% hold on