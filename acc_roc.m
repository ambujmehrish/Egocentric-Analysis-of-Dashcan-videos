function [a,TP,FP] = acc(C,D,th)
if size(C,2)>size(C,1)
    C = C';
end
if size(D,2)>size(D,1)
    D = D';
end
count=0;
count1=0;
X=C>th;
Y=D>th;
for i=1:size(X,1)
    if X(i,1)
        count=count+1;
    end
end

for i=1:size(Y,1)
    if Y(i,1)
        count1=count1+1;
    end
end
FP=count1/size(Y,1);
FN=(size(X,1)-count)/size(X,1);
TP = 1-FN;
a= 1-(FP+FN)/2;


end