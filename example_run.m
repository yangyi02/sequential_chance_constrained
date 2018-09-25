% here is the runing file
clear; clc; close all;

Dim=20; % variable dimension
ConDim=10; % number of constraints
Alpha=0.05; % alpha
SampleSize=1000; % sample size
Eps=1; % epsilon for approximation
StopEps=0.001; % stopping criteria for dc loop
MaxIter=1000; % maximum iteration for an optimization (CVar or DC both)
MaxDCIter=15; % maximum number for dc loop
TolFun=1e-4; % tolerance function value for an optimization (CVar or DC both)
TolCon=1e-4; % tolerance constraint value for an optimization (CVar or DC both)

% main function in the example
[x_cvar, fval_cvar, runtime_cvar, x_eps, fval_eps, runtime_eps, x_dc, fval_dc, runtime_dc] ...
    =main_function(Dim,ConDim,Alpha,SampleSize,Eps,StopEps,MaxIter,MaxDCIter,TolFun,TolCon);

% plot
figure(1);
hold on;
plot(fval_dc,'b');
plot(fval_cvar*ones(1,length(fval_dc)),'r');
ylabel('function value')
legend('Iterative dc','CVaR');
hold off;