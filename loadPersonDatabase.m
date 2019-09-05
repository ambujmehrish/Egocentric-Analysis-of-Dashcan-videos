function [D,L] = loadPersonDatabase(datafolderpath)
X = dir(datafolderpath);
X = X(3:end);
for i = 1:size(X,1)
    d = load(X(i).name);
    d = d.K;
    if i == 1
        D = d(:,1:10);
        L = d(:,11);
    else
        D = [D;d(:,1:10)];
        L = [L;d(:,11)];
    end
end
D = D';
end