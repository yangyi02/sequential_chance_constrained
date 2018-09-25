# sequential_chance_constrained

examplerun.m: runing file, first open

mainfunction.m: including generating samples, apply cvar approximation, epsilon approximation and dc approximation, return results for a particular setting

gensample.m: generate normal distributions for all random variables

obj_fun.m: objective function

quantile.m: quantile for constraints

opt_cvar.m, opt_dc.m, opt_eps.m: optimization for cvar, one step dc approximation, epsilon approximation

con_fun_cvar.m, con_fun_dc.m, con_fun_eps.m: constraints for cvar, one step dc approximation, epsilon approximation

lincave.m: linear approximation for concave function
