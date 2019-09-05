% function [trainD, trainL, testD, testL] = loadDatabase(datafolderpath)
    function [D,L,CarName] = loadDatabase(datafolderpath)
 files = dir(datafolderpath);
 files = files(3:end,:);
cd(datafolderpath)
index = 1;
for i  = 1:size(files,1)
 cd(files(i).name)
 CarName{i} = files(i).name; 
%  trainFileName = strcat(files(i).name,'_X.mat');
%  testFileName = strcat(files(i).name,'Test.mat');
% FileName = strcat(files(i).name,'_X.mat');
 FileName = strcat('featured_',files(i).name,'_X.mat');
%  trainData = load(trainFileName);
% testData = load(testFileName);
 Data = load(FileName);
%  [~,m,~] = fileparts(trainFileName);
%  [~,n,~] = fileparts(testFileName);
%  [~,n,~] = fileparts(FileName);
%  trainMatrix = getfield(trainData, m);
%  testMatrix  = getfield(testData,n);
    Matrix = Data.X;
%  trainLables = (i-2)* ones(size(trainMatrix,1),1);
%  testLables = (i-2)*ones(size(testMatrix,1),1);
 Lables = (i)*ones(size(Matrix,1),1);
 if index == 1
%  trainD = getfield(trainData, m);
%  testD  = getfield(testData,n);
%  trainL = trainLables;
%  testL = testLables;
   D = Data.X;
   L = Lables;
 else
%      trainD = [trainD;trainMatrix];
%      testD = [testD;testMatrix];
%      trainL = [trainL;trainLables];
%      testL = [testL;testLables];
     D = [D;Matrix];
     L = [L;Lables];
 end

index = index +1;
cd ..
end
% trainD = trainD';
% testD = testD';
D = D';
end