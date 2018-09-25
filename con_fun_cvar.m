% Conditional value at risk constraints
function [c,ceq,GC,GCeq] = con_fun_cvar(x)

global sample alpha sample_size condim dim;

L=zeros(condim,sample_size); % allocate memory
Grad=zeros(dim,sample_size,condim); % allocate memory
for i=1:condim
    L(i,:)=((sample(:,:,i).^2)*(x.^2))'-100; % calculate value for each constraint
    Grad(:,:,i)=2*(sample(:,:,i).^2)'.*(x*ones(1,sample_size)); % calculate gradient
end

[Z I]=max(L); % find the maximum constraint that dominate
G=zeros(dim,sample_size);  % allocate memory
for i=1:sample_size
    G(:,i)=Grad(:,i,I(i)); % find the dominated constraint gradient
end

Z_sort=sort(Z); % sort for taking quantile
q=Z_sort(ceil(sample_size*(1-alpha))); % take the alpha quantile of constraint

c=mean(Z.*(Z>=q))/alpha; % nonlinear constraint
GC = G*(Z>=q)'/sample_size/alpha; % nonlinear constraint gradient
ceq = []; % nonlinear equality constraint
GCeq = []; % nonlinear equality con gradient