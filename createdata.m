function [data,lables] = createdata(Files,index,class)
tempData = Files(index);
for i = 1:size(tempData,2)
    temp = tempData{1,i};
    if i ==1
        data = temp;
    else
        data = [data;temp];
    end
end
lables(1:size(data,1)) = class;
end