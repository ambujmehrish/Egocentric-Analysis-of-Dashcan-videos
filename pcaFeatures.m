function Mpca = pcaFeatures(Y)
[m,n] = size(Y);
xi = mean(Y,2);
phi = xi.*ones(m,n);
A = Y - phi;
B = (A)'*A;
[coeff,score,latent,~,explained] = pca(B);% Compute PCA
variance = 0;
for i = 1:size(explained,1)
    if variance <=95
        variance = variance+double(explained(i));
        d = i;
    end
end
%covarianceMatrix = cov(B);
%[V,D] = eig(covarianceMatrix);
%dataInPrincipalComponentSpace = B*coeff
%score
%corrcoef(dataInPrincipalComponentSpace)
%var(dataInPrincipalComponentSpace)'
%latent
%sort(diag(D),'descend')
uk = A*coeff;
Mpca = uk(:,1:d); % Selecting components with 99% variance.
end