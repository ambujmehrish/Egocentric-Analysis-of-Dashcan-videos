clear 
close all
databaseFolder = '/home/ambuj/MVF/DFT_MVF/data-RNN/data';
[D, L,CarName] = loadDatabase(databaseFolder);
% [D, L] = loadPersonDatabase(databaseFolder);
n = unique(L(:,1));
sum = 0;
th = 0.6;
nitr  = 1;
noOfclass = 17;
index = 5001;
sum1 = zeros(1,noOfclass);
for itr = 1:nitr
 for i = 1:size(n,1)
    loc = find(L == n(i));
    d = D(:,loc)';
    m = unique(d(:,index));
 for j = 1:size(m,1)
     loc1 = find(d(:,index) == m(j));
     T = d(loc1,1:(index-1))';
     Mag = T;
     lables{i,j} = n(i)*ones(size(Mag,2),1);
     fv{i,j} = Mag;
end
 end
 z = countnonempty(fv);
for i = 1:size(fv,1)
    if z(i)>3
    trainloc = randperm(z(i),3);
    testloc = setdiff(1:z(i),trainloc);
    else
    trainloc = randperm(z(i),2);
    testloc = setdiff(1:z(i),trainloc);
    end
    for j = 1:size(trainloc,2)
        [data] = selectData(fv,i,trainloc(j));
        lables = i*ones(size(data,1),1);
        lables(:,2) = j*ones(size(data,1),1);
        if j == 1 && i == 1
            train_data = data ;
            lb_train = lables;
        else
            train_data = [train_data;data];
            lb_train = [lb_train;lables];
        end
        
    end
    for k = 1:size(testloc,2)
        [data] = selectData(fv,i,testloc(k));
        lables = i*ones(size(data,1),1);
        lbfiles = k*ones(size(data,1),1);
        if k == 1 && i == 1
            test_data = data ;
            lb_test = lables;
            lb_files = lbfiles;
        else
            test_data = [test_data;data];
            lb_test = [lb_test;lables];
            lb_files = [lb_files;lbfiles];
        end
        
    end
end
disp('...............Training.................')
BaggedEnsemble = generic_random_forests(train_data,lb_train(:,1),450,'classification'); %Random Forest
disp('...............Testing.................')
labels = predict(BaggedEnsemble,test_data);
q=zeros(size(labels,1),size(labels,2));
q=str2double(labels);
%q = labels;
Q(:,1) = q;
Q(:,2) = lb_test;
Q(:,3) = lb_files;
[acc,classAcc] = accuracy(Q,th);
sum = sum + acc ;
sum1 = sum1 + classAcc;
clear labels lb_test lb_files testloc trainloc test_data train_data z outputs model loc loc1 data T Q Mag Pha  m lbfiles lb_train lables i j k fv d BaggedEnsemble
end
disp('Average Accuracy over 10 Iteration is')
averageAcc = sum/nitr
avgClassAcc = sum1/nitr