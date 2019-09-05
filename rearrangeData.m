clear
close all
dataDIR = 'temp';
data = dir(dataDIR);
data = data(3:end,:);
 index = 1;
for i = 1:size(data,1)
    fldName = [data(i).folder,'/',data(i).name];
    file = dir(fldName);
    file = file(3:end,:);
   
    for j =1:size(file,1)
        fileName = [file(j).folder,'/',file(j).name];
        Y = load(fileName);
        k = Y.k;
        [~,~,p] = size(k);
        for l = 1:p
            temp = reshape(k(:,:,l),1,961);
            tempX(l,:) = temp;
            templb(l,1) = j;
            index = index +1;
        end
        if j ==1
            X = [tempX,templb];
        else
            W = [tempX,templb];
        X = [X;W];
        end
        clear temp tempX templb W
    end
    saveFileName = [fldName,'_X.mat'];
    save(saveFileName,'X')
    clear X  
end