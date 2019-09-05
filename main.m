clear 
clc
close all
databaseFolder = '/home/ambuj/MVF/DFT_MVF/ForgeryDetection/Forged';
csvfilePath = '/home/ambuj/MVF/DFT_MVF/ForgeryCSV';
QfilePath = '/data/home/ambuj/MVF/DFT_MVF/Q/';
% [trainData, trainLables, testData, testLables] = loadDatabase('data');
[D, L,CarName] = loadDatabase(databaseFolder);
% [D, L] = loadPersonDatabase(databaseFolder);
n = unique(L(:,1));
windowSize = 5;
shift = 2;
sum = 0;
th = 0.6;
nitr  = 10;
noOfclass = 5;
index = 962;
sum1 = zeros(1,noOfclass);
for itr = 1:nitr
 for i = 1:size(n,1)
    loc = find(L == n(i));
    d = D(:,loc)';
    m = unique(d(:,index));
 for j = 1:size(m,1)
     loc1 = find(d(:,index) == m(j));
     T = d(loc1,1:(index-1))';
     [Mag,Pha] = computeDFT(T,windowSize,shift);
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
cd ..
disp('...............Training................')
%BaggedEnsemble = generic_random_forests(train_data,lb_train(:,1),450,'classification'); %Random Forest
% Mdl = fitcnb(train_data,lb_train(:,1),'DistributionNames','kernal','Kernel','normal'); % Naive bayes
disp(['Writting CSV Files : ',int2str(itr)])
csvtrainData = [csvfilePath,'/Iteration-',int2str(itr),'-TrainData-F.csv'];
csvtrainlb = [csvfilePath,'/Iteration-',int2str(itr),'-Trainlb-F.csv'];
csvtestData = [csvfilePath,'/Iteration-',int2str(itr),'-TestData-F.csv'];
csvtestlb = [csvfilePath,'/Iteration-',int2str(itr),'-Testlb-F.csv'];
csvfilelb = [csvfilePath,'/Iteration-',int2str(itr),'-Filelb-F.csv'];
csvwrite(csvtrainData,train_data)
csvwrite(csvtrainlb,lb_train)
csvwrite(csvtestData,test_data)
csvwrite(csvtestlb,lb_test)
csvwrite(csvfilelb,lb_files)
% cd ..
% cd('model')
  
%   [model] = trainmsvm(train_data,lb_train,'-m WW -k 1', 'mymsvm');
%   disp('...............Testing.................')
%  [labels, outputs] = predmsvm(model, test_data,lb_test);
%labels = predict(BaggedEnsemble,test_data);
% disp('...............Testing................')
% labels = predict(Mdl,test_data);
%q=zeros(size(labels,1),size(labels,2));
% q=str2double(labels);
% q = labels;
% Q(:,1) = q;
% Q(:,2) = lb_test;
% Q(:,3) = lb_files;
% [acc,classAcc] = accuracy(Q,th);
% sum = sum + acc ;
% sum1 = sum1 + classAcc;
% tempQfilename = [QfilePath,'/Q_MSVM_',int2str(itr),'.mat'];
% save(tempQfilename,'Q')
clear labels lb_test lb_files testloc trainloc test_data train_data z outputs model loc loc1 data T Q Mag Pha  m lbfiles lb_train lables i j k fv d BaggedEnsemble
end
% disp('Average Accuracy over 10 Iteration is')
% averageAcc = sum/nitr
% avgClassAcc = sum1/nitr
%  disp('  ');
% 	disp('>>> Perform a 5-fold cross validation:');
%  	disp('         [cv_error, cv_labels] = kfold(5, X, Y, ''-m WW -k 1'')');
% 	disp('  ');	disp('  ');
%  	[cv_error, cv_labels] = kfold(5, X, Y, '-m WW -k 1');
%  	disp(sprintf('Cross-validation error = %f (should be around 0.2)\n',cv_error));
%  	disp('''cv_labels'' can be used to compute other statistics than the mean error.');
 	