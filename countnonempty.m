function Z = countnonempty(X)
[m,n] = size(X);
c = 0;
for i = 1:m
    for j = 1:n
        if isempty(X{i,j})
        else
            c = c+1;
        end
        
    end
 Z(i) = c;
 c = 0;
 end
Z = Z';
end