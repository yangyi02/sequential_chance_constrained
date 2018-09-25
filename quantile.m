% quantile for constraints
function q = quantile(gamma,x)

global sample sample_size condim;

L=zeros(condim,sample_size);
for i=1:condim
    L(i,:)=((sample(:,:,i).^2)*(x.^2))'-100;
end

Z=max(L);

Z_sort=sort(Z); % Sort for taking quantile
q=Z_sort(ceil(sample_size*(1-gamma))); % Take the alpha quantile of constraint