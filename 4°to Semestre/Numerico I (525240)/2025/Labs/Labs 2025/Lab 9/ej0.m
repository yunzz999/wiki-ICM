function M =ej0(n,a,b,c)
M=zeros(n,n);
for i=1:n
    for j= 1:n
        if i==j
           M(i,j)=a; 
        
        elseif i==j-1
            M(i,j)=b;
  
        elseif i==j+1
            M(i,j)=c;
        end
    end
end 
end
      
