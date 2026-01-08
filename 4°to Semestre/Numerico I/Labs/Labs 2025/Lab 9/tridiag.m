function M = tridiag(n,a,b,c)
    M=a*eye(n);
    M=M+b*diag(ones(n-1,1),1);
    M=M+c*diag(ones(n-1,1),-1);
end