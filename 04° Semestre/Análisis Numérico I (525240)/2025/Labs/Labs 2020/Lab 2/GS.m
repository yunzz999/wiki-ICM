function g = GS(a)
    [m,n]=size(a);
    g=zeros(m,n);
    for i=1 : n
        v=zeros(m,1);
        for j=1:i-1
            k=productointerior(a(:,i),g(:,j))/(norm(g(:,j))*norm(g(:,j)));
            v=v+k*g(:,j);
        end
        w=a(:,i)-v;
        nw=norm(w);
        g(:,i)=w/nw;
    end
end