for i  = [2,8,32,128,512]
    plot(X.^2, sig(2000*i+1,:));
    hold on
end
