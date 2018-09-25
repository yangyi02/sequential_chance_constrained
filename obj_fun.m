% objective function
function [fval, fgrad]=obj_fun(x)

global dim;

% sum over
fval=-sum(x);

if nargout > 1
    fgrad=-ones(dim,1);
end