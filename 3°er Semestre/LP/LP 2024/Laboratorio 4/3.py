k=int(input())
n=int(input())


sum=0
resto=0
for i in range (n):
    temp=int(input())
    current=temp+resto
    if(current>=k):
        resto=current-k
    else:
        resto=0

print(resto)