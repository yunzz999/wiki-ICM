function[An,bn,x,norma]=sistema(n)
An=zeros(n,n);
bn=zeros(n,1);
for i=1:n
    b(i)=i/(n-i+1);
    for j=1:n
        if i==j
            An(i,j)=n-i+1;
        end
        if i-j==1
            An(i,j)=j;
        end
        if i-j==-1
            An(i,j)=i;
        end
    end

    
    x=An\bn;
    norma=norm(An*x-bn);
end