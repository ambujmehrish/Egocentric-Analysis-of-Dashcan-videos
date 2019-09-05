function  G = createDataMatrix(data,lables)
nc = unique(lables(:,1));
index = 1;
for i =1:size(nc,1)
    loc = find(lables(:,1)==i);
    X = data(loc,:);
    fl = lables(loc,2);
    nf = unique(lables(loc,2));
    for j = 1:size(nf,1)
        loc1 = find(fl == j);
        tempF = X(loc1,:);
        Mpca = pcaFeatures(tempF);
        d = Mpca'*tempF;
        X{index,1} = double(d);
        y(index,1) = i;
        index = index+1;
    end
   
end
G.X = X;
G.y = y;

end