function [cs, sn] = givens_rotation(v1, v2)
    t = sqrt(v1^2 + v2^2);
    cs = v1 / t;  
    sn = v2 / t;
end