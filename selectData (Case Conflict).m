function [Data,Lables] =  SelectData(data, lables)
m = size(lables,2);
n = size(data,2);
tempLable = 1;
l = 0;
for i=1:m
  index = find(data(:,n) == lables(i));
   for j = 1:size(index,1)
      l = l+1 ; 
      Data(l,:) = data(index(j),1:n-1);
      Lables(l,1) = tempLable ;
  end
  tempLable = tempLable + 1;
end
