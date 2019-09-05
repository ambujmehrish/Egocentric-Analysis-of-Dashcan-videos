clear 
close all
filefld = '/home/ambuj/MVF/DFT_MVF/TrainCSV/';
csvfilePath = '/home/ambuj/MVF/DFT_MVF/CSV/';
testData = csvread([csvfilePath,'Iteration-1-TrainData.csv']);
testLb = csvread([csvfilePath,'Iteration-1-Trainlb.csv']);
fileLb = testLb(:,2);
testLb = testLb(:,1);
% fileLb = csvread([csvfilePath,'Iteration-1-Filelb-F.csv']);
n = unique(testLb);
for i = 1:size(n,1)
    inx = find(testLb==i);
    tempData = testData(inx,:);
    tempfileLb = fileLb(inx,:);
    m = unique(tempfileLb);
    for j=1:size(m,1)
        inx1 = find(tempfileLb==j);
        X = tempData(inx1,:);
        L = tempfileLb(inx1,:);
        filename = [filefld,'TrainFileData_',int2str(i),'-',int2str(j),'.csv'];
        LBfilename = [filefld,'TrainFileLb_',int2str(i),'-',int2str(j),'.csv'];
        csvwrite(filename,X);
        csvwrite(LBfilename,L)
    end
end
