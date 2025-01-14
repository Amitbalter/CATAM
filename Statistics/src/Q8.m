n = 10;
t = 2.2; %theta
k = zeros(1,200);

for l = 1:200
    u = rand(n,1);
    x = real((-1/t)*(lambertw(-1,(u-1)/exp(1))+1));
    k(l) = 2*n/sum(x); %theta hat
end
h = histogram(k);
h.Normalization = 'probability';
print('histogram_Q8_10','-depsc2');