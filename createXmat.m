function createXmat(datafld)
fld = dir(datafld);
fld = fld(3:end,:);
for i = 1:size(fld,1)
    matfl = dir([datafld,fld(i).name,'/*.mat']);
    for j = 1:size(matfl,1)
        load(matfl(j).name)
        for q = 1:size(k,3)
            temp = reshape(k(:,:,q),1,961);
            temp = [temp,j];
            Y(q,:) = temp;
            
        end
        if j==1
            X = Y;
        else
            X = [X;Y];
        end
        clear Y temp
    end
   save([datafld,fld(i).name,'/',fld(i).name,'_X.mat'],'X')
end

end