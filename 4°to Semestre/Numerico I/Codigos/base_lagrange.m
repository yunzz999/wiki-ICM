n=size(xx,2);
L=ones(n,size(x,2));
hold on
for i=1:n
    for j=1:n
       if (i~=j)
          L(i,:)=L(i,:).*(x-xx(j))/(xx(i)-xx(j));
       end
    end
    plot(x,L(i,:))
end
hold off
