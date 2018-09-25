% one convex approximation for dc
function [x fval runtime] = opt_dc(x0,maxiter,tolfun,tolcon)

global dim x_star f_star g_star;

% linear constraints and optimization set
lb=zeros(dim,1); % x>=lb
options=optimset('GradObj','on', 'GradConstr','on', ...
    'MaxFunEvals',maxiter, ...
    'TolFun',tolfun, 'TolCon',tolcon);

x_star=x0;
% Calculate linear approximation of concave part 
[f_star g_star] = lincave(x_star);

% optimize
tic;
[x,fval]=fmincon(@obj_fun,x0,[],[],[],[],lb,[],@con_fun_dc,options);
runtime=toc;