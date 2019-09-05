function [acc,classAcc] = accuracy_max(Q,N)
n = unique(Q(:,2));
a = 0;
f = 0;
fp = 0;
index = 1;
for i = 1:size(n,1)
    loc = find(Q(:,2) == n(i));
    X = Q(loc,1);
    Y = Q(loc,2);
    W = Q(loc,3);
    m = unique(W(:,1));
    p = 0;
    for j = 1:size(m,1)
       loc1 =  find(W(:,1) == m(j));
        for k=1:20
       A = X(loc1,1)==k;
       s(k) = sum(A(:));
        end
         maximum = calcmax(s,N);
         maxloc = find(s==maximum);
  %     orgFlb(index,1) = n(i);
       if maxloc== n(i)
           a = a+1;
           f = f+1;
           p = p+1 ;
   %        preFlb(index,1) = n(i);
           index = index+1;
       else
           f = f+1;
           fp = fp+1;
         %  preFlb(index,1) = maxloc;
           index = index+1;
           
       end
    end
 
    classAcc(i) = (p/size(m,1)*100);
end
tp = (a/f);
fn = 1-tp;
fp = (fp/f);
acc= 1-(fp+fn)/2;
acc = acc*100;
%FP = calcfp(preFlb,orgFlb);
end