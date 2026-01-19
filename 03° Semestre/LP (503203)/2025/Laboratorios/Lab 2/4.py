n=int(input("n: "))
m=int(input("m: "))
x=int(input("x: "))
y=int(input("y: "))

if(x==n or y==m):
    print("Frontera")
if(x>n and y>m):
    print("Nlogonia Nororiental")
if(x<n and y>m):
    print("Nlogonia Noroccidental")
if(x>n and y<m):
    print("Nlogonia Sudoriental")
if(x<n and y<m):
    print("Nlogonia Sudoccidental")