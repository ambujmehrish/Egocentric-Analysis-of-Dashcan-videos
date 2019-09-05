clear 
%close all
 fld = 'Q/W5S2/';
 files = dir(fld);
 files = files(3:end,:);
 rank = 1:1:5;
  N = 1;
  cs = zeros(1,20);
  s = 0;
 for i =1:size(files,1)
     filename = [fld,'Q_W5S2_',int2str(i),'.mat'];
     temp = load(filename);
     Q = temp.Q;
     
     [acc,classAcc] = accuracy_max(Q,1);
     s = s+acc;
     cs = cs+classAcc; 
 
 end
 avgAcc = s/10;
 avgclassAcc = classAcc/10;
