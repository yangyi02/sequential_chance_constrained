% epsilon approximation optimization
function [x fval runtime] = opt_eps(x0,maxiter,tolfun,tolcon)

global dim;

% linear constraints and optimization set
lb=zeros(dim,1); % x>=lb
options=optimset('GradObj','on', 'GradConstr','on', ...
    'MaxFunEvals',maxiter, ...
    'TolFun',tolfun, 'TolCon',tolcon);

% optimize
tic;
[x,fval]=fmincon(@obj_fun,x0,[],[],[],[],lb,[],@con_fun_eps,options);
runtime=toc;