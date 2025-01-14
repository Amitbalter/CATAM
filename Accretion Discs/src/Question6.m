a = 7;%bounds
b = 95;
for i  = [2,8,32,128,512]
    plot(X(a:b).^2,V(2000*i+1,a:b));
    hold on
end