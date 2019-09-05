function [data]= selectData(X,class,loc)
    t = X{class,loc};
    data = t';
end