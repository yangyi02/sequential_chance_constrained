% joint chance constrained programming
function [x_cvar fval_cvar runtime_cvar x_eps fval_eps runtime_eps x_dc fval_dc runtime_dc] ...
    =mainfunction(Dim,ConDim,Alpha,SampleSize,Eps,StopEps,MaxIter,MaxDCIter,TolFun,TolCon)

global dim condim alpha sample sample_size epsilon;

dim=Dim; % dim is the dimension of random vector

condim=ConDim; % condim is the number of constraints

alpha=Alpha; % alpha is the probabilistic constraint level

sample_size=SampleSize; % number of random samples

% sample is a 3d matrix, with size: sample_size x dim x condim 
sample=gensample(dim,condim,sample_size); % generate random vector

epsilon=Eps; % epsilon for approximation

stopepsilon=StopEps; % stopping criteria

maxiter=MaxIter; % maximum iteration for each optimization

maxdciter=MaxDCIter; % maximum iteration for dc loop

tolfun=TolFun; % tolerance function value in optimization

tolcon=TolCon; % tolerance constraint value in optimization

% set starting point
x0=zeros(dim,1);

% run cvar at the first time
[x_cvar fval_cvar runtime_cvar]=opt_cvar(x0,maxiter,tolfun,tolcon);
q_cvar=quantile(alpha,x_cvar);

% run epsilon var approximation at the first time
[x_eps fval_eps runtime_eps]=opt_eps(x0,maxiter,tolfun,tolcon);
q_eps=quantile(alpha,x_eps);

% run dc iterative run, fix epsilon right now
x_dc(:,1)=x_eps;
fval_dc(1)=fval_eps;
runtime_dc(1)=runtime_eps;
for i=2:maxdciter
    x_star=x_dc(:,i-1);
    [x_dc(:,i) fval_dc(i) runtime_dc(i)] = opt_dc(x_dc(:,i-1),maxiter,tolfun,tolcon);
    if abs(fval_dc(i)-fval_dc(i-1)) < stopepsilon
       break; 
    end
end