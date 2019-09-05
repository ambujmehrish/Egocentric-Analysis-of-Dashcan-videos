clear 
%close all
 fld = 'Q/W5S2/';
 files = dir(fld);
 files = files(3:end,:);
 th = 0.01:0.01:1;
 % rank = 1:1:5;
  T = zeros(size(th,2),1);
     F = zeros(size(th,2),1);
 for i =1:size(files,1)
     filename = [fld,'Q_W5S2_',int2str(i),'.mat'];
     temp = load(filename);
     Q = temp.Q;
     
     for j=1:size(th,2)
     [~,~,Mat] = accuracy(Q,th(j));
     [C,D] = sepTh(Mat);
     [~,tp,fp] = acc_roc(C,D,th(j));
     TP(j,1) = tp;
     FP(j,1) = fp;
    
     end
     T = T+TP;
     F = F + FP;
    
 end
T = T/size(files,1);
F = F/size(files,1);
% plot(F,T)