function FP = calcfp(P,T)
fp=0;
for i=1:20
    M=find(P==i);
    N=find(T==i);
    x = setdiff(N,M);
    if isempty(x)
    else
        fp = fp+size(x,1);
    end
end
FP = fp/size(P,1);
end
