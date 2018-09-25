% generate sample for the problem
function sample=gensample(dim,condim,sample_size)

sample=zeros(sample_size,dim,condim);
for i=1:condim
    sample(:,:,i)=normrnd(0,1,sample_size,dim); % 3d matrix
    % size: sample_size x dim x condim
    % each 2d matrix is for one constraint
end