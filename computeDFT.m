function [Mag,Pha] = computeDFT(X,windowsize,shift)
[~,n] = size(X);
start = 1;
wEnd = windowsize;
%NFFT = 1024;
index = 1;
while wEnd <= n
    Y = X(:,start:wEnd);
    F = fftshift(fft(Y,windowsize,2));
    %fVals=(-NFFT/2:NFFT/2-1)/NFFT; %DFT Sample points	 	 
    P = angle(F);
    F = abs(F);	 
    
    start = start + shift ;
    wEnd = wEnd + shift;
   
    if index == 1
          m0 = F(:,1);
         m1 = F(:,2);
         m2 = F(:,3);
%           Mag = m0;
%           Mag = m1;
%          Mag = m2;
         Mag = [m0;m1;m2];
         Mag = [m0,m1,m2];
        Pha = P(:,1) ;
    else
%        Mag = [Mag,F(:,1)];
%         Mag = [Mag,F(:,2)];
%         Mag = [Mag,F(:,3)];
%C = [F(:,1);F(:,2);F(:,3)];
       % Mag = [Mag,C];
        Mag = [Mag,F(:,1),F(:,2),F(:,3)];
        Pha = [Pha,P(:,1)];
    end
       index = index+1;
end


end