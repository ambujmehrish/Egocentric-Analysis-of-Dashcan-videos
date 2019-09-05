function X = addLable(Y,ratio)
[m,n] = size(Y);
noF = m/ratio;
for i = 1:noF
    l = i*ones(ratio,1);
    if i == 1
        tempL = l;
    else
        tempL = [tempL;l];
    end
end
X(:,1:n) = Y;
X(:,n+1) = tempL;
end