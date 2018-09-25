% return linear approximation for concave function f(x0) + f'(x0)*(x-x0)
% f is the f(x0)
% g is the f'(x0)
function [f g] = lincave(x)

global sample alpha sample_size condim dim;

L=zeros(condim,sample_size); % allocate memory
Grad=zeros(dim,sample_size,condim); % allocate memory
for i=1:condim
    L(i,:)=((sample(:,:,i).^2)*(x.^2))'-100; % calculate value for each constraint
    Grad(:,:,i)=2*(sample(:,:,i).^2)'.*(x*ones(1,sample_size));  % calculate gradient
end

[Z I]=max(L); % find the maximum constraint that dominate
G=zeros(dim,sample_size); % allocate memory
for i=1:sample_size
    G(:,i)=Grad(:,i,I(i)); % find the dominated constraint gradient
end

f = mean(Z.*(Z>=0))/alpha;
g = G*(Z>=0)'/sample_size/alpha;