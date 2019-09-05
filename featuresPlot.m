clear 
close all
load('train_data')
load('test_data')
load('lb_train')
load('lb_test')
for i = 1:20
    X = train_data(find(lb_train(:,1)==i),:);
    for j=1:(size(X,1)/3)
        if j==1
    F0=X(2*j-1,:);
    F1=X(2*j,:);
    F2=X(2*j+1,:);
        else
              F0=[F0,X(2*j-1,:)];
              F1=[F1,X(2*j,:)];
              F2=[F2,X(2*j+1,:)];
        end
    end
    
    
end