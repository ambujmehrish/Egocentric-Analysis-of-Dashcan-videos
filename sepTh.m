function [C,D] = sepTh(Mat)
 M = Mat(:,1:20);
 N = Mat(:,21);
for i = 1:size(M,1)
    X = M(i,:);
   if i ==1
       C = X(N(i));
       x = setdiff(1:20,N(i));
       D = X(x)';
   else
       C = [C;X(N(i))];
       x = setdiff(1:20,N(i));
       D = [D;X(x)'];
   end

end