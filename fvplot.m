function fvplot(train_data,test_data,lb_train,lb_test)
close all
n = unique(lb_train);
for i =1:size(n,1)
    l = find(lb_train==i);
    p = find(lb_test==i);
    q = min(size(l,1),size(p,1));
    l = l(1:q,:);
    p = p(1:q,:);
    X = train_data(l,:);
    Y = test_data(p,:);
    Fx = fftshift(X); % Center FFT
    Fy = fftshift(Y);
% Fx = X;
% Fy = Y;
    Fx = abs(Fx); % Get the magnitude
    Fy = abs(Fy);
    Fx = log(Fx+1); % Use log, for perceptual scaling, and +1 since log(0) is undefined
    Fy = log(Fy+1);
    Fx = mat2gray(Fx); % Use mat2gray to scale the image between 0 and 1
    Fy = mat2gray(Fy);
    Fx = normr(Fx);
    Fy = normr(Fy);
    figure
   
    subplot(2,1,1)
    subimage(Fx) % Display the result
% surf(Fx)
    title('Training Data Feature Plot')
   
 
    subplot(2,1,2)
    
    subimage(Fy)
% surf(Fy)
    title('Test Data Feature Plot')
   
end