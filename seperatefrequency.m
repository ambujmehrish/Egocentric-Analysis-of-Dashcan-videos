function [Z,F,S,L]=seperatefrequency(data,lb,sf)
n = sf;
for i =1:size(n,1)
    l = find(lb==n(i));
    X = data(l,:);
    for j =1:(size(X,1)/3)
        z(j,:) = X((3*j-2),:);
        f(j,:) = X((3*j-1),:);
        s(j,:) = X((3*j),:);
        lable(j,:) = i; 
    end
   if i == 1
       Z = z;
       F = f;
       S = s;
       L = lable;
   else
       Z = [Z;z];
       F = [F;f];
       S = [S;s];
       L = [L;lable];
   end
   clear z f s lable
end