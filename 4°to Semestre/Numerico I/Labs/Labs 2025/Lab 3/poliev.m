function [r]=poliev(x,A,dim)
    r=0;
    for i=1:dim
        r=r+x^(i-1)*A(i);
    end
end