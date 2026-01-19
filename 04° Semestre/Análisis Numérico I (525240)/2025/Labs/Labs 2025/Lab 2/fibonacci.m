function [fn]=fibonacci(n)
v=zeros(n,1);
v(1)=1;
v(2)=1;
for i=3:n
    v(i) = v(i-1) + v(i-2);
end
fn=v(n);
end
