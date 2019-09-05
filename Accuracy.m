function [acc,classAcc] = Accuracy(Q,th)
n = unique(Q(:,2));
a = 0;
f = 0;
for i = 1:size(n,1)
    loc = find(Q(:,2) == n(i));
    X = Q(loc,1);
    Y = Q(loc,2);
    W = Q(loc,3);
    m = unique(W(:,1));
    p = 0;
    for j = 1:size(m,1)
       loc1 =  find(W(:,1) == m(j));
       A = X(loc1,1)==Y(loc1,1);
       s = sum(A(:))/size(A,1);
       
       if s > th
           a = a+1;
           f = f+1;
           p = p+1 ;
       else
           f = f+1;
       end
    end
    classAcc(i) = (p/size(m,1)*100);
end
acc = (a/f)*100;
end