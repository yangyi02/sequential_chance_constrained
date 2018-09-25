% epsilont approximation constraints
function [c,ceq,GC,GCeq] = con_fun_eps(x)

global sample alpha sample_size condim dim epsilon;

L=zeros(condim,sample_size); % allocate memory
Grad=zeros(dim,sample_size,condim);  % allocate memory
for i=1:condim
    L(i,:)=((sample(:,:,i).^2)*(x.^2))'-100; % calculate value for each constraint
    Grad(:,:,i)=2*(sample(:,:,i).^2)'.*(x*ones(1,sample_size));  % calculate gradient
end

[Z I]=max(L); % find the maximum constraint that dominate
G=zeros(dim,sample_size); % allocate memory
for i=1:sample_size
    G(:,i)=Grad(:,i,I(i)); % find the dominated constraint gradient
end

c=mean((Z+epsilon).*(Z>=-epsilon))/alpha-epsilon; % nonlinear constraint
GC = G*(Z>=-epsilon)'/sample_size/alpha; % nonlinear constraint gradient
ceq = []; % nonlinear equality constraint
GCeq = []; % nonlinear equality con gradient